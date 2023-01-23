import 'dart:convert';

import 'package:dio/dio.dart';

class BankService {
  BankService(this.dio);
  final Dio dio;

  Future<String> getDolarToReal() async {
    var url = ('economia.awesomeapi.com.br' '/last/USD-BRL');
    try {
      final response = await dio.get(url);
      var jsonResponse = jsonDecode(response.data) as Map<String, dynamic>;
      String value = jsonResponse['USDBRL']['high'];
      return value;
    } on DioError catch (_) {
      throw DioError(requestOptions: RequestOptions(path: url));
    } catch (e) {
      throw Exception('Erro ao pegar albums');
    }
  }
}
