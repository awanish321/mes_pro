import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/widgets/ofm_insertion_fusion.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/widgets/pcba_load.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/widgets/radial_insertion.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/widgets/special_parts_uflex.dart';
import 'package:mes_pro/View/Screens/THT%20LINE%201/widgets/uflex_special_parts.dart';

class THTLine1 extends StatefulWidget {
  const THTLine1({super.key});

  @override
  State<THTLine1> createState() => _THTLine1State();
}

class _THTLine1State extends State<THTLine1> {
  final List<String> items = [
    "PCBA Load",
    "Radial Insertion",
    "OFM Insertion Fusion",
    "Special Parts Uflex",
    "Special Parts UflexSpecial Parts Uflex",
  ];

  final List<String> images = [
    "assets/pcb-board.png",
    "assets/donut-chart.png",
    "assets/fusion.png",
    "assets/assemble.png",
    "assets/assemble.png",
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
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("THT Line - 1", style: TextStyle(color: Colors.black),),
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
      case "PCBA Load":
        return const PCBALoadScreen();
      case "Radial Insertion":
        return const RadialInsertionScreen();
      case "OFM Insertion Fusion":
        return const OFMInsertionFusionScreen();
      case "Special Parts Uflex":
        return const SpecialPartsUflexScreen();
      case "Special Parts UflexSpecial Parts Uflex":
        return const UflexSpecialParts();
      default:
        return const THTLine1();
    }
  }
}
