import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/models/medicine_model.dart';

class CartMedicineService {
  Future<List<MedicineModel>> getAllCartMedicine(
      {required String token}) async {
    List<dynamic> data =
        await Api().get(url: 'put the get url here with token');

    List<MedicineModel> medicinesList = [];
    for (int i = 0; i < data.length; i++) {
      medicinesList.add(
        MedicineModel.fromJson(data[i]),
      );
    }
    return medicinesList;
  }
}
