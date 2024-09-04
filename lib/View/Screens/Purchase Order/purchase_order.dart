import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Purchase%20Order/widgets/new_order_widget.dart';
import 'package:mes_pro/View/Screens/Purchase%20Order/widgets/pending_order_import_widget.dart';
import 'package:mes_pro/View/Screens/Purchase%20Order/widgets/pending_order_local_widget.dart';

class PurchaseOrder extends StatefulWidget {
  const PurchaseOrder({super.key});

  @override
  State<PurchaseOrder> createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  final List<String> items = [
    "New Order",
    "Pending Order Local",
    "Pending Order Import",
  ];

  final List<String> images = [
    "assets/icons/new order.png",
    "assets/icons/pendingeorder.png",
    "assets/icons/pendingeorder.png",
  ];

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
        backgroundColor: Colors.greenAccent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text("Purchase Order", style: TextStyle(color: Colors.black),),
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
                    color: Colors.greenAccent,
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
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getPageForItem(String item) {
    switch (item) {
      case "New Order":
        return const NewOrderWidget();
      case "Pending Order Local":
        return const PendingOrderLocalWidget();
      case "Pending Order Import":
        return const PendingOrderImportWidget();
      default:
        return const PurchaseOrder();
    }
  }
}
