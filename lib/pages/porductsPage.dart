import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/pages/cartPage.dart';
import 'package:medecin_app/pages/searchPage.dart';
import 'package:medecin_app/services/all_medicines_services.dart';
import 'package:medecin_app/widgets/customCard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:medecin_app/widgets/customCardCart.dart';

class ProductsPage extends StatelessWidget {
  int getCrossAxisCount() {
    if (kIsWeb) return 6;
    return 2;
  }

  static String id = "ProductsPage";

  @override
  Widget build(BuildContext context) {
    List category = ModalRoute.of(context)!.settings.arguments as List;
    double width = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      if (width > 900)
        return 6;
      else if (width > 600)
        return 3;
      else
        return 2;
    }

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
        title: Text(category[1]),
        actions: [
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.id);
              },
              icon: Icon(
                Icons.search,
              )),
/*
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.pushNamed(context, CartPage.id);
              },
              icon: Icon(
                FontAwesomeIcons.cartPlus,
              ))
*/
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: FutureBuilder<List<MedicineModel>>(
            future:
                AllMedicinesService().getAllMedicines(category: category[0]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MedicineModel> medicines = snapshot.data!;
                return GridView.builder(
                    itemCount: medicines.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(),
                        childAspectRatio: 1.6,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        medicine: medicines[index],
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
