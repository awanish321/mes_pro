//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:barcode_widget/barcode_widget.dart';
// import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/laser_marking.dart';
// import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/pcb_load.dart';
// import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_inspection.dart';
// import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_printing.dart';
// import '../Services/bar_code_service.dart';
//
// class SMTLineStage1Screen extends StatefulWidget {
//   const SMTLineStage1Screen({super.key});
//
//   @override
//   State<SMTLineStage1Screen> createState() => _SMTLineStage1ScreenState();
// }
//
// class _SMTLineStage1ScreenState extends State<SMTLineStage1Screen> {
//   final List<String> items = [
//     "PCB Load",
//     "Laser Marking",
//     "Solder Paste Printing EbyDEK",
//     "Solder Paste Inspection MV110e",
//   ];
//
//   final List<String> images = [
//     "assets/pcb-board.png",
//     "assets/laser.png",
//     "assets/soldering.png",
//     "assets/icons8-solder-50.png",
//   ];
//
//   Map<String, String> barcodeData = {};
//   bool showBarcodeData = false;
//
//   int? hoveredIndex;
//
//   final MockBarcodeService _barcodeService = MockBarcodeService();
//
//   @override
//   void initState() {
//     super.initState();
//     barcodeData = _barcodeService.getLastScannedData();
//     _barcodeService.barcodeStream.listen((data) {
//       setState(() {
//         barcodeData = data;
//         showBarcodeData = true;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _barcodeService.dispose();
//     super.dispose();
//   }
//
//   String get barcodeContent {
//     return barcodeData.entries.map((e) => "${e.key}:${e.value}").join("|");
//   }
//
//   void toggleBarcodeData() {
//     setState(() {
//       showBarcodeData = !showBarcodeData;
//       if (showBarcodeData) {
//         barcodeData = _barcodeService.getLastScannedData();
//       }
//     });
//   }
//
//   Future<void> scanBarcode() async {
//     try {
//       String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//         "#ff6666",
//         "Cancel",
//         true,
//         ScanMode.BARCODE,
//       );
//
//       if (barcodeScanRes != '-1') {
//         Map<String, String> newData = Map.from(barcodeData);
//         newData['Scanned Barcode'] = barcodeScanRes;
//         _barcodeService.scanBarcode(newData);
//       }
//     } catch (e) {
//       print("Error scanning barcode: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     bool isDesktop = screenWidth >= 1200;
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.orange,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//         ),
//         title: const Text("SMT Line Stage - 1", style: TextStyle(color: Colors.black)),
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: isDesktop ? 6 : 3,
//                   crossAxisSpacing: 8.0,
//                   mainAxisSpacing: 8.0,
//                   childAspectRatio: 1,
//                 ),
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return MouseRegion(
//                     onEnter: (_) {
//                       setState(() {
//                         hoveredIndex = index;
//                       });
//                     },
//                     onExit: (_) {
//                       setState(() {
//                         hoveredIndex = null;
//                       });
//                     },
//                     child: GestureDetector(
//                       onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => getPageForItem(items[index]),
//                             ),
//                           );
//                       },
//                       child: AnimatedContainer(
//                         duration: const Duration(milliseconds: 200),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           color: Colors.orange,
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: hoveredIndex == index
//                               ? [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               blurRadius: 12,
//                               offset: const Offset(0, 4),
//                             ),
//                           ]
//                               : [],
//                         ),
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   child: Image.asset(
//                                     images[index],
//                                     fit: BoxFit.contain,
//                                     height: 50,
//                                     width: 50,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   items[index],
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   const Text(
//                     "Scan this barcode",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: scanBarcode,
//                     child: BarcodeWidget(
//                       barcode: Barcode.code128(),
//                       data: barcodeContent,
//                       width: 200,
//                       height: 80,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Tap the barcode to scan",
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: toggleBarcodeData,
//                     child: Text(showBarcodeData ? "Hide Table" : "Show Table"),
//                   ),
//                 ],
//               ),
//             ),
//             if (showBarcodeData)
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: isDesktop ? buildDesktopCard() : buildNormalTable(),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildDesktopCard() {
//     return SizedBox(
//       height: 300,
//       width: 400,
//       child: Center(
//         child: Card(
//           elevation: 4,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: buildTable(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildNormalTable() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: buildTable(),
//     );
//   }
//
//   Widget buildTable() {
//     return Table(
//       border: TableBorder.all(
//           color: Colors.grey.withOpacity(0.5),
//           width: 2,
//           borderRadius: BorderRadius.circular(5)
//       ),
//       children: [
//         TableRow(
//           decoration: BoxDecoration(
//               color: Colors.orange,
//               borderRadius: BorderRadius.circular(5)
//           ),
//           children: const [
//             TableCell(child: Center(child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("Production Details", style: TextStyle(fontWeight: FontWeight.bold)),
//             ))),
//             TableCell(child: Center(child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("Value", style: TextStyle(fontWeight: FontWeight.bold)),
//             ))),
//           ],
//         ),
//         ...barcodeData.entries.map((entry) {
//           return TableRow(
//             decoration: BoxDecoration(
//               color: entry.key == "Shift" || entry.key == "Lot ID" || entry.key == "Employee Name" || entry.key == "Processing Items" || entry.key == "Finished Items"
//                   ? Colors.yellow
//                   : Colors.white,
//             ),
//             children: [
//               TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(entry.key))),
//               TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(entry.value))),
//             ],
//           );
//         }).toList(),
//       ],
//     );
//   }
//
// }
//
//
//   Widget getPageForItem(String item) {
//     switch (item) {
//       case "PCB Load":
//         return const PcbLoadScreen();
//       case "Laser Marking":
//         return const LaserMarkingScreen();
//       case "Solder Paste Printing EbyDEK":
//         return const SolderPastePrintingScreen();
//       case "Solder Paste Inspection MV110e":
//         return const SolderPasteInspectionScreen();
//       default:
//         return const SMTLineStage1Screen();
//     }
//   }



/*
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/laser_marking.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/pcb_load.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_inspection.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_printing.dart';
import '../Services/bar_code_service.dart';

class SMTLineStage1Screen extends StatefulWidget {
  const SMTLineStage1Screen({super.key});

  @override
  State<SMTLineStage1Screen> createState() => _SMTLineStage1ScreenState();
}

class _SMTLineStage1ScreenState extends State<SMTLineStage1Screen> {
  final List<String> items = [
    "PCB Load",
    "Laser Marking",
    "Solder Paste Printing EbyDEK",
    "Solder Paste Inspection MV110e",
  ];

  final List<String> images = [
    "assets/pcb-board.png",
    "assets/laser.png",
    "assets/soldering.png",
    "assets/icons8-solder-50.png",
  ];

  final List<Map<String, String>> tableValues = [
    {
      "Total PCB Load": "100",
      "Process Complete": "48",
      "In Process": "52",
      "Job ID": "105",
      "Attendant ID": "12 TO 14 Digit",
      "Time Cycle": "25 Sec",
    },
    {
      "Total PCB Load": "120",
      "Process Complete": "60",
      "In Process": "60",
      "Job ID": "106",
      "Attendant ID": "13 TO 15 Digit",
      "Time Cycle": "30 Sec",
    },
    {
      "Total PCB Load": "90",
      "Process Complete": "40",
      "In Process": "50",
      "Job ID": "107",
      "Attendant ID": "11 TO 13 Digit",
      "Time Cycle": "20 Sec",
    },
    {
      "Total PCB Load": "110",
      "Process Complete": "55",
      "In Process": "55",
      "Job ID": "108",
      "Attendant ID": "14 TO 16 Digit",
      "Time Cycle": "28 Sec",
    },
  ];

  Map<String, String> barcodeData = {};
  bool showBarcodeData = false;

  int? hoveredIndex;

  final MockBarcodeService _barcodeService = MockBarcodeService();

  @override
  void initState() {
    super.initState();
    barcodeData = _barcodeService.getLastScannedData();
    _barcodeService.barcodeStream.listen((data) {
      setState(() {
        barcodeData = data;
        showBarcodeData = true;
      });
    });
  }

  @override
  void dispose() {
    _barcodeService.dispose();
    super.dispose();
  }

  String get barcodeContent {
    return barcodeData.entries.map((e) => "${e.key}:${e.value}").join("|");
  }

  void toggleBarcodeData() {
    setState(() {
      showBarcodeData = !showBarcodeData;
      if (showBarcodeData) {
        barcodeData = _barcodeService.getLastScannedData();
      }
    });
  }

  Future<void> scanBarcode() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );

      if (barcodeScanRes != '-1') {
        Map<String, String> newData = Map.from(barcodeData);
        newData['Scanned Barcode'] = barcodeScanRes;
        _barcodeService.scanBarcode(newData);
      }
    } catch (e) {
      print("Error scanning barcode: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 800;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text("SMT Line Stage - 1", style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop ? 6 : 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: isDesktop ? 0.8 : 4,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              hoveredIndex = index;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              hoveredIndex = null;
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => getPageForItem(items[index]),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: hoveredIndex == index
                                    ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                                    : [],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          images[index],
                                          fit: BoxFit.contain,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Expanded(
                                        child: Text(
                                          items[index],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isDesktop) ...[
                        const SizedBox(height: 8),
                        buildDesktopTable(tableValues[index]),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.green.shade300,
                            side: const BorderSide(color: Colors.green, width: 3)
                          ),
                          onPressed: () {
                            // Add functionality for the "Go" button
                            log("Go button pressed for ${items[index]}");
                          },
                          child: const Text("Go", style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Scan this barcode",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: scanBarcode,
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: barcodeContent,
                      width: 200,
                      height: 80,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Tap the barcode to scan",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: toggleBarcodeData,
                    child: Text(showBarcodeData ? "Hide Table" : "Show Table"),
                  ),
                ],
              ),
            ),
            if (showBarcodeData)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: isDesktop ? buildDesktopCard() : buildNormalTable(),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildDesktopTable(Map<String, String> values) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey.withOpacity(0.5),
        width: 1,
        borderRadius: BorderRadius.circular(5),
      ),
      children: values.entries.map((entry) {
        return TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(entry.key, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(entry.value, style: const TextStyle(fontSize: 12)),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget buildDesktopCard() {
    return SizedBox(
      height: 300,
      width: 400,
      child: Center(
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: buildTable(),
          ),
        ),
      ),
    );
  }

  Widget buildNormalTable() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: buildTable(),
    );
  }

  Widget buildTable() {
    return Table(
      border: TableBorder.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2,
          borderRadius: BorderRadius.circular(5)
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(5)
          ),
          children: const [
            TableCell(child: Center(child: Padding(
              padding: EdgeInsets.all(10),
              child: Text("Production Details", style: TextStyle(fontWeight: FontWeight.bold)),
            ))),
            TableCell(child: Center(child: Padding(
              padding: EdgeInsets.all(10),
              child: Text("Value", style: TextStyle(fontWeight: FontWeight.bold)),
            ))),
          ],
        ),
        ...barcodeData.entries.map((entry) {
          return TableRow(
            decoration: BoxDecoration(
              color: entry.key == "Shift" || entry.key == "Lot ID" || entry.key == "Employee Name" || entry.key == "Processing Items" || entry.key == "Finished Items"
                  ? Colors.yellow
                  : Colors.white,
            ),
            children: [
              TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(entry.key))),
              TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(entry.value))),
            ],
          );
        }).toList(),
      ],
    );
  }
}

Widget getPageForItem(String item) {
  switch (item) {
    case "PCB Load":
      return const PcbLoadScreen();
    case "Laser Marking":
      return const LaserMarkingScreen();
    case "Solder Paste Printing EbyDEK":
      return const SolderPastePrintingScreen();
    case "Solder Paste Inspection MV110e":
      return const SolderPasteInspectionScreen();
    default:
      return const SMTLineStage1Screen();
  }
}
 */





import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/laser_marking.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/pcb_load.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_inspection.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_printing.dart';
import '../Services/bar_code_service.dart';

class SMTLineStage1Screen extends StatefulWidget {
  const SMTLineStage1Screen({super.key});

  @override
  State<SMTLineStage1Screen> createState() => _SMTLineStage1ScreenState();
}

class _SMTLineStage1ScreenState extends State<SMTLineStage1Screen> {
  final List<String> items = [
    "PCB Load",
    "Laser Marking",
    "Solder Paste Printing EbyDEK",
    "Solder Paste Inspection MV110e",
  ];

  final List<String> images = [
    "assets/pcb-board.png",
    "assets/laser.png",
    "assets/soldering.png",
    "assets/icons8-solder-50.png",
  ];

  final List<Map<String, String>> tableValues = [
    {
      "Total PCB Load": "100",
      "Process Complete": "48",
      "In Process": "52",
      "Job ID": "105",
      "Attendant ID": "12 TO 14 Digit",
      "Time Cycle": "25 Sec",
    },
    {
      "Total PCB Load": "120",
      "Process Complete": "60",
      "In Process": "60",
      "Job ID": "106",
      "Attendant ID": "13 TO 15 Digit",
      "Time Cycle": "30 Sec",
    },
    {
      "Total PCB Load": "90",
      "Process Complete": "40",
      "In Process": "50",
      "Job ID": "107",
      "Attendant ID": "11 TO 13 Digit",
      "Time Cycle": "20 Sec",
    },
    {
      "Total PCB Load": "110",
      "Process Complete": "55",
      "In Process": "55",
      "Job ID": "108",
      "Attendant ID": "14 TO 16 Digit",
      "Time Cycle": "28 Sec",
    },
  ];

  Map<String, String> barcodeData = {};
  bool showBarcodeData = false;

  int? hoveredIndex;

  final MockBarcodeService _barcodeService = MockBarcodeService();

  @override
  void initState() {
    super.initState();
    barcodeData = _barcodeService.getLastScannedData();
    _barcodeService.barcodeStream.listen((data) {
      setState(() {
        barcodeData = data;
        showBarcodeData = true;
      });
    });
  }

  @override
  void dispose() {
    _barcodeService.dispose();
    super.dispose();
  }

  String get barcodeContent {
    return barcodeData.entries.map((e) => "${e.key}:${e.value}").join("|");
  }

  void toggleBarcodeData() {
    setState(() {
      showBarcodeData = !showBarcodeData;
      if (showBarcodeData) {
        barcodeData = _barcodeService.getLastScannedData();
      }
    });
  }

  Future<void> scanBarcode() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );

      if (barcodeScanRes != '-1') {
        Map<String, String> newData = Map.from(barcodeData);
        newData['Scanned Barcode'] = barcodeScanRes;
        _barcodeService.scanBarcode(newData);
      }
    } catch (e) {
      print("Error scanning barcode: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 800;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text("SMT Line Stage - 1", style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop ? 6 : 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isDesktop ? 0.7 : 4,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              hoveredIndex = index;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              hoveredIndex = null;
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => getPageForItem(items[index]),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: hoveredIndex == index
                                    ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ] : [],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          images[index],
                                          fit: BoxFit.contain,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Expanded(
                                        child: Text(
                                          items[index],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isDesktop) ...[
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 170,
                          child: SingleChildScrollView(
                            child: Expanded(child: buildDesktopTable(tableValues[index])),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.green.shade300,
                              side: const BorderSide(color: Colors.green, width: 3)
                          ),
                          onPressed: () {
                            log("Go button pressed for ${items[index]}");
                          },
                          child: const Text("Go", style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Scan this barcode",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: scanBarcode,
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: barcodeContent,
                      width: 200,
                      height: 80,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Tap the barcode to scan",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: toggleBarcodeData,
                    child: Text(showBarcodeData ? "Hide Table" : "Show Table"),
                  ),
                ],
              ),
            ),
            if (showBarcodeData)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: isDesktop ? buildDesktopCard() : buildNormalTable(),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildDesktopTable(Map<String, String> values) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey.withOpacity(0.5),
        width: 1,
        borderRadius: BorderRadius.circular(5),
      ),
      children: values.entries.map((entry) {
        return TableRow(
          decoration: const BoxDecoration(
            // color: Colors.orange
          ),
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(entry.key, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(entry.value, style: const TextStyle(fontSize: 12)),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget buildDesktopCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 400, // Fixed width for the card
          child: SingleChildScrollView(
            child: buildTable(),
          ),
        ),
      ),
    );
  }

  Widget buildNormalTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 400, // Fixed width for the table
        child: buildTable(),
      ),
    );
  }

  Widget buildTable() {
    return Table(
      border: TableBorder.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2,
          borderRadius: BorderRadius.circular(5)
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(5)
          ),
          children: const [
            TableCell(child: Center(child: Padding(
              padding: EdgeInsets.all(10),
              child: Text("Production Details", style: TextStyle(fontWeight: FontWeight.bold)),
            ))),
            TableCell(child: Center(child: Padding(
              padding: EdgeInsets.all(10),
              child: Text("Value", style: TextStyle(fontWeight: FontWeight.bold)),
            ))),
          ],
        ),
        ...barcodeData.entries.map((entry) {
          return TableRow(
            decoration: BoxDecoration(
              color: entry.key == "Shift" || entry.key == "Lot ID" || entry.key == "Employee Name" || entry.key == "Processing Items" || entry.key == "Finished Items"
                  ? Colors.yellow
                  : Colors.white,
            ),
            children: [
              TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(entry.key))),
              TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(entry.value))),
            ],
          );
        }).toList(),
      ],
    );
  }
}

Widget getPageForItem(String item) {
  switch (item) {
    case "PCB Load":
      return const PcbLoadScreen();
    case "Laser Marking":
      return const LaserMarkingScreen();
    case "Solder Paste Printing EbyDEK":
      return const SolderPastePrintingScreen();
    case "Solder Paste Inspection MV110e":
      return const SolderPasteInspectionScreen();
    default:
      return const SMTLineStage1Screen();
  }
}