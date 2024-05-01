import 'package:flutter/material.dart';
import 'package:udang_app/view/kabarUdang/data/kabar_udang_repository.dart';
import 'package:udang_app/view/kabarUdang/data/list_kabar_udang_model.dart';

class KabarUdangProvider extends ChangeNotifier {
  final KabarUdangRepository kabarUdangRepository = KabarUdangRepository();

  bool isLoading = true;
  ListKabarUdangModel? listKabarUdangModel;

  getListKabarUdang() async {
    isLoading = true;

    try {
      final res = await kabarUdangRepository.getListKabarUdang();
      if (res != null) {
        listKabarUdangModel = ListKabarUdangModel.fromJson(res);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
