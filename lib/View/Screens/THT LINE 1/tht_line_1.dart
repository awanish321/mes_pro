import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/widgets/ofm_insertion_fusion.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/widgets/pcba_load.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/widgets/radial_insertion.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/widgets/special_parts_uflex.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/widgets/wave_solder_power_flow.dart';

class THTLine1 extends StatefulWidget {
  const THTLine1({super.key});

  @override
  State<THTLine1> createState() => _THTLine1State();
}

class _THTLine1State extends State<THTLine1> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> items = [
    "PCBA Load",
    "Radial Insertion",
    "OFM Insertion Fusion",
    "Special Parts Uflex",
    "Wave Solder Power Flow",
  ];

  final List<String> images = [
    "assets/pcb-board.png",
    "assets/donut-chart.png",
    "assets/fusion.png",
    "assets/assemble.png",
    "assets/assemble.png",
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
    tableValues = [
      {
        "Total PCB Load": TextEditingController(),
        "Process Complete": "0",
        "In Process": "0",
        "Job ID": TextEditingController(),
        "Attendant ID": TextEditingController(),
        "Time Cycle": "0",
      },
      {
        "Process Complete": "0",
        "In Process": "0",
        "Time Cycle": "0",
      },
      {
        "Process Complete": "0",
        "In Process": "0",
        "Time Cycle": "0",
      },
      {
        "Process Complete": "0",
        "In Process": "0",
        "Time Cycle": "0",
      },
      {
        "Process Complete": "0",
        "In Process": "0",
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
      'Expected End Time':
          DateTime.now().add(const Duration(hours: 8)).toString(),
    };
  }

  Future<void> loadDataFromFirestore() async {
    try {
      setState(() => isLoading = true);

      // Load PCBA Load data
      final pcbaLoadSnapshot = await _firestore
          .collection('THT Line 1')
          .doc('PCBA_LOAD')
          .collection('PCBA Load')
          .orderBy('created_at', descending: true)
          .limit(1)
          .get();

      if (pcbaLoadSnapshot.docs.isNotEmpty) {
        final latestData = pcbaLoadSnapshot.docs.first.data();

        setState(() {
          (tableValues[0]["Total PCB Load"] as TextEditingController).text =
              latestData['total_pcb_load'] ?? '0';
          (tableValues[0]["Job ID"] as TextEditingController).text =
              latestData['job_id'] ?? '';
          (tableValues[0]["Attendant ID"] as TextEditingController).text =
              latestData['attendant_id'] ?? '';
          tableValues[0]["Process Complete"] =
              latestData['process_complete'] ?? '0';
          tableValues[0]["In Process"] = latestData['in_process'] ?? '0';
          tableValues[0]["Time Cycle"] = latestData['time_cycle'] ?? '0';
        });
      }

      // Load Radial Insertion data
      final radialDoc = await _firestore
          .collection('THT Line 1')
          .doc('RADIAL_INSERTION')
          .get();

      if (radialDoc.exists) {
        final data = radialDoc.data();
        if (data != null) {
          setState(() {
            tableValues[1]["Process Complete"] =
                data['process_complete'] ?? '0';
            tableValues[1]["In Process"] = data['in_process'] ?? '0';
            tableValues[1]["Time Cycle"] = data['time_cycle'] ?? '0';
          });
        }
      }

      // Load OFM Insertion data
      final ofmDoc =
          await _firestore.collection('THT Line 1').doc('OFM_INSERTION').get();

      if (ofmDoc.exists) {
        final data = ofmDoc.data();
        if (data != null) {
          setState(() {
            tableValues[2]["Process Complete"] =
                data['process_complete'] ?? '0';
            tableValues[2]["In Process"] = data['in_process'] ?? '0';
            tableValues[2]["Time Cycle"] = data['time_cycle'] ?? '0';
          });
        }
      }

      // Load Special Parts data
      final specialPartsDoc =
          await _firestore.collection('THT Line 1').doc('SPECIAL_PARTS').get();

      if (specialPartsDoc.exists) {
        final data = specialPartsDoc.data();
        if (data != null) {
          setState(() {
            tableValues[3]["Process Complete"] =
                data['process_complete'] ?? '0';
            tableValues[3]["In Process"] = data['in_process'] ?? '0';
            tableValues[3]["Time Cycle"] = data['time_cycle'] ?? '0';
          });
        }
      }

      // Load Wave Solder data
      final waveSolderDoc =
          await _firestore.collection('THT Line 1').doc('WAVE_SOLDER').get();

      if (waveSolderDoc.exists) {
        final data = waveSolderDoc.data();
        if (data != null) {
          setState(() {
            tableValues[4]["Process Complete"] =
                data['process_complete'] ?? '0';
            tableValues[4]["In Process"] = data['in_process'] ?? '0';
            tableValues[4]["Time Cycle"] = data['time_cycle'] ?? '0';
          });
        }
      }

      // Load Production Data
      final productionDoc = await _firestore
          .collection('THT Line 1')
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
      if (mounted) {
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
          data[key] = value.text;
        } else {
          data[key] = value;
        }
      });

      switch (items[tableIndex]) {
        case "PCBA Load":
          final baseDocRef =
              _firestore.collection('THT Line 1').doc('PCBA_LOAD');
          await baseDocRef.set({
            'total_pcb_load': data['Total PCB Load'] ?? '0',
            'process_complete': data['Process Complete'] ?? '0',
            'in_process': data['In Process'] ?? '0',
            'job_id': data['Job ID'] ?? '',
            'attendant_id': data['Attendant ID'] ?? '',
            'time_cycle': data['Time Cycle'] ?? '0',
            'created_at': DateTime.now(),
            'updated_at': DateTime.now(),
            'status': 'active'
          });
          break;

        case "Radial Insertion":
          await _firestore
              .collection('THT Line 1')
              .doc('RADIAL_INSERTION')
              .set({
            'process_complete': data['Process Complete'],
            'in_process': data['In Process'],
            'time_cycle': data['Time Cycle'],
            'updated_at': DateTime.now(),
          }, SetOptions(merge: true));
          break;

        case "OFM Insertion Fusion":
          await _firestore.collection('THT Line 1').doc('OFM_INSERTION').set({
            'process_complete': data['Process Complete'],
            'in_process': data['In Process'],
            'time_cycle': data['Time Cycle'],
            'updated_at': DateTime.now(),
          }, SetOptions(merge: true));
          break;

        case "Special Parts Uflex":
          await _firestore.collection('THT Line 1').doc('SPECIAL_PARTS').set({
            'process_complete': data['Process Complete'],
            'in_process': data['In Process'],
            'time_cycle': data['Time Cycle'],
            'updated_at': DateTime.now(),
          }, SetOptions(merge: true));
          break;

        case "Wave Solder Power Flow":
          await _firestore.collection('THT Line 1').doc('WAVE_SOLDER').set({
            'process_complete': data['Process Complete'],
            'in_process': data['In Process'],
            'time_cycle': data['Time Cycle'],
            'updated_at': DateTime.now(),
          }, SetOptions(merge: true));
          break;
      }

      // Update production data
      await _firestore.collection('THT Line 1').doc('PRODUCTION_DATA').set(
            productionData,
            SetOptions(merge: true),
          );

      if (mounted) {
        Navigator.pop(context); // Close loading dialog
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data saved successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Close loading dialog
      }
      if (mounted) {
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
        backgroundColor: Colors.teal.shade900,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "THT Line - 1",
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
          VerticalDivider(color: Colors.teal.shade900, width: 3),
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
          Divider(color: Colors.teal.shade900, height: 3),
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
                  color: Colors.teal.shade900,
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
                child: tableIndex == 0 &&
                        (entry.key == "Total PCB Load" ||
                            entry.key == "Job ID" ||
                            entry.key == "Attendant ID")
                    ? TextFormField(
                        controller: entry.value as TextEditingController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Card(
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
                        color: Colors.teal.shade900,
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh, color: Colors.black),
            label: const Text("Refresh Data",
                style: TextStyle(color: Colors.black)),
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
}

Widget getPageForItem(String item) {
  switch (item) {
    case "PCBA Load":
      return const PCBALoadScreen();
    case "Radial Insertion":
      return const RadialInsertionScreen();
    case "OFM Insertion Fusion":
      return const OFMInsertionFusionScreen();
    case "Special Parts Uflex":
      return const SpecialPartsUflexScreen();
    case "Wave Solder Power Flow":
      return const WaveSolderPowerFlow();
    default:
      return const THTLine1();
  }
}
