import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/models/OrderModel.dart';

import '../constants.dart';

class AllOrdersService {
  Future<List<OrderModel>> getAllOrders() async {
    var data = (await Api().get(url: '$baseUrl/allOrders'))["orders"];

    List<OrderModel> ordersList = [];
    for (int i = 0; i < data.length; i++) {
      ordersList.add(
        OrderModel.fromJson(data[i]),
      );
      print(ordersList[i].username);
    }

    return ordersList;
  }
}
