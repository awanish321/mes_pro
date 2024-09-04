import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%202/widgets/3d_aoi_mv6.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%202/widgets/conform_coating.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%202/widgets/de_panel_gam330_at_and_pcb_unload.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%202/widgets/in_circuit_testing.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%202/widgets/pcba_cleaning.dart';

class THTLine2 extends StatefulWidget {
  const THTLine2({super.key});

  @override
  State<THTLine2> createState() => _THTLine2State();
}

class _THTLine2State extends State<THTLine2> {
  final List<String> items = [
    "PCBA Cleaning (T-20)",
    "3D AOI MV6",
    "In circuit Testing (Condor)",
    "Conform Coating (MYC50)",
    "De-Panel GAM330 AT & PCB Unload",
  ];

  final List<String> images = [
    "assets/pcb-board.png",
    "assets/file.png",
    "assets/circuit.png",
    "assets/spray-gun.png",
    "assets/pcb-board.png",
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
      crossAxisCount = 4; // Tablet size
    } else {
      crossAxisCount = 3; // Mobile size
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        backgroundColor: Colors.amber,
        title: const Text("THT Line - 2", style: TextStyle(color: Colors.black),),
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
                    color: Colors.amber,
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
            );
          },
        ),
      ),
    );
  }

  Widget getPageForItem(String item) {
    switch (item) {
      case "PCBA Cleaning (T-20)":
        return const PCBACleaning();
      case "3D AOI MV6":
        return const AOIMV6Screen();
      case "In circuit Testing (Condor)":
        return const InCircuitTestingScreen();
      case "Conform Coating (MYC50)":
        return const ConformCoatingScreen();
      case "De-Panel GAM330 AT & PCB Unload":
        return const DePanelGam330AtAndPcbUnloadScreen();
      default:
        return const THTLine2();
    }
  }
}
