import 'package:medecin_app/models/Date.dart';

class MedicineModel {
  final String scientific_name;
  final String trade_name;
  final String manufacturer;
  final String category;
  final dynamic quantity_available;
  final dynamic price;
  final dynamic expiry_date;

  MedicineModel({
    required this.scientific_name,
    required this.trade_name,
    required this.category,
    required this.manufacturer,
    required this.quantity_available,
    required this.price,
    required this.expiry_date,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
        trade_name: json['trade_name'],
        category: json['category'],
        manufacturer: json['manufacturer'],
        price: json['price'],
        quantity_available: json['quantity_available'],
        scientific_name: json['scientific_name'],
        expiry_date: json['expiry_date']
        /*year: json['exp']['year'],
          month: json['exp']['month'],
          day: json['exp']['day']*/
        );
  }
}
