// import 'package:flutter/material.dart';
// import 'package:mes/View/Screens/THT%20LINE%202/widgets/3d_aoi_mv6.dart';
// import 'package:mes/View/Screens/THT%20LINE%202/widgets/conform_coating.dart';
// import 'package:mes/View/Screens/THT%20LINE%202/widgets/de_panel_gam330_at_and_pcb_unload.dart';
// import 'package:mes/View/Screens/THT%20LINE%202/widgets/in_circuit_testing.dart';
// import 'package:mes/View/Screens/THT%20LINE%202/widgets/pcba_cleaning.dart';
//
// class THTLine2 extends StatefulWidget {
//   const THTLine2({super.key});
//
//   @override
//   State<THTLine2> createState() => _THTLine2State();
// }
//
// class _THTLine2State extends State<THTLine2> {
//   final List<String> items = [
//     "PCBA Cleaning (T-20)",
//     "3D AOI MV6",
//     "In circuit Testing (Condor)",
//     "Conform Coating (MYC50)",
//     "De-Panel GAM330 AT & PCB Unload"
//   ];
//
//   final List<String> images = [
//     "assets/pcb-board.png",
//     "assets/file.png",
//     "assets/circuit.png",
//     "assets/spray-gun.png",
//     "assets/pcb-board.png",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: const Text("THT Line - 2"),
//         backgroundColor: Colors.amber,
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
//                   color: Colors.amber,
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
//   // This method returns the appropriate page based on the item tapped.
//   Widget getPageForItem(String item) {
//     switch (item) {
//       case "PCBA Cleaning (T-20)":
//         return const PCBACleaning();
//       case "3D AOI MV6":
//         return const AOIMV6Screen();
//       case "In circuit Testing (Condor)":
//         return const InCircuitTestingScreen();
//       case "Conform Coating (MYC50)":
//         return const ConformCoatingScreen();
//       case "De-Panel GAM330 AT & PCB Unload":
//         return const DePanelGam330AtAndPcbUnloadScreen();
//       default:
//         return const THTLine2();
//     }
//   }
// }





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
        backgroundColor: Colors.amber,
        title: const Text("THT Line - 2"),
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
                  color: Colors.amber,
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

  // This method returns the appropriate page based on the item tapped.
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
