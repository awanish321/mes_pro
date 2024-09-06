import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:mes_pro/View/Screens/Human%20Resource/widgets/3d_aoi_mv6.dart';
import 'package:mes_pro/View/Screens/Human%20Resource/widgets/conform_coating_myc50.dart';
import 'package:mes_pro/View/Screens/Human%20Resource/widgets/de_panel_gam330_at_and_pcb_unload.dart';
import 'package:mes_pro/View/Screens/Human%20Resource/widgets/in_circuit_testing_condor.dart';
import 'package:mes_pro/View/Screens/Human%20Resource/widgets/pcba_cleaning_t20.dart';
import '../Services/bar_code_service.dart';

class HumanResource extends StatefulWidget {
  const HumanResource({super.key});

  @override
  State<HumanResource> createState() => _HumanResourceState();
}

class _HumanResourceState extends State<HumanResource> {
  final List<String> items = [
    "PCBA Cleaning (T-20)",
    "3D AOI MV6",
    "In circuit Testing (Condor)",
    "Conform Coating (MYC50)",
    "De-Panel GAM330 AT & PCB Unload"
  ];

  final List<String> images = [
    "assets/pcb-board.png",
    "assets/file.png",
    "assets/circuit.png",
    "assets/spray-gun.png",
    "assets/pcb-board.png"
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
    bool isDesktop = screenWidth >= 1200;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text("Human Resource", style: TextStyle(color: Colors.black)),
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
                  childAspectRatio: 1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return MouseRegion(
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
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.teal,
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
                                Text(
                                  items[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
              padding: EdgeInsets.all(8.0),
              child: Text("Production Details", style: TextStyle(fontWeight: FontWeight.bold)),
            ))),
            TableCell(child: Center(child: Padding(
              padding: EdgeInsets.all(8.0),
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
    case "PCBA Cleaning (T-20)":
      return const PCBACleaningT20();
    case "3D AOI MV6":
      return const DAOIMV6();
    case "In circuit Testing (Condor)":
      return const InCircuitTesting();
    case "Conform Coating (MYC50)":
      return const ConformCoatingMYC50();
    case "De-Panel GAM330 AT & PCB Unload":
      return const DePanelGAM330AtAndPCBUnload();
    default:
      return const HumanResource();
  }
}