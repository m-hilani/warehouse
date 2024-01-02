import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/models/RepoModel.dart';
import 'package:medecin_app/models/medicine_model.dart';

class RepoService {
  Future<RepoModel> getRepoService({required String end}) async {
    Map<String, dynamic> data = await Api().get(url: '$baseUrl/repo/$end');

    return RepoModel.fromJson(data);
  }
}
