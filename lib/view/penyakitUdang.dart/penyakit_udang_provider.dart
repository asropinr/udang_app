import 'package:flutter/material.dart';
import 'package:udang_app/view/penyakitUdang.dart/data/list_penyakit_udang_model.dart';
import 'package:udang_app/view/penyakitUdang.dart/data/penyakit_udang_repository.dart';

class PenyakitUdangProvider extends ChangeNotifier {
  final PenyakitUdangRepository penyakitUdangRepository =
      PenyakitUdangRepository();

  ListPenyakitUdangModel? listPenyakitUdangModel;
  bool isLoading = true;

  getListPenyakit() async {
    isLoading = true;
    try {
      final res = await penyakitUdangRepository.getListPenyakitUdang();
      if (res != null) {
        listPenyakitUdangModel = ListPenyakitUdangModel.fromJson(res);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
