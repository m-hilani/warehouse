import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/pages/homePage.dart';
import 'package:medecin_app/pages/loginPage.dart';

import '../sahred/shared.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});
  static String id = "LogoPage";

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();

    getToken();
    // TODO: implement initState
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(
            context, token != null ? HomePage.id : LogInPage.id));
  }

  Future<void> getToken() async {
    await CacheNetwork.cacheInitialization();
    token = await CacheNetwork.getCacheData(key: 'token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF0F919E),
            Color(0xFF3AAFB8),
            Color(0xFF63CAD1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                      klogo,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(S.of(context).title_logo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Pacifico',
                )),
          ],
        ),
      ),
    );
  }
}
