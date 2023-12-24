import 'package:flutter/material.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/sahred/shared.dart';
import 'package:medecin_app/widgets/customButton.dart';

import '../generated/l10n.dart';
import '../models/Date.dart';
import '../widgets/customTextFild.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});
  static String id = "addMedicinePage";

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  List<dynamic> categories = [
    'Analgesic',
    'Anti-inflammatory',
    "Antibiotic",
    "Antipyretic",
    "Antihistamine",
    "Others"
  ];
  String? selectedCategory = 'Analgesic';

  void initState() {
    // getCategories();
  }

  void getCategories() async {
    try {
      categories = await Api().get(url: '$baseUrl/categories', token: token);
    } catch (e) {
      print(e);
    }
  }

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

  String? scientificName;
  String? commercialName;
  String? category;
  String? factory;
  int? quantity;
  double? price;
  String? day;
  String? month;
  String? year;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double padding() {
      if (width > 900)
        return width * 0.25;
      else if (width > 600)
        return width * 0.2;
      else
        return 0;
    }

    GlobalKey<FormState> formKey = GlobalKey();

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
        title: Text(S.of(context).addMedicine),
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              // Expanded(child: Container()),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding()),
                  child: Form(
                    key: formKey,
                    child: ListView(
                      children: [
                        CustomTextFild(
                          onChanged: (value) {
                            scientificName = value;
                          },
                          obsecure: false,
                          hintText: S.of(context).scientificName,
                        ),
                        CustomTextFild(
                          onChanged: (value) {
                            commercialName = value;
                          },
                          obsecure: false,
                          hintText: S.of(context).commercialName,
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
                            isExpanded: true,
                            /* hint: Text(
                              'Select Category',
                              style: TextStyle(
                                color: Color.fromARGB(172, 58, 176, 184),
                                fontSize: 18,
                              ),
                            ),*/ // Displayed when no category is selected
                            value: selectedCategory,
                            onChanged: (value) {
                              selectedCategory = value as String;
                            },
                            items: DropDownGenerator()),
                        /*categories
                                .map((dynamic item) => item.toString())
                                .toList()),*/

                        CustomTextFild(
                          onChanged: (value) {
                            factory = value;
                          },
                          obsecure: false,
                          hintText: S.of(context).factory,
                        ),
                        CustomTextFild(
                          onChanged: (value) {
                            quantity = int.parse(value);
                          },
                          keyboardType: TextInputType.number,
                          obsecure: false,
                          hintText: S.of(context).quantity,
                        ),
                        CustomTextFild(
                          onChanged: (value) {
                            price = double.parse(value);
                          },
                          keyboardType: TextInputType.number,
                          obsecure: false,
                          hintText: S.of(context).price,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFild(
                                extraValidator: () {
                                  if (int.parse(day!) > 30) {
                                    return "Invalid month";
                                  }
                                },
                                onChanged: (value) {
                                  day = (value);
                                },
                                keyboardType: TextInputType.number,
                                obsecure: false,
                                hintText: S.of(context).day,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFild(
                                extraValidator: () {
                                  if (int.parse(month!) > 12) {
                                    return "Invalid month";
                                  }
                                },
                                onChanged: (value) {
                                  month = (value);
                                },
                                keyboardType: TextInputType.number,
                                obsecure: false,
                                hintText: S.of(context).month,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFild(
                                extraValidator: () {
                                  if (int.parse(year!) < 2024)
                                    return 'the medicine is expired';
                                },
                                onChanged: (value) {
                                  year = (value);
                                },
                                keyboardType: TextInputType.number,
                                obsecure: false,
                                hintText: S.of(context).year,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomButton(
                              text: S.of(context).addMedicine,
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  await CacheNetwork.cacheInitialization();
                                  String token =
                                      await CacheNetwork.getCacheData(
                                          key: 'token') as String;

                                  try {
                                    await Api().post(
                                        url: '$baseUrl/addMedicine',
                                        body: {
                                          "price": "$price",
                                          "expiry_date": "$day-$month-$year",
                                          "quantity_available": "$quantity",
                                          "manufacturer": "$factory",
                                          "trade_name": "$commercialName",
                                          "scientific_name": "$scientificName",
                                          "category": "$selectedCategory",
                                          "token": token
                                        },
                                        token:
                                            'E2MCOT7On1AhKvvXgbXxm0A2as26RQ48xEeuZ9TD7mBn3dAlPiqL9tJjly4K');
                                  } catch (e) {
                                    print(e);
                                  }
                                  Navigator.pop(context);
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
