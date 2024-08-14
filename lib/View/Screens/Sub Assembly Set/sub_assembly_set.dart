//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;
//
// class SubAssemblySetScreen extends StatefulWidget {
//   const SubAssemblySetScreen({super.key});
//
//   @override
//   State<SubAssemblySetScreen> createState() => _SubAssemblySetScreenState();
// }
//
// class _SubAssemblySetScreenState extends State<SubAssemblySetScreen> {
//   final List<String> _fileNames = [];
//   final List<String> _filePaths = [];
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFiles();
//   }
//
//   Future<void> _loadFiles() async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore.collection('files').get();
//
//       setState(() {
//         _fileNames.clear();
//         _filePaths.clear();
//
//         for (var doc in querySnapshot.docs) {
//           _fileNames.add(doc['name']);
//           _filePaths.add(doc['url']);
//         }
//       });
//     } catch (e) {
//       print("Error loading files from Firestore: $e");
//     }
//   }
//
//   Future<void> _uploadToFirebaseStorage(String fileName, List<int> bytes) async {
//     try {
//       String filePath = 'files/${Uri.encodeComponent(fileName)}';
//       await _storage.ref(filePath).putData(Uint8List.fromList(bytes));
//       String downloadUrl = await _storage.ref(filePath).getDownloadURL();
//
//       await _firestore.collection('files').add({
//         'name': fileName,
//         'url': downloadUrl,
//       });
//     } catch (e) {
//       print("Error uploading file to Firebase Storage: $e");
//     }
//   }
//
//   // Future<void> openFile(String filePath, String fileName) async {
//   //   try {
//   //     if (kIsWeb) {
//   //       html.window.open(filePath, '_blank');
//   //     } else {
//   //       // Download the file first
//   //       final http.Response response = await http.get(Uri.parse(filePath));
//   //
//   //       if (response.statusCode == 200) {
//   //         // Save the file locally with its original extension
//   //         final Directory tempDir = await getTemporaryDirectory();
//   //         final String localPath = path.join(tempDir.path, fileName);
//   //         final File localFile = File(localPath);
//   //         await localFile.writeAsBytes(response.bodyBytes);
//   //
//   //         // Open the local file
//   //         final result = await OpenFilex.open(localPath);
//   //         print(result.type);
//   //         print(result.message);
//   //
//   //         if (result.type != ResultType.done) {
//   //           // Handle the case where the file couldn't be opened
//   //           print("Couldn't open the file: ${result.message}");
//   //           // You might want to show a dialog or snackbar to the user here
//   //         }
//   //       } else {
//   //         print("Failed to download file: ${response.statusCode}");
//   //         // Handle the error, maybe show a snackbar to the user
//   //       }
//   //     }
//   //   } catch (e) {
//   //     print("Error opening file: $e");
//   //     // Handle the error, maybe show a snackbar to the user
//   //   }
//   // }
//
//   Future<void> openFile(String filePath, String fileName) async {
//     try {
//       if (kIsWeb) {
//         // For web, we'll use a more robust method to open the file
//         final response = await http.get(Uri.parse(filePath));
//         if (response.statusCode == 200) {
//           final blob = html.Blob([response.bodyBytes]);
//           final url = html.Url.createObjectUrlFromBlob(blob);
//           html.window.open(url, '_blank');
//           html.Url.revokeObjectUrl(url);
//         } else {
//           print("Failed to download file: ${response.statusCode}");
//           // Show an error message to the user
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to open file. Please try again.')),
//           );
//         }
//       } else {
//         // The existing code for non-web platforms remains the same
//         final http.Response response = await http.get(Uri.parse(filePath));
//
//         if (response.statusCode == 200) {
//           final Directory tempDir = await getTemporaryDirectory();
//           final String localPath = path.join(tempDir.path, fileName);
//           final File localFile = File(localPath);
//           await localFile.writeAsBytes(response.bodyBytes);
//
//           final result = await OpenFilex.open(localPath);
//           print(result.type);
//           print(result.message);
//
//           if (result.type != ResultType.done) {
//             print("Couldn't open the file: ${result.message}");
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Failed to open file. Please try again.')),
//             );
//           }
//         } else {
//           print("Failed to download file: ${response.statusCode}");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to download file. Please try again.')),
//           );
//         }
//       }
//     } catch (e) {
//       print("Error opening file: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred while opening the file.')),
//       );
//     }
//   }
//
//   Future<bool> checkFileExists(String url) async {
//     try {
//       final response = await http.head(Uri.parse(url));
//       return response.statusCode == 200 || response.statusCode == 302;
//     } catch (e) {
//       print("Error checking file existence: $e");
//       return false;
//     }
//   }
//
//   Future<void> addNewFiles() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.any,
//         allowMultiple: true,
//       );
//
//       if (result != null && result.files.isNotEmpty) {
//         for (var file in result.files) {
//           String? fileName = file.name;
//           List<int>? bytes = file.bytes;
//
//           if (fileName != null && bytes != null) {
//             await _uploadToFirebaseStorage(fileName, bytes);
//           } else if (file.path != null) {
//             final fileToRead = File(file.path!);
//             if (await fileToRead.exists()) {
//               bytes = await fileToRead.readAsBytes();
//               await _uploadToFirebaseStorage(fileName ?? "unknown", bytes);
//             } else {
//               print("File does not exist at ${file.path}");
//             }
//           } else {
//             print("File name or bytes are null for the selected file: ${fileName}");
//           }
//         }
//
//         await _loadFiles();
//       } else {
//         print("No files selected or result is null");
//       }
//     } catch (e) {
//       print("Error picking new files: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10)
//         ),
//         onPressed: addNewFiles,
//         backgroundColor: Colors.blue,
//         child: const Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.blue,
//         title: const Text('File Manager'),
//       ),
//       body: _filePaths.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : GridView.builder(
//         padding: const EdgeInsets.all(10.0),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: (screenWidth > 600) ? 4 : 3,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: (screenWidth > 600) ? 2 : 1.5,
//         ),
//         itemCount: _fileNames.length,
//         itemBuilder: (context, index) {
//           return GridTile(
//             child: GestureDetector(
//               onTap: () async {
//                 bool exists = await checkFileExists(_filePaths[index]);
//                 if (exists) {
//                   openFile(_filePaths[index], _fileNames[index]);
//                 } else {
//                   print("File does not exist at ${_filePaths[index]}");
//                   // Optionally, show a snackbar or dialog to inform the user
//                 }
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Icon(
//                           Icons.insert_drive_file,
//                           color: Colors.white,
//                           size: (screenWidth > 600) ? 40 : 20,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Expanded(
//                         child: Text(
//                           _fileNames[index],
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }





