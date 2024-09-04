import 'package:flutter/material.dart';
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
        backgroundColor: Colors.purple,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("SMT Line Stage - 2", style: TextStyle(color: Colors.black),),
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
                    color: Colors.purple,
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
}
