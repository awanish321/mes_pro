import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/laser_marking.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/pcb_load.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_inspection.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_printing.dart';
import 'package:mes_pro/View/Screens/Sales%20Order/widgets/new_order_widgets.dart';
import 'package:mes_pro/View/Screens/Sales%20Order/widgets/order_in_production_widget.dart';
import 'package:mes_pro/View/Screens/Sales%20Order/widgets/pending_orders_widgets.dart';
import 'package:mes_pro/View/Screens/Sales%20Order/widgets/reschedule_orders_widget.dart';
import '../Services/bar_code_service.dart';

class SalesOrder extends StatefulWidget {
  const SalesOrder({super.key});

  @override
  State<SalesOrder> createState() => _SalesOrderState();
}

class _SalesOrderState extends State<SalesOrder> {
  final List<String> items = [
    "New Orders",
    "Pending Orders",
    "Order In Production",
    "Reschedule Orders",
  ];

  final List<String> images = [
    "assets/icons/new order.png",
    "assets/icons/pendingeorder.png",
    "assets/icons/production.png",
    "assets/icons/reschedule.png",
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
      "PCB Processed":"25",
      "Laser No. Start From": "1234567890",
      "Time Cycle" : "1.25 Sec"
    },
    {
      "Solder Paste Complete" : "9",
      "Time Cycle" : "25 Sec"
    },
    {
      "PCB OK" : "10",
      "PCB Reject": "3",
      "Time Cycle" : "25 Sec"
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
        backgroundColor: Colors.blueGrey.shade900,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text("Sales Order", style: TextStyle(color: Colors.black)),
      ),
      body: isDesktop ? buildDesktopLayout() : buildMobileLayout(),
    );
  }

  Widget buildDesktopLayout() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: buildGridView(true),
          ),
          VerticalDivider(color: Colors.blueGrey.shade900, width: 3),
          Expanded(
            flex: 1,
            child: buildBarcodeAndTable(),
          ),
        ],
      ),
    );
  }

  Widget buildMobileLayout() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          buildGridView(false),
          Divider(color: Colors.blueGrey.shade900, height: 3),
          buildBarcodeAndTable(),
        ],
      ),
    );
  }

  Widget buildGridView(bool isDesktop) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isDesktop ? 4 : 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: isDesktop ? 0.8 : 1,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return buildGridItem(index, isDesktop);
        },
      ),
    );
  }

  Widget buildGridItem(int index, bool isDesktop) {
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
                  color: Colors.blueGrey.shade900,
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
          SizedBox(
            height: 180,
            child: SingleChildScrollView(
              child: buildDesktopTable(tableValues[index]),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.green.shade300,
                side: const BorderSide(color: Colors.green, width: 3)),
            onPressed: () {
              log("Go button pressed for ${items[index]}");
            },
            child: const Text(
              "Go",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ],
    );
  }

  Widget buildBarcodeAndTable() {
    return Padding(
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
          if (showBarcodeData)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: buildDesktopCard(),
            ),
        ],
      ),
    );
  }

  Widget buildDesktopTable(Map<String, String> values) {
    return Table(
      border: TableBorder.all(
        color: Colors.black,
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
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 400,
          child: SingleChildScrollView(
            child: buildTable(),
          ),
        ),
      ),
    );
  }

  Widget buildTable() {
    return Table(
      border: TableBorder.all(
        color: Colors.black,
        width: 2,
        borderRadius: BorderRadius.circular(5),
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade900,
            borderRadius: BorderRadius.circular(5),
          ),
          children: const [
            TableCell(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Production Details", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Value", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
        ...barcodeData.entries.map((entry) {
          return TableRow(
            decoration: BoxDecoration(
              color: entry.key == "Shift" ||
                  entry.key == "Lot ID" ||
                  entry.key == "Employee Name" ||
                  entry.key == "Processing Items" ||
                  entry.key == "Finished Items"
                  ? Colors.yellow
                  : Colors.white,
            ),
            children: [
              TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(entry.key))),
              TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(entry.value))),
            ],
          );
        }),
      ],
    );
  }
}


  Widget getPageForItem(String item) {
    switch (item) {
      case "New Orders":
        return const NewOrdersWidgets();
      case "Pending Orders":
        return const PendingOrdersWidgets();
      case "Order In Production":
        return const OrderInProductionWidget();
      case "Reschedule Orders":
        return const RescheduleOrdersWidget();
      default:
        return const SalesOrder();
    }
  }