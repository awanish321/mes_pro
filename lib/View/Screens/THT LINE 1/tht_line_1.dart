// import 'package:flutter/material.dart';
// import 'package:mes/View/Screens/THT%20LINE%201/widgets/ofm_insertion_fusion.dart';
// import 'package:mes/View/Screens/THT%20LINE%201/widgets/pcba_load.dart';
// import 'package:mes/View/Screens/THT%20LINE%201/widgets/radial_insertion.dart';
// import 'package:mes/View/Screens/THT%20LINE%201/widgets/special_parts_uflex.dart';
// import 'package:mes/View/Screens/THT%20LINE%201/widgets/uflex_special_parts.dart';
//
// class THTLine1 extends StatefulWidget {
//   const THTLine1({super.key});
//
//   @override
//   State<THTLine1> createState() => _THTLine1State();
// }
//
// class _THTLine1State extends State<THTLine1> {
//   final List<String> items = [
//     "PCBA Load",
//     "Radial Insertion",
//     "OFM Insertion Fusion",
//     "Special Parts Uflex",
//     "Special Parts UflexSpecial Parts Uflex"
//   ];
//
//   final List<String> images = [
//     "assets/pcb-board.png",
//     "assets/donut-chart.png",
//     "assets/fusion.png",
//     "assets/assemble.png",
//     "assets/assemble.png",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.teal,
//         title: const Text("THT Line - 1"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//         child: GridView.builder(
//           physics: const NeverScrollableScrollPhysics(),
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
//                   color: Colors.teal,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         images[index],
//                         width: 60,
//                         height: 60,
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
//       case "PCBA Load":
//         return const PCBALoadScreen();
//       case "Radial Insertion":
//         return const RadialInsertionScreen();
//       case "OFM Insertion Fusion":
//         return const OFMInsertionFusionScreen();
//       case "Special Parts Uflex":
//         return const SpecialPartsUflexScreen();
//       case "Special Parts UflexSpecial Parts Uflex":
//         return const UflexSpecialParts();
//       default:
//         return const THTLine1();
//     }
//   }
// }





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
      crossAxisCount = 2; // Mobile size
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("THT Line - 1"),
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
                  color: Colors.teal,
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
