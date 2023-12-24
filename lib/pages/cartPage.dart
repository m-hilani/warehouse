import 'package:flutter/material.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/widgets/customButton.dart';
import 'package:medecin_app/widgets/customCard.dart';
import 'package:medecin_app/widgets/customCardCart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String id = "CartPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(S.of(context).Cart),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child:
              // FutureBuilder(
              //     future:CartMedicinesService().getCartMedicines(token: token),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              // List<MedicineModel> medicines = snapshot.data!;
              //return
              Column(
            children: [
              Expanded(
                child: GridView.builder(
                    clipBehavior: Clip.none,
                    //  itemCount: medicines.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return /*CustomCardCart(
                           medicin: medicines[index],
                          )*/
                          ;
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: CustomButton(onTap: () {}, text: S.of(context).Buy),
              )
            ],
          ) //;
          //  }else {
          //   return Center(child: CircularProgressIndicator());
          //}
          //  }
          //),
          ),
    );
  }
}
