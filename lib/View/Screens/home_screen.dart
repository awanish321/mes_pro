// import 'package:flutter/material.dart';
// import 'Bills of Materials/bills_of_materials.dart';
// import 'Final Packing Line/final_packing_line.dart';
// import 'Kanban/final_assembly_line.dart';
// import 'Material Inward/material_inward.dart';
// import 'SMT LINE STAGE 1/smt_line_stage_1.dart';
// import 'SMT LINE STAGE 2/smt_line_stage_2.dart';
// import 'Sub Assembly Set/sub_assembly_set.dart';
// import 'THT LINE 1/tht_line_1.dart';
// import 'THT LINE 2/tht_line_2.dart';
//
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
//     double screenWidth = MediaQuery.of(context).size.width;
//     bool isDesktop = screenWidth > 800;
//
//     int crossAxisCount = isDesktop ? 5 : 3;
//     double childAspectRatio = isDesktop ? 1.5 : 1;
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: const Text("MES PRO", style: TextStyle(color: Colors.black)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: GridView.builder(
//             physics: const BouncingScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: crossAxisCount,
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//               childAspectRatio: childAspectRatio,
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
//         return  const SubAssemblySetScreen();
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
import 'package:mes_pro/View/Screens/Final%20Assembly%20Line/final_assembly_line.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/finished_goods.dart';
import 'package:mes_pro/View/Screens/Purchase%20Order/purchase_order.dart';
import 'package:mes_pro/View/Screens/Repairs/repairs.dart';
import 'package:mes_pro/View/Screens/Sales%20Order/sales_order.dart';
import 'package:mes_pro/View/Screens/Scrap/scrap.dart';
import 'package:mes_pro/View/Screens/Work%20In%20Progress/work_in_progress.dart';
import 'Bills of Materials/bills_of_materials.dart';
import 'Final Packing Line/final_packing_line.dart';
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
    "Final Assembly Line",
    "Final Packing Line",
    "Sales Order",
    "Purchase Order",
    "Finished Goods",
    "WIP",
    "Repairs",
    "Scrap"
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
    "assets/icons/sales-order.png",
    "assets/icons/purchase-order.png",
    "assets/icons/finished-goods.png",
    "assets/icons/work-in-progress.png",
    "assets/icons/technician.png",
    "assets/icons/waste.png"
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
    Colors.blueGrey,
    Colors.greenAccent,
    Colors.indigoAccent,
    Colors.brown.shade500,
    Colors.lime,
    Colors.green

  ];

  int? hoveredIndex;

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
                          ? colors[index].withOpacity(0.9) // Slightly darker color on hover
                          : colors[index],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: hoveredIndex == index
                          ? [
                        const BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          offset: Offset(0, -5), // Shift shadow upwards
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 5), // Light shadow for inset effect
                        ),
                      ]
                          : [],
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
      case "Final Assembly Line":
        return const FinalAssemblyLine();
      case "Final Packing Line":
        return const FinalPackingLineScreen();
      case "Sales Order":
        return const SalesOrder();
      case "Purchase Order":
        return const PurchaseOrder();
      case "Finished Goods":
        return const FinishedGoods();
      case "WIP":
        return const WIP();
      case "Repairs":
        return const Repairs();
      case "Scrap":
        return const Scrap();
      default:
        return const HomeScreen();
    }
  }
}
