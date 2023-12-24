import 'package:flutter/material.dart';
import 'package:medecin_app/models/OrderModel.dart';
import 'package:medecin_app/widgets/customOrder.dart';

import '../constants.dart';
import '../generated/l10n.dart';
import '../services/all_orders_service.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});
  static String id = "OrdersPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF0F919E),
                Color(0xFF3AAFB8),
                Color(0xFF63CAD1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
          ),
          title: Text(S.of(context).Orders),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: FutureBuilder<List<OrderModel>>(
                future: AllOrdersService().getAllOrders(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<OrderModel> orders = snapshot.data!;
                    return Column(
                      children: [
                        /*  Image.asset(
                            "assets/images/undraw_delivery_truck_vt6p.png"),*/
                        Expanded(
                          child: ListView.builder(
                              itemCount: orders.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: CustomOrder(
                                    order: orders[index],
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ));
  }
}
