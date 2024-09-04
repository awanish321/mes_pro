import 'package:flutter/material.dart';
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

class FinishedGoods extends StatefulWidget {
  const FinishedGoods({super.key});

  @override
  State<FinishedGoods> createState() => _FinishedGoodsState();
}

class _FinishedGoodsState extends State<FinishedGoods> {
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

  // Track hovered index
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    // Determine the number of columns based on the screen width
    int crossAxisCount;
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      crossAxisCount = 6;
    } else if (screenWidth >= 800) {
      crossAxisCount = 4;
    } else {
      crossAxisCount = 3;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        backgroundColor: Colors.indigoAccent,
        title: const Text("Finished Goods", style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                    color: hoveredIndex == index
                        ? Colors.indigoAccent.withOpacity(0.8) // Darker color on hover
                        : Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: hoveredIndex == index
                        ? [
                      const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: Offset(0, 5), // Light shadow below for inset effect
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.6),
                        blurRadius: 15,
                        offset: const Offset(0, -5), // Dark shadow above
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
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
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
      case "Meter Visual Inspection":
        return const MeterVisualInspection();
      case "Laser Marking":
        return const LaserMarking();
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
        return const FinishedGoods();
    }
  }
}
