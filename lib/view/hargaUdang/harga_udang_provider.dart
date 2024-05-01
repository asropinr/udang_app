import 'package:flutter/material.dart';
import 'package:udang_app/view/hargaUdang/data/detail_harga_udang_model.dart';
import 'package:udang_app/view/hargaUdang/data/harga_udang_repository.dart';
import 'package:udang_app/view/hargaUdang/data/list_harga_udang_model.dart';
import 'package:udang_app/view/hargaUdang/data/list_region_model.dart';

class HargaUdangProvider extends ChangeNotifier {
  final HargaUdangRepository hargaUdangRepository = HargaUdangRepository();

  bool isLoading = true;
  bool isLoadingRegion = true;
  ListHargaUdangModel? listHargaUdangModel;
  ListRegionModel? listRegionModel;
  DetailHargaUdangModel? detailHargaUdangModel;

  getListHaragUdang(region) async {
    isLoading = true;
    try {
      final res = await hargaUdangRepository.getListHargaUdang(region);
      if (res != null) {
        listHargaUdangModel = ListHargaUdangModel.fromJson(res);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  getDetailHargaUdang(id, idRegion) async {
    isLoading = true;
    try {
      final res = await hargaUdangRepository.getDetailHargaUdang(id, idRegion);
      if (res != null) {
        detailHargaUdangModel = DetailHargaUdangModel.fromJson(res);
        print("INI MASUK KAH");
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  getListRegion(search) async {
    isLoadingRegion = true;
    try {
      final res = await hargaUdangRepository.getListRegion(search);
      if (res != null) {
        listRegionModel = ListRegionModel.fromJson(res);
      }
    } catch (e) {
      print(e);
    }
    isLoadingRegion = false;
    notifyListeners();
  }
}
