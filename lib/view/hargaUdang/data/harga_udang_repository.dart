import 'package:dio/dio.dart';
import 'package:udang_app/const/api.dart';

class HargaUdangRepository {
  final dio = Dio();

  getListHargaUdang(region) async {
    try {
      final response = await dio.get(
        (ApiUrl.baseUrl + ApiUrl.listHargaUdang),
        queryParameters: {
          "per_page": 15,
          "page": 1,
          "with": "creator",
          "region_id": region,
        },
      );
      return response.data;
    } catch (error) {
      print(error);
    }
  }

  getDetailHargaUdang(id, idRegion) async {
    try {
      final response = await dio.get(
        ("${ApiUrl.baseUrl}${ApiUrl.detailHargaUdang}/$id"),
        queryParameters: {
          "with": "creator",
          "region_id": idRegion,
        },
      );
      return response.data;
    } catch (error) {
      print(error);
    }
  }

  getListRegion(search) async {
    try {
      final response = await dio.get(
        (ApiUrl.baseUrl + ApiUrl.listRegion),
        queryParameters: {
          "has": "shrimp_prices",
          "search": search,
        },
      );
      return response.data;
    } catch (error) {
      print(error);
    }
  }
}
