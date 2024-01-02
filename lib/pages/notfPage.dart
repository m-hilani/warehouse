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
                  height: 100,
                ),
                Repo(repo: repo),
              ],
            ),
          ],
        ));
  }
}
