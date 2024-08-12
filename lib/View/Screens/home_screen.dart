// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:mes/View/Screens/Bills%20of%20Materials/bills_of_materials.dart';
// // // import 'package:mes/View/Screens/Final%20Packing%20Line/final_packing_line.dart';
// // // import 'package:mes/View/Screens/Kanban/kanban.dart';
// // // import 'package:mes/View/Screens/Material%20Inward/material_inward.dart';
// // // import 'package:mes/View/Screens/SMT%20LINE%20STAGE%201/smt_line_stage_1.dart';
// // // import 'package:mes/View/Screens/SMT%20LINE%20STAGE%202/smt_line_stage_2.dart';
// // // import 'package:mes/View/Screens/Sub%20Assembly%20Set/sub_assembly_set.dart';
// // // import 'package:mes/View/Screens/THT%20LINE%201/tht_line_1.dart';
// // //
// // // import 'THT LINE 2/tht_line_2.dart';
// // //
// // // class HomeScreen extends StatefulWidget {
// // //   const HomeScreen({super.key});
// // //
// // //   @override
// // //   State<HomeScreen> createState() => _HomeScreenState();
// // // }
// // //
// // // class _HomeScreenState extends State<HomeScreen> {
// // //   final List<String> items = [
// // //     "Material Inward",
// // //     "Sub Assembly Set",
// // //     "Bills of Materials",
// // //     "SMT Line Stage - 1",
// // //     "SMT Line Stage - 2",
// // //     "THT Line - 1",
// // //     "THT Line - 2",
// // //     "Kanban",
// // //     "Final Packing Line",
// // //   ];
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: SingleChildScrollView(
// // //         physics: const BouncingScrollPhysics(),
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(8.0),
// // //           child: Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               const SizedBox(height: 100,),
// // //               const Text(
// // //                 "MES Pro",
// // //                 style: TextStyle(fontSize: 20),
// // //               ),
// // //               const SizedBox(height: 20),
// // //               SizedBox(
// // //                 height: MediaQuery.of(context).size.height * 0.6, // Constrain GridView height
// // //                 child: GridView.builder(
// // //                   physics: const NeverScrollableScrollPhysics(),
// // //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // //                     crossAxisCount: 3,
// // //                     crossAxisSpacing: 8.0,
// // //                     mainAxisSpacing: 8.0,
// // //                     childAspectRatio: 1,
// // //                   ),
// // //                   itemCount: items.length,
// // //                   itemBuilder: (context, index) {
// // //                     return GestureDetector(
// // //                       onTap: () {
// // //                         Navigator.push(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (context) => getPageForItem(items[index]),
// // //                           ),
// // //                         );
// // //                       },
// // //                       child: Container(
// // //                         decoration: BoxDecoration(
// // //                           shape: BoxShape.rectangle,
// // //                           color: Colors.white,
// // //                           borderRadius: BorderRadius.circular(12),
// // //                         ),
// // //                         child: Padding(
// // //                           padding: const EdgeInsets.all(8.0),
// // //                           child: Center(
// // //                             child: Text(
// // //                               items[index],
// // //                               textAlign: TextAlign.center,
// // //                               style: const TextStyle(fontSize: 15),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     );
// // //                   },
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   // This method returns the appropriate page based on the item tapped.
// // //   Widget getPageForItem(String item) {
// // //     switch (item) {
// // //       case "Material Inward":
// // //         return const MaterialInwardScreen();
// // //       case "Sub Assembly Set":
// // //         return const SubAssemblySetScreen();
// // //       case "Bills of Materials":
// // //         return const BillsOfMaterialsScreen();
// // //       case "SMT Line Stage - 1":
// // //         return const SMTLineStage1Screen();
// // //       case "SMT Line Stage - 2":
// // //         return const SMTLineStage2Screen();
// // //       case "THT Line - 1":
// // //         return const THTLine1();
// // //       case "THT Line - 2":
// // //         return const THTLine2();
// // //       case "Kanban":
// // //         return const KanbanScreen();
// // //       case "Final Packing Line":
// // //         return const FinalPackingLineScreen();
// // //       default:
// // //         return const HomeScreen();
// // //     }
// // //   }
// // // }
// //
// //
// //
// //
// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:mes/View/Screens/Bills%20of%20Materials/bills_of_materials.dart';
// // import 'package:mes/View/Screens/Final%20Packing%20Line/final_packing_line.dart';
// // import 'package:mes/View/Screens/Kanban/kanban.dart';
// // import 'package:mes/View/Screens/Material%20Inward/material_inward.dart';
// // import 'package:mes/View/Screens/SMT%20LINE%20STAGE%201/smt_line_stage_1.dart';
// // import 'package:mes/View/Screens/SMT%20LINE%20STAGE%202/smt_line_stage_2.dart';
// // import 'package:mes/View/Screens/Sub%20Assembly%20Set/sub_assembly_set.dart';
// // import 'package:mes/View/Screens/THT%20LINE%201/tht_line_1.dart';
// // import 'THT LINE 2/tht_line_2.dart';
// //
// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});
// //
// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }
// //
// // class _HomeScreenState extends State<HomeScreen> {
// //   final List<String> items = [
// //     "Material Inward",
// //     "Sub Assembly Set",
// //     "Bills of Materials",
// //     "SMT Line Stage - 1",
// //     "SMT Line Stage - 2",
// //     "THT Line - 1",
// //     "THT Line - 2",
// //     "Kanban",
// //     "Final Packing Line",
// //   ];
// //
// //   final List<Color> colors = [
// //     Colors.red,
// //     Colors.blue,
// //     Colors.green,
// //     Colors.orange,
// //     Colors.purple,
// //     Colors.teal,
// //     Colors.amber,
// //     Colors.pink,
// //     Colors.cyan,
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         physics: const BouncingScrollPhysics(),
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               const SizedBox(height: 100),
// //               const Text(
// //                 "MES Pro",
// //                 style: TextStyle(fontSize: 28),
// //               ),
// //               const SizedBox(height: 20),
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.6, // Constrain GridView height
// //                 child: GridView.builder(
// //                   physics: const NeverScrollableScrollPhysics(),
// //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 3,
// //                     crossAxisSpacing: 8.0,
// //                     mainAxisSpacing: 8.0,
// //                     childAspectRatio: 1,
// //                   ),
// //                   itemCount: items.length,
// //                   itemBuilder: (context, index) {
// //                     return GestureDetector(
// //                       onTap: () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => getPageForItem(items[index]),
// //                           ),
// //                         );
// //                       },
// //                       child: Container(
// //                         decoration: BoxDecoration(
// //                           shape: BoxShape.rectangle,
// //                           color: colors[index],
// //                           borderRadius: BorderRadius.circular(12),
// //                         ),
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Center(
// //                             child: Text(
// //                               items[index],
// //                               textAlign: TextAlign.center,
// //                               style: const TextStyle(fontSize: 15, color: Colors.white),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //
// //   Widget getPageForItem(String item) {
// //     switch (item) {
// //       case "Material Inward":
// //         return const MaterialInwardScreen();
// //       case "Sub Assembly Set":
// //         return  SubAssemblySetScreen();
// //       case "Bills of Materials":
// //         return const BillsOfMaterialsScreen();
// //       case "SMT Line Stage - 1":
// //         return const SMTLineStage1Screen();
// //       case "SMT Line Stage - 2":
// //         return const SMTLineStage2Screen();
// //       case "THT Line - 1":
// //         return const THTLine1();
// //       case "THT Line - 2":
// //         return const THTLine2();
// //       case "Kanban":
// //         return const KanbanScreen();
// //       case "Final Packing Line":
// //         return const FinalPackingLineScreen();
// //       default:
// //         return const HomeScreen();
// //     }
// //   }
// // }
//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:mes/View/Screens/Bills%20of%20Materials/bills_of_materials.dart';
// import 'package:mes/View/Screens/Final%20Packing%20Line/final_packing_line.dart';
// import 'package:mes/View/Screens/Kanban/kanban.dart';
// import 'package:mes/View/Screens/Material%20Inward/material_inward.dart';
// import 'package:mes/View/Screens/SMT%20LINE%20STAGE%201/smt_line_stage_1.dart';
// import 'package:mes/View/Screens/SMT%20LINE%20STAGE%202/smt_line_stage_2.dart';
// import 'package:mes/View/Screens/Sub%20Assembly%20Set/sub_assembly_set.dart';
// import 'package:mes/View/Screens/THT%20LINE%201/tht_line_1.dart';
// import 'package:mes/View/Screens/THT%20LINE%202/tht_line_2.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final List<String> items = [
//     "Material Inward",
//     "Sub Assembly Set",
//     "Bills of Materials",
//     "SMT Line Stage - 1",
//     "SMT Line Stage - 2",
//     "THT Line - 1",
//     "THT Line - 2",
//     "Kanban",
//     "Final Packing Line",
//   ];
//
//   final List<String> images = [
//     "assets/icons/electronics-shop.png",
//     "assets/icons/assemble.png",
//     "assets/icons/bill.png",
//     "assets/icons/pcb.png",
//     "assets/icons/pcb.png",
//     "assets/icons/pcb-board.png",
//     "assets/icons/pcb-board.png",
//     "assets/icons/kanban.png",
//     "assets/icons/material-management.png",
//   ];
//
//   final List<Color> colors = [
//     Colors.red,
//     Colors.blue,
//     Colors.green,
//     Colors.orange,
//     Colors.purple,
//     Colors.teal,
//     Colors.amber,
//     Colors.pink,
//     Colors.cyan,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: const Text("MES PRO", style: TextStyle(color: Colors.black),),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           heightFactor: 100,
//           child: GridView.builder(
//             physics: const BouncingScrollPhysics(),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//               childAspectRatio: 1,
//             ),
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => getPageForItem(items[index]),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     color: colors[index],
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           images[index],
//                           width: 30,
//                           height: 30,
//                           fit: BoxFit.contain,
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           items[index],
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 15, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget getPageForItem(String item) {
//     switch (item) {
//       case "Material Inward":
//         return const MaterialInwardScreen();
//       case "Sub Assembly Set":
//         return const SubAssemblySetScreen();
//       case "Bills of Materials":
//         return const BillsOfMaterialsScreen();
//       case "SMT Line Stage - 1":
//         return const SMTLineStage1Screen();
//       case "SMT Line Stage - 2":
//         return const SMTLineStage2Screen();
//       case "THT Line - 1":
//         return const THTLine1();
//       case "THT Line - 2":
//         return const THTLine2();
//       case "Kanban":
//         return const KanbanScreen();
//       case "Final Packing Line":
//         return const FinalPackingLineScreen();
//       default:
//         return const HomeScreen();
//     }
//   }
// }




import 'package:flutter/material.dart';

import 'Bills of Materials/bills_of_materials.dart';
import 'Final Packing Line/final_packing_line.dart';
import 'Kanban/kanban.dart';
import 'Material Inward/material_inward.dart';
import 'SMT LINE STAGE 1/smt_line_stage_1.dart';
import 'SMT LINE STAGE 2/smt_line_stage_2.dart';
import 'Sub Assembly Set/sub_assembly_set.dart';
import 'THT LINE 1/tht_line_1.dart';
import 'THT LINE 2/tht_line_2.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = [
    "Material Inward",
    "Sub Assembly Set",
    "Bills of Materials",
    "SMT Line Stage - 1",
    "SMT Line Stage - 2",
    "THT Line - 1",
    "THT Line - 2",
    "Kanban",
    "Final Packing Line",
  ];

  final List<String> images = [
    "assets/icons/electronics-shop.png",
    "assets/icons/assemble.png",
    "assets/icons/bill.png",
    "assets/icons/pcb.png",
    "assets/icons/pcb.png",
    "assets/icons/pcb-board.png",
    "assets/icons/pcb-board.png",
    "assets/icons/kanban.png",
    "assets/icons/material-management.png",
  ];

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.amber,
    Colors.pink,
    Colors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth > 800;

    int crossAxisCount = isDesktop ? 5 : 3;
    double childAspectRatio = isDesktop ? 1.5 : 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("MES PRO", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: childAspectRatio,
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
                    color: colors[index],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          images[index],
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          items[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getPageForItem(String item) {
    switch (item) {
      case "Material Inward":
        return const MaterialInwardScreen();
      case "Sub Assembly Set":
        return const SubAssemblySetScreen();
      case "Bills of Materials":
        return const BillsOfMaterialsScreen();
      case "SMT Line Stage - 1":
        return const SMTLineStage1Screen();
      case "SMT Line Stage - 2":
        return const SMTLineStage2Screen();
      case "THT Line - 1":
        return const THTLine1();
      case "THT Line - 2":
        return const THTLine2();
      case "Kanban":
        return const KanbanScreen();
      case "Final Packing Line":
        return const FinalPackingLineScreen();
      default:
        return const HomeScreen();
    }
  }
}
