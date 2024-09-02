import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Kanban/widgets/accuracy_and_caliberation.dart';
import 'package:mes_pro/View/Screens/Kanban/widgets/ct_assembly.dart';
import 'package:mes_pro/View/Screens/Kanban/widgets/external_battery_assembly.dart';
import 'package:mes_pro/View/Screens/Kanban/widgets/hv_ir_ft_testing.dart';
import 'package:mes_pro/View/Screens/Kanban/widgets/main_pcb_assembly.dart';
import 'package:mes_pro/View/Screens/Kanban/widgets/relay_assembly.dart';
import 'package:mes_pro/View/Screens/Kanban/widgets/shunt_assembly.dart';
import 'package:mes_pro/View/Screens/Kanban/widgets/terminal_block_assembly.dart';

class KanbanScreen extends StatefulWidget {
  const KanbanScreen({super.key});

  @override
  State<KanbanScreen> createState() => _KanbanScreenState();
}

class _KanbanScreenState extends State<KanbanScreen> {
  final List<String> items = [
    "Terminal Block Assembly",
    "Relay Assembly",
    "CT Assembly",
    "Shunt Assembly",
    "Main PCB Assembly",
    "External Battery Assembly",
    "HV, IR, FT Testing",
    "Accuracy & Calibration"
  ];

  final List<String> images = [
    "assets/icons/terminal.png",
    "assets/icons/relay.png",
    "assets/icons/technology.png",
    "assets/icons/icons8-shunt-48.png",
    "assets/icons/pcb.png",
    "assets/icons/battery.png",
    "assets/icons/ir-blaster.png",
    "assets/icons/target.png",
  ];

  // Track hovered index
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    // Determine the number of columns based on the screen width
    int crossAxisCount;
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      crossAxisCount = 6; // Desktop size
    } else if (screenWidth >= 800) {
      crossAxisCount = 3; // Tablet size
    } else {
      crossAxisCount = 3; // Mobile size
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        title: const Text("Kanban"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
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
                    color: Colors.pink,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Text(
                              items[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15, color: Colors.white),
                            ),
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
    );
  }

  Widget getPageForItem(String item) {
    switch (item) {
      case "Terminal Block Assembly":
        return const TerminalBlockAssembly();
      case "Relay Assembly":
        return const RelayAssembly();
      case "CT Assembly":
        return const CtAssembly();
      case "Shunt Assembly":
        return const ShuntAssembly();
      case "Main PCB Assembly":
        return const MainPcbAssembly();
      case "External Battery Assembly":
        return const ExternalBatteryAssembly();
      case "HV, IR, FT Testing":
        return const HvIrFtTesting();
      case "Accuracy & Calibration":
        return const AccuracyAndCalibration();
      default:
        return const KanbanScreen();
    }
  }
}