import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class SubAssemblySetScreen extends StatefulWidget {
  const SubAssemblySetScreen({super.key});

  @override
  State<SubAssemblySetScreen> createState() => _SubAssemblySetScreenState();
}

class _SubAssemblySetScreenState extends State<SubAssemblySetScreen> {
  final List<String> _fileNames = [];
  final List<String> _filePaths = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('files').get();

      setState(() {
        _fileNames.clear();
        _filePaths.clear();

        for (var doc in querySnapshot.docs) {
          _fileNames.add(doc['name']);
          _filePaths.add(doc['url']);
        }
      });
    } catch (e) {
      print("Error loading files from Firestore: $e");
    }
  }

  Future<void> _uploadToFirebaseStorage(String fileName, List<int> bytes) async {
    try {
      String filePath = 'files/${Uri.encodeComponent(fileName)}';
      await _storage.ref(filePath).putData(Uint8List.fromList(bytes));
      String downloadUrl = await _storage.ref(filePath).getDownloadURL();

      await _firestore.collection('files').add({
        'name': fileName,
        'url': downloadUrl,
      });
    } catch (e) {
      print("Error uploading file to Firebase Storage: $e");
    }
  }

  Future<bool> checkFileExists(String url) async {
    try {
      final storageRef = FirebaseStorage.instance.refFromURL(url);
      await storageRef.getMetadata();
      return true;
    } catch (e) {
      print("Error checking file existence: $e");
      return false;
    }
  }

  Future<void> openFile(String filePath, String fileName) async {
    try {
      if (kIsWeb) {
        html.window.open(filePath, '_blank');
      } else {
        final http.Response response = await http.get(Uri.parse(filePath));

        if (response.statusCode == 200) {
          final Directory tempDir = await getTemporaryDirectory();
          final String localPath = path.join(tempDir.path, fileName);
          final File localFile = File(localPath);
          await localFile.writeAsBytes(response.bodyBytes);

          final result = await OpenFilex.open(localPath);
          print(result.type);
          print(result.message);

          if (result.type != ResultType.done) {
            print("Couldn't open the file: ${result.message}");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to open file. Please try again.')),
            );
          }
        } else {
          print("Failed to download file: ${response.statusCode}");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to download file. Please try again.')),
          );
        }
      }
    } catch (e) {
      print("Error opening file: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred while opening the file.')),
      );
    }
  }

  Future<void> addNewFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        for (var file in result.files) {
          String? fileName = file.name;
          List<int>? bytes = file.bytes;

          if (bytes != null) {
            await _uploadToFirebaseStorage(fileName, bytes);
          } else if (file.path != null) {
            final fileToRead = File(file.path!);
            if (await fileToRead.exists()) {
              bytes = await fileToRead.readAsBytes();
              await _uploadToFirebaseStorage(fileName ?? "unknown", bytes);
            } else {
              print("File does not exist at ${file.path}");
            }
          } else {
            print("File name or bytes are null for the selected file: $fileName");
          }
        }

        await _loadFiles();
      } else {
        print("No files selected or result is null");
      }
    } catch (e) {
      print("Error picking new files: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        onPressed: addNewFiles,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: const Text('File Manager'),
      ),
      body: _filePaths.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (screenWidth > 600) ? 4 : 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (screenWidth > 600) ? 2 : 1.5,
        ),
        itemCount: _fileNames.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: GestureDetector(
              onTap: () async {
                bool exists = await checkFileExists(_filePaths[index]);
                if (exists) {
                  openFile(_filePaths[index], _fileNames[index]);
                } else {
                  print("File does not exist or is not accessible at ${_filePaths[index]}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('File not found or inaccessible. Please check your connection and try again.')),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.insert_drive_file,
                          color: Colors.white,
                          size: (screenWidth > 600) ? 40 : 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Text(
                          _fileNames[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}