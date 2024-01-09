import 'dart:convert';

import 'package:currency_exchange/data/model/rate.dart';
import 'package:http/http.dart' as http;

class RateApi {
  // 여러개 리스트 받을 때 패턴
  Future<List<Rate>> getRateApi() async {
    final response =
    await http.get(Uri.parse('https://open.er-api.com/v6/latest/KRW'));
    final jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList.map((e) => Rate.fromJson(e)).toList();
  }
}