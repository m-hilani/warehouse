import 'package:flutter/material.dart';
import 'package:medecin_app/models/OrderModel.dart';
import 'package:medecin_app/models/RepoModel.dart';

import '../generated/l10n.dart';

class Repo extends StatelessWidget {
  Repo({required this.repo});
  RepoModel? repo;

  Widget build(BuildContext context) {
    return GestureDetector(
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
        height: 300,
        width: 400,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).repoYear,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${S.of(context).from} : "
                "${repo!.start_date.year}"
                "/"
                "${repo!.start_date.month}"
                "/"
                "${repo!.start_date.day}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${S.of(context).to} : "
                "${repo!.end_date.year}"
                "/"
                "${repo!.end_date.month}"
                "/"
                "${repo!.end_date.day}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${S.of(context).total_orders} : "
                "${repo!.total_orders.toString()}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${S.of(context).total_sales} : "
                r"$"
                "${repo!.total_sales.toString()}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
