import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/asset_prepack.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/chemical_welding.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/etbc_fixing.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/finished_goods_to_store.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/inner_box_packing.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/kiosk.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/laser_marking.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/meter_sealing.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/meter_visual_inspection.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/outer_box_packing.dart';

class FinalPackingLineScreen extends StatefulWidget {
  const FinalPackingLineScreen({super.key});

  @override
  State<FinalPackingLineScreen> createState() => _FinalPackingLineScreenState();
}

class _FinalPackingLineScreenState extends State<FinalPackingLineScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> items = [
    "Meter Visual Inspection",
    "Laser Marking",
    "KIOSK",
    "Asset Prepack",
    "Chemical Welding",
    "ETBC Fixing",
    "Meter Sealing",
    "Inner Box Packing",
    "Outer Box Packing",
    "Finished Goods To Store"
  ];

  final List<String> images = [
    "assets/icons/electric-meter.png",
    "assets/laser.png",
    "assets/icons/kiosk.png",
    "assets/icons/digital-asset-management.png",
    "assets/icons/welding-equipment.png",
    "assets/icons/tool.png",
    "assets/icons/electric-meter.png",
    "assets/icons/package.png",
    "assets/icons/package.png",
    "assets/icons/store.png",
  ];

  late List<Map<String, dynamic>> tableValues;
  late Map<String, String> productionData;
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
    tableValues = List.generate(items.length, (index) => {
      "Total PCB Load": TextEditingController(),
      "Process Complete": "0",
      "In Process": "0",
      "Job ID": TextEditingController(),
      "Attendant ID": TextEditingController(),
      "Time Cycle": "0",
    });

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

      for (int i = 0; i < items.length; i++) {
        final docSnapshot = await _firestore
            .collection('Final Packing Line')
            .doc(items[i].replaceAll(' ', '_').toUpperCase())
            .get();

        if (docSnapshot.exists) {
          final data = docSnapshot.data() as Map<String, dynamic>;
          setState(() {
            (tableValues[i]["Total PCB Load"] as TextEditingController).text = data['total_pcb_load'] ?? '0';
            (tableValues[i]["Job ID"] as TextEditingController).text = data['job_id'] ?? '';
            (tableValues[i]["Attendant ID"] as TextEditingController).text = data['attendant_id'] ?? '';
            tableValues[i]["Process Complete"] = data['process_complete'] ?? '0';
            tableValues[i]["In Process"] = data['in_process'] ?? '0';
            tableValues[i]["Time Cycle"] = data['time_cycle'] ?? '0';
          });
        }
      }

      final productionDoc = await _firestore
          .collection('Final Packing Line')
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

  Future<void> saveDataToFirestore(int index) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      Map<String, dynamic> data = {};
      tableValues[index].forEach((key, value) {
        if (value is TextEditingController) {
          data[key] = value.text;
        } else {
          data[key] = value;
        }
      });

      await _firestore.collection('Final Packing Line').doc(items[index].replaceAll(' ', '_').toUpperCase()).set({
        'total_pcb_load': data['Total PCB Load'] ?? '0',
        'process_complete': data['Process Complete'] ?? '0',
        'in_process': data['In Process'] ?? '0',
        'job_id': data['Job ID'] ?? '',
        'attendant_id': data['Attendant ID'] ?? '',
        'time_cycle': data['Time Cycle'] ?? '0',
        'updated_at': DateTime.now(),
      }, SetOptions(merge: true));

      await _firestore.collection('Final Packing Line').doc('PRODUCTION_DATA').set(
        productionData,
        SetOptions(merge: true),
      );

      if(mounted){
        Navigator.pop(context);
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
        backgroundColor: Colors.cyan.shade900,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "Final Packing Line",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
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
          VerticalDivider(color: Colors.cyan.shade900, width: 3),
          Expanded(
            flex: 1,
            child: buildProductionDetailsTable(),
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
          Divider(color: Colors.cyan.shade900, height: 3),
          buildProductionDetailsTable(),
        ],
      ),
    );
  }

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
                  color: Colors.cyan.shade900,
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
                child: entry.key == "Total PCB Load" ||
                    entry.key == "Job ID" ||
                    entry.key == "Attendant ID"
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
                  onChanged: (value) {
                    if (entry.value is TextEditingController) {
                      (entry.value as TextEditingController).text = value;
                    }
                  },
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
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Production Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 1,
                  borderRadius: BorderRadius.circular(5),
                ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade900,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    children: const [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Detail",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Value",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              entry.key,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
            ],
          ),
        ),
      ),
    );
  }
}

Widget getPageForItem(String item) {
  switch (item) {
    case "Meter Visual Inspection":
      return const MeterVisualInspection();
    case "Laser Marking":
      return const LaserMarking(tableValues: {},);
    case "KIOSK":
      return const KIOSK();
    case "Asset Prepack":
      return const AssetPrepack();
    case "Chemical Welding":
      return const ChemicalWelding();
    case "ETBC Fixing":
      return const ETBCFixing();
    case "Meter Sealing":
      return const MeterSealing();
    case "Inner Box Packing":
      return const InnerBoxPacking();
    case "Outer Box Packing":
      return const OuterBoxPacking();
    case "Finished Goods To Store":
      return const FinishedGoodsToStore();
    default:
      return const FinalPackingLineScreen();
  }
}