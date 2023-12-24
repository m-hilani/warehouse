import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/helper/showSnackBar.dart';
import 'package:medecin_app/pages/homePage.dart';
import 'package:medecin_app/pages/registerPage.dart';
import 'package:medecin_app/sahred/shared.dart';

import '../constants.dart';
import '../generated/l10n.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextFild.dart';

class LogInPage extends StatefulWidget {
  static String id = "LogInPage";

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String? phoneNumber, password;
  bool isobsecure = true;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECE6E6),
      body: /*Row(
        children: [
          Expanded(
            child: Container(
              child: Image.asset(
                'assets/images/img_2.png',
              ),
            ),
          ),*/
          Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Row(
            children: [
              Expanded(
                child: const CircleAvatar(
                  radius: 300,
                  backgroundImage: AssetImage(
                    'assets/images/img_2.png',
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        /* Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 100,
                                  backgroundImage: AssetImage(
                                    'assets/images/img_2.png',
                                  ),
                                ),
                              ],
                            ),*/
                        const SizedBox(height: 50),
                        Text(
                          textAlign: TextAlign.center,
                          S.of(context).title_login,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        CustomTextFild(
                          extraValidator: () {
                            if (phoneNumber?.length != 10 ||
                                phoneNumber![0] != '0' ||
                                phoneNumber![1] != '9') {
                              return "The Phone Number you entered is wrong";
                            }
                          },
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            setState(() {
                              phoneNumber = value;
                            });
                          },
                          obsecure: false,
                          hintText: S.of(context).phoneNumber,
                        ),
                        const SizedBox(height: 12),
                        CustomTextFild(
                          extraValidator: () {
                            if (password!.length < 6) {
                              return "The password is wrong";
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          obsecure: isobsecure,
                          icon: IconButton(
                              onPressed: () {
                                if (isobsecure == false)
                                  isobsecure = true;
                                else
                                  isobsecure = false;
                                setState(() {});
                              },
                              color: kcolor,
                              icon: Icon(isobsecure == false
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash)),
                          hintText: S.of(context).password,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  });
                              await login(context);
                            }
                          },
                          text: S.of(context).title_login,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).Read_login,
                              style: TextStyle(color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, RegisterPage.id);
                              },
                              child: Text(
                                S.of(context).Register,
                                style: TextStyle(
                                  color: Color(0xFF3AAFB8),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      /* ],
      ),*/
    );
  }

  Future<void> login(BuildContext context) async {
    try {
      Map<String, dynamic> data = await Api().post(
        url: '$baseUrl/loginAdmin',
        body: {"phone": "$phoneNumber", "password": "$password"},
      );
      await CacheNetwork.cacheInitialization();
      await CacheNetwork.insertToCache(key: 'token', value: data['token']);
      token = data['token'];
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, HomePage.id);
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
      showSnackBar(
        context,
        massege: e.toString() ==
                "Exception: there is a problem with status code 401 with body {message: phone number is incorrect}"
            ? "phone number is incorrect"
            : "password is incorrect",
        color: Colors.red,
      );
    }
  }
}
