import 'package:flutter/material.dart';
import 'package:mes_pro/View/Screens/Sales%20Order/widgets/new_order_widgets.dart';
import 'package:mes_pro/View/Screens/Sales%20Order/widgets/order_in_production_widget.dart';
import 'package:mes_pro/View/Screens/Sales%20Order/widgets/pending_orders_widgets.dart';
import 'package:mes_pro/View/Screens/Sales%20Order/widgets/reschedule_orders_widget.dart';

class SalesOrder extends StatefulWidget {
  const SalesOrder({super.key});

  @override
  State<SalesOrder> createState() => _SalesOrderState();
}

class _SalesOrderState extends State<SalesOrder> {
  final List<String> items = [
    "New Orders",
    "Pending Orders",
    "Order In Production",
    "Reschedule Orders",
  ];

  final List<String> images = [
    "assets/icons/new order.png",
    "assets/icons/pendingeorder.png",
    "assets/icons/production.png",
    "assets/icons/reschedule.png",
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
        backgroundColor: Colors.blueGrey,
        title: const Text("Sales Order"),
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
                    color: Colors.blueGrey,
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
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getPageForItem(String item) {
    switch (item) {
      case "New Orders":
        return const NewOrdersWidgets();
      case "Pending Orders":
        return const PendingOrdersWidgets();
      case "Order In Production":
        return const OrderInProductionWidget();
      case "Reschedule Orders":
        return const RescheduleOrdersWidget();
      default:
        return const SalesOrder();
    }
  }
}
