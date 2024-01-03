import 'package:flutter/material.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/models/RepoModel.dart';
import 'package:medecin_app/widgets/customRepo.dart';

class NotficationsPage extends StatelessWidget {
  const NotficationsPage({super.key});
  static String id = "NotficationsPage";
  @override
  Widget build(BuildContext context) {
    RepoModel repo = ModalRoute.of(context)!.settings.arguments as RepoModel;
    RepoModel repo2 = RepoModel(
        end_date: DateTime(2024, 01, 01),
        start_date: DateTime(2023, 12, 01),
        total_orders: 9,
        total_sales: 12 * 23.3);
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
          title: Text(S.of(context).report),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Repo(repo: repo),
                SizedBox(
                  height: 20,
                ),
                Repo(repo: repo2)
              ],
            ),
          ],
        ));
  }
}
