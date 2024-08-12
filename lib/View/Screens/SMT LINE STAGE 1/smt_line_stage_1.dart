// import 'package:flutter/material.dart';
// import 'package:mes/View/Screens/SMT%20LINE%20STAGE%201/widgets/laser_marking.dart';
// import 'package:mes/View/Screens/SMT%20LINE%20STAGE%201/widgets/pcb_load.dart';
// import 'package:mes/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_inspection.dart';
// import 'package:mes/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_printing.dart';
//
// class SMTLineStage1Screen extends StatefulWidget {
//   const SMTLineStage1Screen({super.key});
//
//   @override
//   State<SMTLineStage1Screen> createState() => _SMTLineStage1ScreenState();
// }
//
// class _SMTLineStage1ScreenState extends State<SMTLineStage1Screen> {
//   final List<String> items = [
//     "PCB Load",
//     "Laser Marking",
//     "Solder Paste Printing EbyDEK",
//     "Solder Paste Inspection MV110e",
//   ];
//
//   final List<String> images = [
//     "assets/pcb-board.png",
//     "assets/laser.png",
//     "assets/soldering.png",
//     "assets/icons8-solder-50.png",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.orange,
//         title: const Text("SMT Line Stage - 1"),
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
//                   color: Colors.orange,
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
//                         height: 50,
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
//       case "PCB Load":
//         return const PcbLoadScreen();
//       case "Laser Marking":
//         return const LaserMarkingScreen();
//       case "Solder Paste Printing EbyDEK":
//         return const SolderPastePrintingScreen();
//       case "Solder Paste Inspection MV110e":
//         return const SolderPasteInspectionScreen();
//       default:
//         return const SMTLineStage1Screen();
//     }
//   }
// }




import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/laser_marking.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/pcb_load.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_inspection.dart';
import 'package:mes_pro/View/Screens/SMT%20LINE%20STAGE%201/widgets/solder_paste_printing.dart';

class SMTLineStage1Screen extends StatefulWidget {
  const SMTLineStage1Screen({super.key});

  @override
  State<SMTLineStage1Screen> createState() => _SMTLineStage1ScreenState();
}

class _SMTLineStage1ScreenState extends State<SMTLineStage1Screen> {
  final List<String> items = [
    "PCB Load",
    "Laser Marking",
    "Solder Paste Printing EbyDEK",
    "Solder Paste Inspection MV110e",
  ];

  final List<String> images = [
    "assets/pcb-board.png",
    "assets/laser.png",
    "assets/soldering.png",
    "assets/icons8-solder-50.png",
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
        backgroundColor: Colors.orange,
        title: const Text("SMT Line Stage - 1"),
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
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
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
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getPageForItem(String item) {
    switch (item) {
      case "PCB Load":
        return const PcbLoadScreen();
      case "Laser Marking":
        return const LaserMarkingScreen();
      case "Solder Paste Printing EbyDEK":
        return const SolderPastePrintingScreen();
      case "Solder Paste Inspection MV110e":
        return const SolderPasteInspectionScreen();
      default:
        return const SMTLineStage1Screen();
    }
  }
}
