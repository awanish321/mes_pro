//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:flutter/foundation.dart' show kIsWeb;
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
//     _loadExcelFiles();
//   }
//
//   Future<void> _loadExcelFiles() async {
//     // Fetch documents from Firestore
//     QuerySnapshot querySnapshot = await _firestore.collection('excel_files').get();
//
//     setState(() {
//       _fileNames.clear();
//       _filePaths.clear();
//
//       for (var doc in querySnapshot.docs) {
//         _fileNames.add(doc['name']);
//         _filePaths.add(doc['url']);
//       }
//     });
//
//     if (_fileNames.isEmpty) {
//       // If no documents in Firestore, load default files
//       await _loadDefaultFiles();
//     }
//   }
//
//   Future<void> _loadDefaultFiles() async {
//     List<String> defaultFileNames = ['Belly Meter', 'R10 NIC', 'R26 Main Board'];
//     List<String> defaultAssetPaths = [
//       "assets/excel/1P SEM Belly Meter Assembly BOM.xlsx",
//       "assets/excel/Electronics BOM_ R10 of 1P SEM NIC 4G CARD BELLY MODEL(EPCB-005_R05)_260724.xlsx",
//       "assets/excel/Electronics BOM_ R26 of 1P SEM Main Board BELLY MODEL(EPCB-006_R09)_150624.xlsx"
//     ];
//
//     for (int i = 0; i < defaultFileNames.length; i++) {
//       String fileName = defaultFileNames[i];
//       String assetPath = defaultAssetPaths[i];
//
//       if (kIsWeb) {
//         // For web, we can't write to local storage, so we'll upload to Firebase Storage
//         ByteData data = await rootBundle.load(assetPath);
//         List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//         await _uploadToFirebaseStorage(fileName, bytes);
//       } else {
//         // For mobile and desktop
//         Directory directory = await getApplicationDocumentsDirectory();
//         String filePath = '${directory.path}/$fileName.xlsx';
//
//         if (!File(filePath).existsSync()) {
//           ByteData data = await rootBundle.load(assetPath);
//           List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//           await File(filePath).writeAsBytes(bytes);
//           await _uploadToFirebaseStorage(fileName, bytes);
//         }
//       }
//     }
//
//     await _loadExcelFiles(); // Reload files after uploading defaults
//   }
//
//   Future<void> _uploadToFirebaseStorage(String fileName, List<int> bytes) async {
//     String filePath = 'excel_files/$fileName.xlsx';
//     await _storage.ref(filePath).putData(Uint8List.fromList(bytes));
//     String downloadUrl = await _storage.ref(filePath).getDownloadURL();
//
//     await _firestore.collection('excel_files').add({
//       'name': fileName,
//       'url': downloadUrl,
//     });
//   }
//
//   Future<void> openFile(String filePath) async {
//     if (kIsWeb) {
//       html.window.open(filePath, '_blank');
//     } else {
//       final result = await OpenFilex.open(filePath);
//       print(result.type);
//       print(result.message);
//     }
//   }
//
//   Future<void> addNewFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['xlsx', 'xls'],
//     );
//
//     if (result != null) {
//       String fileName = result.files.single.name;
//       List<int> bytes = result.files.single.bytes!;
//
//       await _uploadToFirebaseStorage(fileName, bytes);
//       await _loadExcelFiles(); // Reload files after adding new one
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10)
//         ),
//         onPressed: addNewFile,
//         backgroundColor: Colors.blue,
//         child: const Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.blue,
//         title: const Text('Sub Assembly Set'),
//       ),
//       body: _filePaths.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : GridView.builder(
//         padding: const EdgeInsets.all(10.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: 3 / 2,
//         ),
//         itemCount: _fileNames.length,
//         itemBuilder: (context, index) {
//           return GridTile(
//             child: GestureDetector(
//               onTap: () => openFile(_filePaths[index]),
//               child: Container(
//                 color: Colors.blue,
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Icon(Icons.insert_drive_file, color: Colors.white, size: 50),
//                       const SizedBox(height: 10),
//                       Text(
//                         _fileNames[index],
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

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
    _loadExcelFiles();
  }

  Future<void> _loadExcelFiles() async {
    // Fetch documents from Firestore
    QuerySnapshot querySnapshot = await _firestore.collection('excel_files').get();

    setState(() {
      _fileNames.clear();
      _filePaths.clear();

      for (var doc in querySnapshot.docs) {
        _fileNames.add(doc['name']);
        _filePaths.add(doc['url']);
      }
    });

    if (_fileNames.isEmpty) {
      // If no documents in Firestore, load default files
      await _loadDefaultFiles();
    }
  }

  Future<void> _loadDefaultFiles() async {
    List<String> defaultFileNames = ['Belly Meter', 'R10 NIC', 'R26 Main Board'];
    List<String> defaultAssetPaths = [
      "assets/excel/1P SEM Belly Meter Assembly BOM.xlsx",
      "assets/excel/Electronics BOM_ R10 of 1P SEM NIC 4G CARD BELLY MODEL(EPCB-005_R05)_260724.xlsx",
      "assets/excel/Electronics BOM_ R26 of 1P SEM Main Board BELLY MODEL(EPCB-006_R09)_150624.xlsx"
    ];

    for (int i = 0; i < defaultFileNames.length; i++) {
      String fileName = defaultFileNames[i];
      String assetPath = defaultAssetPaths[i];

      if (kIsWeb) {
        // For web, we can't write to local storage, so we'll upload to Firebase Storage
        ByteData data = await rootBundle.load(assetPath);
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await _uploadToFirebaseStorage(fileName, bytes);
      } else {
        // For mobile and desktop
        Directory directory = await getApplicationDocumentsDirectory();
        String filePath = '${directory.path}/$fileName.xlsx';

        if (!File(filePath).existsSync()) {
          ByteData data = await rootBundle.load(assetPath);
          List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
          await File(filePath).writeAsBytes(bytes);
          await _uploadToFirebaseStorage(fileName, bytes);
        }
      }
    }

    await _loadExcelFiles(); // Reload files after uploading defaults
  }

  Future<void> _uploadToFirebaseStorage(String fileName, List<int> bytes) async {
    String filePath = 'excel_files/$fileName.xlsx';
    await _storage.ref(filePath).putData(Uint8List.fromList(bytes));
    String downloadUrl = await _storage.ref(filePath).getDownloadURL();

    await _firestore.collection('excel_files').add({
      'name': fileName,
      'url': downloadUrl,
    });
  }

  Future<void> openFile(String filePath) async {
    if (kIsWeb) {
      html.window.open(filePath, '_blank');
    } else {
      final result = await OpenFilex.open(filePath);
      print(result.type);
      print(result.message);
    }
  }

  Future<void> addNewFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {
      String fileName = result.files.single.name;
      List<int> bytes = result.files.single.bytes!;

      await _uploadToFirebaseStorage(fileName, bytes);
      await _loadExcelFiles(); // Reload files after adding new one
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
        onPressed: addNewFile,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: const Text('Sub Assembly Set'),
      ),
      body: _filePaths.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (screenWidth > 600) ? 4 : 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (screenWidth > 600) ? 2 : 1.5, // Adjust aspect ratio based on screen width
        ),
        itemCount: _fileNames.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: GestureDetector(
              onTap: () => openFile(_filePaths[index]),
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
                          size: (screenWidth > 600) ? 40 : 20, // Icon size adjustment
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
