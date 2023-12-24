import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/models/Date.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/pages/searchPage.dart';
import 'package:medecin_app/widgets/customMedicin.dart';

import 'cartPage.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  static String id = "ProductPage";

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final String scientificName = 'scientificName';

  final String commercialName = 'commercialName';

  final String category = 'category';

  final String factory = 'factory';

  final int quantity = 5000;

  final int price = 25000;

  final Date expirationDate = Date(year: 2023, day: 01, month: 01);

  bool favourite = false;

  int wantedQuantity = 0;

  @override
  Widget build(BuildContext context) {
    MedicineModel medicin =
        ModalRoute.of(context)!.settings.arguments as MedicineModel;
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
        title: Text(medicin.trade_name),
        actions: [
          /*IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
              )),*/
          /* IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.pushNamed(context, CartPage.id);
              },
              icon: Icon(
                FontAwesomeIcons.cartPlus,
              ))*/
        ],
      ),
      backgroundColor: Color(0xFFECE6E6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  CustomMedicine(
                      upper: S.of(context).scientificName,
                      lower: medicin.scientific_name),
                  Row(
                    children: [
                      Expanded(
                        child: CustomMedicine(
                          upper: S.of(context).category,
                          lower: medicin.category,
                        ),
                      ),
                      Expanded(
                          child: CustomMedicine(
                        upper: S.of(context).factory,
                        lower: medicin.manufacturer,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomMedicine(
                          upper: S.of(context).price,
                          lower: price.toString(),
                        ),
                      ),
                      Expanded(
                          child: CustomMedicine(
                        upper: S.of(context).quantity,
                        lower: medicin.quantity_available.toString(),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomMedicine(
                          upper: S.of(context).DateTime,
                          lower: medicin.expiry_date.toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontFamily: 'Kanit', color: Color(0xff51BEC4)),
                keyboardType: TextInputType.number,
                onChanged: (data) {},
                onSubmitted: (data) {},
                decoration: InputDecoration(
                    hintText: S.of(context).Enter_the_quantity,
                    suffixIcon: IconButton(
                      padding: EdgeInsets.only(right: 15),
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.cartPlus),
                      color: kcolor,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: kcolor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: kcolor))),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
