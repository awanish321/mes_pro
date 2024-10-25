import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%202/widgets/2d_aoi.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%202/widgets/pcb_unload.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%202/widgets/smd_pick_place.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%202/widgets/solder_paste_reflow.dart';

class SMTLineStage2Screen extends StatefulWidget {
  const SMTLineStage2Screen({super.key});

  @override
  State<SMTLineStage2Screen> createState() => _SMTLineStage2ScreenState();
}

class _SMTLineStage2ScreenState extends State<SMTLineStage2Screen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> items = [
    "SMD Pick & Place",
    "Solder Paste Reflow",
    "2D AOI",
    "PCB Unload",
  ];

  final List<String> images = [
    "assets/chip.png",
    "assets/soldering.png",
    "assets/file.png",
    "assets/pcb-board.png",
  ];

  late List<Map<String, dynamic>> tableValues;
  late Map<String, String> productionData;
  Map<String, String> barcodeData = {};
  bool showBarcodeData = true;
  bool showProductionData = true;
  int? hoveredIndex;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeData();
    loadDataFromFirestore();
  }

  void initializeData() {
    tableValues = [
      {
        "Total PCB Processed": TextEditingController(),
        "Process Complete": "0",
        "In Process": "0",
        "Job ID": TextEditingController(),
        "Attendant ID": TextEditingController(),
        "Time Cycle": "0",
      },
      {
        "Process Complete": "0",
        "In Process": "0",
        "Temperature": TextEditingController(),
        "Time Cycle": "0",
      },
      {
        "PCB OK": "0",
        "PCB Reject": "0",
        "Inspection Time": TextEditingController(),
        "Time Cycle": "0",
      },
      {
        "Total PCB Unload": TextEditingController(),
        "PCB Pass": "0",
        "PCB Fail": "0",
        "Time Cycle": "0",
      },
    ];

    productionData = {
      'Shift': 'A',
      'Lot ID': 'LOT123',
      'Employee Name': 'John Doe',
      'Processing Items': '0',
      'Finished Items': '0',
      'Status': 'In Progress',
      'Start Time': DateTime.now().toString(),
      'Expected End Time': DateTime.now().add(const Duration(hours: 8)).toString(),
    };
  }

  Future<void> loadDataFromFirestore() async {
    try {
      setState(() => isLoading = true);

      // Load SMD Pick & Place data
      final smdSnapshot = await _firestore
          .collection('SMT Line Stage 2')
          .doc('SMD_PICK_PLACE')
          .get();

      if (smdSnapshot.exists) {
        final data = smdSnapshot.data();
        if (data != null) {
          setState(() {
            (tableValues[0]["Total PCB Processed"] as TextEditingController)
                .text = data['total_pcb_processed'] ?? '0';
            (tableValues[0]["Job ID"] as TextEditingController)
                .text = data['job_id'] ?? '';
            (tableValues[0]["Attendant ID"] as TextEditingController)
                .text = data['attendant_id'] ?? '';
            tableValues[0]["Process Complete"] = data['process_complete'] ?? '0';
            tableValues[0]["In Process"] = data['in_process'] ?? '0';
            tableValues[0]["Time Cycle"] = data['time_cycle'] ?? '0';
          });
        }
      }

      // Load Solder Paste Reflow data
      final reflowSnapshot = await _firestore
          .collection('SMT Line Stage 2')
          .doc('REFLOW')
          .get();

      if (reflowSnapshot.exists) {
        final data = reflowSnapshot.data();
        if (data != null) {
          setState(() {
            tableValues[1]["Process Complete"] = data['process_complete'] ?? '0';
            tableValues[1]["In Process"] = data['in_process'] ?? '0';
            (tableValues[1]["Temperature"] as TextEditingController)
                .text = data['temperature'] ?? '0';
            tableValues[1]["Time Cycle"] = data['time_cycle'] ?? '0';
          });
        }
      }

      // Load 2D AOI data
      final aoiSnapshot = await _firestore
          .collection('SMT Line Stage 2')
          .doc('AOI')
          .get();

      if (aoiSnapshot.exists) {
        final data = aoiSnapshot.data();
        if (data != null) {
          setState(() {
            tableValues[2]["PCB OK"] = data['pcb_ok'] ?? '0';
            tableValues[2]["PCB Reject"] = data['pcb_reject'] ?? '0';
            (tableValues[2]["Inspection Time"] as TextEditingController)
                .text = data['inspection_time'] ?? '0';
            tableValues[2]["Time Cycle"] = data['time_cycle'] ?? '0';
          });
        }
      }

      // Load PCB Unload data
      final unloadSnapshot = await _firestore
          .collection('SMT Line Stage 2')
          .doc('PCB_UNLOAD')
          .get();

      if (unloadSnapshot.exists) {
        final data = unloadSnapshot.data();
        if (data != null) {
          setState(() {
            (tableValues[3]["Total PCB Unload"] as TextEditingController)
                .text = data['total_pcb_unload'] ?? '0';
            tableValues[3]["PCB Pass"] = data['pcb_pass'] ?? '0';
            tableValues[3]["PCB Fail"] = data['pcb_fail'] ?? '0';
            tableValues[3]["Time Cycle"] = data['time_cycle'] ?? '0';
          });
        }
      }

      // Load Production Data
      final productionDoc = await _firestore
          .collection('SMT Line Stage 2')
          .doc('PRODUCTION_DATA')
          .get();

      if (productionDoc.exists) {
        final data = productionDoc.data();
        if (data != null) {
          setState(() {
            productionData = Map<String, String>.from(data);
          });
        }
      }

    } catch (e) {
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading data: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> saveDataToFirestore(int tableIndex) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      Map<String, dynamic> data = {};
      tableValues[tableIndex].forEach((key, value) {
        if (value is TextEditingController) {
          data[key.toLowerCase().replaceAll(' ', '_')] = value.text;
        } else {
          data[key.toLowerCase().replaceAll(' ', '_')] = value;
        }
      });

      String collectionPath = 'SMT Line Stage 2';
      String documentId = '';

      switch (items[tableIndex]) {
        case "SMD Pick & Place":
          documentId = 'SMD_PICK_PLACE';
          break;
        case "Solder Paste Reflow":
          documentId = 'REFLOW';
          break;
        case "2D AOI":
          documentId = 'AOI';
          break;
        case "PCB Unload":
          documentId = 'PCB_UNLOAD';
          break;
      }

      await _firestore.collection(collectionPath).doc(documentId).set(
        data,
        SetOptions(merge: true),
      );

      // Update production data
      await _firestore.collection(collectionPath).doc('PRODUCTION_DATA').set(
        productionData,
        SetOptions(merge: true),
      );

      if(mounted){
        Navigator.pop(context); // Close loading dialog
      }

      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data saved successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {

      if(mounted){
        Navigator.pop(context); // Close loading dialog
      }
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving data: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 800;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple.shade900,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "SMT Line Stage - 2",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: loadDataFromFirestore,
          ),
        ],
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
          VerticalDivider(color: Colors.purple.shade900, width: 3),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                buildProductionDetailsTable(),
              ],
            ),
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
          Divider(color: Colors.purple.shade900, height: 3),
          buildProductionDetailsTable(),
        ],
      ),
    );
  }

  // Rest of the widgets remain the same as in your original code,
  // but with centered content in tables as implemented in Stage 1

  // Note: Include all the remaining widget methods:
  // - buildGridView()
  // - buildGridItem()
  // - buildDesktopTable()
  // - buildBarcodeSection()
  // - buildProductionDetailsTable()
  // - getPageForItem()


  // Add these widget implementations to the _SMTLineStage2ScreenState class

  Widget buildGridView(bool isDesktop) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isDesktop ? 4 : 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: isDesktop ? 0.7 : 0.9,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => buildGridItem(index, isDesktop),
      ),
    );
  }

  Widget buildGridItem(int index, bool isDesktop) {
    return Column(
      children: [
        Expanded(
          child: MouseRegion(
            onEnter: (_) => setState(() => hoveredIndex = index),
            onExit: (_) => setState(() => hoveredIndex = null),
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
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.purple.shade900,
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
                child: buildGridItemContent(index),
              ),
            ),
          ),
        ),
        if (isDesktop) ...[
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: buildDesktopTable(tableValues[index], index),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.green.shade300,
              side: BorderSide(color: Colors.green.shade900, width: 3),
            ),
            onPressed: () => saveDataToFirestore(index),
            child: const Text("Save", style: TextStyle(color: Colors.black)),
          ),
        ],
      ],
    );
  }

  Widget buildGridItemContent(int index) {
    return Padding(
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
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDesktopTable(Map<String, dynamic> values, int tableIndex) {
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
              child: Container(
                padding: const EdgeInsets.all(6),
                alignment: Alignment.center,
                child: Text(
                  entry.key,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                padding: const EdgeInsets.all(6),
                alignment: Alignment.center,
                child: entry.value is TextEditingController
                    ? TextFormField(
                  controller: entry.value as TextEditingController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                  ),
                  style: const TextStyle(fontSize: 12),
                )
                    : Text(
                  entry.value.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget buildProductionDetailsTable() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 1,
                  borderRadius: BorderRadius.circular(5),
                ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.purple.shade900,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: const Text(
                            "Production Details",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: const Text(
                            "Value",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...productionData.entries.map((entry) {
                    return TableRow(
                      decoration: BoxDecoration(
                        color: entry.key == "Shift" ||
                            entry.key == "Lot ID" ||
                            entry.key == "Employee Name" ||
                            entry.key == "Processing Items" ||
                            entry.key == "Finished Items"
                            ? Colors.yellow.shade100
                            : Colors.white,
                      ),
                      children: [
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text(
                              entry.key,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text(
                              entry.value,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh, color: Colors.black),
            label: const Text(
              "Refresh Data",
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade300,
              side: BorderSide(color: Colors.green.shade900, width: 2),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: loadDataFromFirestore,
          ),
        ],
      ),
    );
  }

  Widget getPageForItem(String item) {
    switch (item) {
      case "SMD Pick & Place":
        return const SmdPickPlaceScreen();
      case "Solder Paste Reflow":
        return const SolderPasteReflowScreen();
      case "2D AOI":
        return const AoiScreen();
      case "PCB Unload":
        return const PcbUnloadScreen();
      default:
        return const SMTLineStage2Screen();
    }
  }

  @override
  void dispose() {
    for (var table in tableValues) {
      table.forEach((key, value) {
        if (value is TextEditingController) {
          value.dispose();
        }
      });
    }
    super.dispose();
  }
}

  Widget getPageForItem(String item) {
    switch (item) {
      case "SMD Pick & Place":
        return const SmdPickPlaceScreen();
      case "Solder Paste Reflow":
        return const SolderPasteReflowScreen();
      case "2D AOI":
        return const AoiScreen();
      case "PCB Unload":
        return const PcbUnloadScreen();
      default:
        return const SMTLineStage2Screen();
    }
  }