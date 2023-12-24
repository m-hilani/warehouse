import 'package:flutter/material.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/widgets/customCardCart.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  static String id = "OrderPage";
  @override
  Widget build(BuildContext context) {
    final List<MedicineModel> medicines =
        ModalRoute.of(context)!.settings.arguments as List<MedicineModel>;

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
        title: Text(S.of(context).My_Order),
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: medicines.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getCrossAxisCount(),
              childAspectRatio: 1.6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return CustomCardCart(medicin: medicines[index]);
          },
        ),
      ),
    );
  }
}
