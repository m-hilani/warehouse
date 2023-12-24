import 'package:flutter/material.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/pages/porductsPage.dart';
import 'package:medecin_app/pages/productPage.dart';

//NOTE:this card is just for test
class CustomCardCart extends StatelessWidget {
  CustomCardCart({required this.medicin});
  MedicineModel medicin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.id, arguments: medicin);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 40,
                spreadRadius: 0,
                offset: Offset(10, 10)),
          ]),
          child: Card(
            elevation: 10,
            color: Color(0xFF3AAFB8),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).medicin +
                              "  ${medicin.scientific_name}",
                          style: TextStyle(color: Colors.white),
                        ),
/*
                        GestureDetector(onTap: () {}, child: Icon(Icons.delete))
*/
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 8),
                    child: Text(
                      S.of(context).factory + ":  ${medicin.manufacturer}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).price + ":  ${medicin.price}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          S.of(context).quantity +
                              ":  ${medicin.quantity_available}", //medecine.quantityRequired
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
