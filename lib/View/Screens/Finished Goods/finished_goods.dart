import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Final%20Packing%20Line/widgets/chemical_welding.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/widgets/finished_goods_overview.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/widgets/finished_goods_reject.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/widgets/finished_goods_store1.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/widgets/finished_goods_store2.dart';
import 'package:mes_pro/View/Screens/Finished%20Goods/widgets/finished_goods_to_floor.dart';

class FinishedGoods extends StatefulWidget {
  const FinishedGoods({super.key});

  @override
  State<FinishedGoods> createState() => _FinishedGoodsState();
}

class _FinishedGoodsState extends State<FinishedGoods> {
  final List<String> items = [
    "Finished Goods Store-1",
    "Finished Goods Store-2",
    "Finished Goods on Floor",
    "Finished Goods Reject",
    "Finished Goods Overview",
  ];

  final List<String> images = [
    "assets/goods/store.png",
    "assets/goods/store.png",
    "assets/goods/warehouse floor.png",
    "assets/goods/reject.png",
    "assets/goods/overview.png",
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
      case "Finished Goods Store-1":
        return const FinishedGoodsStore1();
      case "Finished Goods Store-2":
        return const FinishedGoodsStore2();
      case "Finished Goods on Floor":
        return const FinishedGoodsToFloor();
      case "Finished Goods Reject":
        return const FinishedGoodsReject();
      case "Finished Goods Overview":
        return const FinishedGoodsOverview();
      default:
        return const FinishedGoods();
    }
  }
}
