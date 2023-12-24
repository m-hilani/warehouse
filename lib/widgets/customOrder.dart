/*
import 'package:flutter/material.dart';
import 'package:medecin_app/pages/OrderPage.dart';

import '../generated/l10n.dart';

class CustomOrder extends StatelessWidget {
  CustomOrder({super.key, required this.orderState});

  final List<dynamic> categories = ["preparing", "sending", "received"];
  String orderState;
  List<DropdownMenuItem<String>> DropDownGenerator() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < categories.length; i++) {
      String category = categories[i];
      // print(categories[i]);
      dropdownItems.add(
        DropdownMenuItem(
          child: Text(category),
          value: category as String,
        ),
      );
      // print(category);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        */
/*  Navigator.pushNamed(context, OrderPage.id);*/ /*

      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0F919E),
              Color(0xFF3AAFB8),
              Color(0xFF63CAD1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        height: 120,
        */
/*width: 300,*/ /*

        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).Order_Number,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).quantity,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        S.of(context).state,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(172, 58, 176, 184),
                              fontSize: 18,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF3AAFB8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: Color.fromARGB(172, 58, 176, 184),
                            fontSize: 18,
                          ),
                          isExpanded: false,
                          */
/* hint: Text(
                              'Select Category',
                              style: TextStyle(
                                color: Color.fromARGB(172, 58, 176, 184),
                                fontSize: 18,
                              ),
                            ),*/ /*
 // Displayed when no category is selected
                          value: orderState,
                          onChanged: (value) {
                            orderState = value as String;
                          },
                          items: DropDownGenerator()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/models/OrderModel.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/pages/OrderPage.dart';
import 'package:medecin_app/sahred/shared.dart';

import '../generated/l10n.dart';
import '../helper/api.dart';

class CustomOrder extends StatelessWidget {
  CustomOrder({super.key, required this.order});

  OrderModel order;

  /* List<DropdownMenuItem<String>> DropDownGenerator() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < categories.length; i++) {
      String category = categories[i];
      // print(categories[i]);
      dropdownItems.add(
        DropdownMenuItem(
          child: Text(category),
          value: category as String,
        ),
      );
      // print(category);
    }
    return dropdownItems;
  }*/

  @override
  Widget build(BuildContext context) {
    final List<String> list = /*S.of(context).Arabic == "Arabic"*/
        ["preparing", "sending", "received"];
    /* : ["تحضير", "ارسال", "استلم"];*/

    final List<String> paid = ["Not Paid", "Paid"];

    return GestureDetector(
      onTap: () {
        List<MedicineModel> medicinesList = [];
        for (int i = 0; i < order.medicines.length; i++) {
          medicinesList.add(
            MedicineModel.fromJson(order.medicines[i]),
          );
        }

        Navigator.pushNamed(context, OrderPage.id, arguments: medicinesList);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0F919E),
              Color(0xFF3AAFB8),
              Color(0xFF63CAD1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        // height: 250,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.username,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "${S.of(context).Order_Number} : ${order.ordernumber}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  S.of(context).quantity + "  ${order.total_quantity}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                DropdownMenu<String>(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  initialSelection: order.status,
                  onSelected: (String? value) async {
                    try {
                      await Api().post(
                          url: '$baseUrl/state',
                          body: {
                            "ordernumber": "${order.ordernumber}",
                            "token": token,
                            "state": value
                          },
                          token: token);
                    } catch (e) {
                      print(e);
                    }
                    // This is called when the user selects an item.
                    order.status = value!;
                  },
                  dropdownMenuEntries:
                      list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                ),
                Row(
                  children: [
                    DropdownMenu<String>(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      initialSelection: order.paid,
                      onSelected: (String? value) async {
                        try {
                          await CacheNetwork.cacheInitialization();
                          await Api().post(
                              url: '$baseUrl/paidState',
                              body: {
                                "ordernumber": "${order.ordernumber}",
                                "token": token,
                                "state": value
                              },
                              token: token);
                        } catch (e) {
                          print(e);
                        }
                        // This is called when the user selects an item.
                        order.paid = value!;
                      },
                      dropdownMenuEntries:
                          paid.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                  ],
                ),
                Text(
                  r"$" "${order.total_price.toString()}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
