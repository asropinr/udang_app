import 'package:dio/dio.dart';
import 'package:udang_app/const/api.dart';

class KabarUdangRepository {
  final dio = Dio();

  getListKabarUdang() async {
    try {
      final response = await dio.get(
        (ApiUrl.baseUrl + ApiUrl.listKabarUdang),
        queryParameters: {
          "per_page": 15,
          "page": 1,
          "with": "creator",
        },
      );
      return response.data;
    } catch (error) {
      print(error);
    }
  }
}
