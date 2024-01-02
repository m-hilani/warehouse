import 'package:medecin_app/models/Date.dart';
import 'package:medecin_app/models/medicine_model.dart';

class RepoModel {
  final DateTime start_date;
  final DateTime end_date;
  final dynamic total_sales;
  final dynamic total_orders;

  RepoModel({
    required this.end_date,
    required this.start_date,
    required this.total_orders,
    required this.total_sales,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      end_date: DateTime.parse(json["end_date"]),
      start_date: DateTime.parse(json["start_date"]),
      total_orders: json["total_orders"],
      total_sales: json["total_sales"],
    );
  }
}
