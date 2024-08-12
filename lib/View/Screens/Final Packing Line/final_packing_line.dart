// import 'package:flutter/material.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/widgets/asset_prepack.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/widgets/chemical_welding.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/widgets/etbc_fixing.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/widgets/finished_goods_to_store.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/widgets/inner_box_packing.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/widgets/kiosk.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/widgets/laser_marking.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/widgets/meter_sealing.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/widgets/meter_visual_inspection.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/widgets/outer_box_packing.dart';
//
// class FinalPackingLineScreen extends StatefulWidget {
//   const FinalPackingLineScreen({super.key});
//
//   @override
//   State<FinalPackingLineScreen> createState() => _FinalPackingLineScreenState();
// }
//
// class _FinalPackingLineScreenState extends State<FinalPackingLineScreen> {
//   final List<String> items = [
//     "Meter Visual Inspection",
//     "Laser Marking",
//     "KIOSK",
//     "Asset Prepack",
//     "Chemical Welding",
//     "ETBC Fixing",
//     "Meter Sealing",
//     "Inner Box Packing",
//     "Outer Box Packing",
//     "Finished Goods To Store"
//   ];
//
//   final List<String> images = [
//     "assets/icons/electric-meter.png",
//     "assets/laser.png",
//     "assets/icons/kiosk.png",
//     "assets/icons/digital-asset-management.png",
//     "assets/icons/welding-equipment.png",
//     "assets/icons/tool.png",
//     "assets/icons/electric-meter.png",
//     "assets/icons/package.png",
//     "assets/icons/package.png",
//     "assets/icons/store.png",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.cyan,
//         title: const Text("Final Packing Line"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//         child: GridView.builder(
//           physics: const BouncingScrollPhysics(),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//             childAspectRatio: 1,
//           ),
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => getPageForItem(items[index]),
//                   ),
//                 );
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.rectangle,
//                   color: Colors.cyan,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         images[index],
//                         width: 40,
//                         height: 40,
//                         fit: BoxFit.contain,
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         items[index],
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(fontSize: 15, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget getPageForItem(String item) {
//     switch (item) {
//       case "Meter Visual Inspection":
//         return const MeterVisualInspection();
//       case "Laser Marking":
//         return const LaserMarking();
//       case "KIOSK":
//         return const KIOSK();
//       case "Asset Prepack":
//         return const AssetPrepack();
//       case "Chemical Welding":
//         return const ChemicalWelding();
//       case "ETBC Fixing":
//         return const ETBCFixing();
//       case "Meter Sealing":
//         return const MeterSealing();
//       case "Inner Box Packing":
//         return const InnerBoxPacking();
//       case "Outer Box Packing":
//         return const OuterBoxPacking();
//       case "Finished Goods To Store":
//         return const FinishedGoodsToStore();
//       default:
//         return const FinalPackingLineScreen();
//     }
//   }
// }




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


class FinalPackingLineScreen extends StatefulWidget {
  const FinalPackingLineScreen({super.key});

  @override
  State<FinalPackingLineScreen> createState() => _FinalPackingLineScreenState();
}

class _FinalPackingLineScreenState extends State<FinalPackingLineScreen> {
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
      crossAxisCount = 2;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        title: const Text("Final Packing Line"),
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
            return GestureDetector(
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
                  shape: BoxShape.rectangle,
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          images[index],
                          width: 40,
                          height: 40,
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
        return const FinalPackingLineScreen();
    }
  }
}
