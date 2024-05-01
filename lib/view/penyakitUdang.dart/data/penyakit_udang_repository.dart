import 'package:dio/dio.dart';
import 'package:udang_app/const/api.dart';

class PenyakitUdangRepository {
  final dio = Dio();

  getListPenyakitUdang() async {
    try {
      final response = await dio.get(
        (ApiUrl.baseUrl + ApiUrl.listPenyakit),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiUrl.token}',
          },
        ),
        queryParameters: {
          "per_page": 15,
          "page": 1,
        },
      );
      return response.data;
    } catch (error) {
      print(error);
    }
  }
}
