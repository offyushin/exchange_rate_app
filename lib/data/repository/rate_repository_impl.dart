import 'package:currency_exchange/data/data_source/rate_api.dart';
import 'package:currency_exchange/data/model/rate_result.dart';
import 'package:currency_exchange/data/repository/rate_repository.dart';

class RateImpl implements RateRepository {
  final RateApi _rateApi;

  RateImpl(this._rateApi);

  @override
  Future<List<RateResult>> getRateResult(String baseCode) async {
    try {
      final response = await _rateApi.getRateApi('1');
      return response.map((e) => RateResult.fromJson(e)).toList();
    } catch (e) {
      throw Exception('에러다');
    }
  }
}
