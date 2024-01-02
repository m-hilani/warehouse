import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/helper/MyDrawer.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/pages/cartPage.dart';

import 'package:medecin_app/pages/OrdersPage.dart';
import 'package:medecin_app/pages/notfPage.dart';
import 'package:medecin_app/pages/searchPage.dart';
import 'package:medecin_app/services/all_categories_service.dart';
import 'package:medecin_app/shared/shared.dart';
import 'package:medecin_app/widgets/customCard.dart';
import 'package:medecin_app/widgets/customCategoryCard.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    await CacheNetwork.cacheInitialization();
    token = await CacheNetwork.getCacheData(key: 'token');
    username = await CacheNetwork.getCacheData(key: 'username');
  }

  @override
  Widget build(BuildContext context) {
    List categories = [
      'Analgesic',
      'Anti-inflammatory',
      "Antibiotic",
      "Antipyretic",
      "Antihistamine",
      "Others"
    ];

    List images = [
      "assets/images/Anti.jpg",
      "assets/images/R (2).jpg",
      "assets/images/R (1).jpg",
      "assets/images/R.jpg",
      "assets/images/R (3).jpg",
      "assets/images/R (4).jpg"
    ];

    List<dynamic> labelCategories = S.of(context).Arabic == "Arabic"
        ? [
            'Analgesic',
            'Anti-inflammatory',
            "Antibiotic",
            "Antipyretic",
            "Antihistamine",
            "Others"
          ]
        : [
            'مسكن',
            'مضاد التهاب',
            "مضاد حيوي",
            "خافض للحرارة",
            "مضادات الهيستامين",
            "اخرى"
          ];

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
      /*
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home), label: S.of(context).Home),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.list), label: S.of(context).Orders),
          NavigationDestination(
              icon: Icon(Icons.favorite), label: S.of(context).Favourite),
          NavigationDestination(
              icon: Icon(Icons.notifications),
              label: S.of(context).Notifications)
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),*/
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(S.of(context).Home),
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
        actions: [
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.id);
              },
              icon: Icon(
                Icons.search,
              )),
          /*  IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.pushNamed(context, CartPage.id);
              },
              icon: Icon(
                FontAwesomeIcons.cartPlus,
              ))*/
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: /* FutureBuilder<List<dynamic>>(
                  future: AllCategoriesService().getAllCateogires(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<dynamic> categories = snapshot.data!;
                      return*/
              Expanded(
            child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(),
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return CustomCategoryCard(
                    category: categories[index],
                    label: labelCategories[index],
                    image: images[index],
                  );
                }),
          )
          /*  } else
                      return Center(child: CircularProgressIndicator());
                  }),*/
          ),
    );
  }
}
