import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExcelUploader extends StatefulWidget {
  const ExcelUploader({super.key});

  @override
  _ExcelUploaderState createState() => _ExcelUploaderState();
}

class _ExcelUploaderState extends State<ExcelUploader> {
  final List<String> _fileNames = ['Belly Meter', 'R10 NIC', 'R26 Main Board'];
  final List<String> _filePaths = ["assets/excel/1P SEM Belly Meter Assembly BOM.xlsx", "assets/excel/Electronics BOM_ R10 of 1P SEM NIC 4G CARD BELLY MODEL(EPCB-005_R05)_260724.xlsx", "assets/excel/Electronics BOM_ R26 of 1P SEM Main Board BELLY MODEL(EPCB-006_R09)_150624.xlsx"];

  @override
  void initState() {
    super.initState();
    _loadExcelFiles();
  }

  // Load Excel files from assets and store in local storage
  Future<void> _loadExcelFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Directory directory = await getApplicationDocumentsDirectory();

    for (String fileName in _fileNames) {
      String filePath = '${directory.path}/$fileName';

      // Check if file already exists in local storage
      if (!File(filePath).existsSync()) {
        ByteData data = await rootBundle.load('assets/excel_files/$fileName');
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(filePath).writeAsBytes(bytes);
      }

      // Save the file path to SharedPreferences
      await prefs.setString(fileName, filePath);
      _filePaths.add(filePath);
    }

    setState(() {});
  }

  Future<void> openFile(String filePath) async {
    await OpenFilex.open(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Excel File Uploader')),
      body: _filePaths.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: _fileNames.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: GestureDetector(
              onTap: () => openFile(_filePaths[index]),
              child: Container(
                color: Colors.blueAccent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.insert_drive_file, color: Colors.white, size: 50),
                      const SizedBox(height: 10),
                      Text(
                        _fileNames[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

void main() {
  runApp(const MaterialApp(home: ExcelUploader()));
}
