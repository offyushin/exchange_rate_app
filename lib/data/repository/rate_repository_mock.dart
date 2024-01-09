import 'package:currency_exchange/data/model/rate.dart';
import 'package:currency_exchange/data/model/rate_result.dart';

import 'rate_repository.dart';

class RateRepositoryimpl implements RateRepository {

  @override
  Future<RateResult> getRateResult(String baseCode) async {
    if (baseCode == 'KRW') {
      try {
        final rates = krwMockJson['rates'] as Map<String, num>;
        final nextTimestamp = krwMockJson['time_next_update_unix'];
        final lastTimestamp = krwMockJson['time_last_update_unix'];
        return RateResult(
          baseCode: baseCode,
          rates:
          rates.entries.map((e) => Rate(code: e.key, rate: e.value)).toList(),
          lastUpdateTime:
          DateTime.fromMillisecondsSinceEpoch((lastTimestamp as int) * 1000),
          nextUpdateTime:
          DateTime.fromMillisecondsSinceEpoch((nextTimestamp as int) * 1000),
        );
      } catch (error) {
        rethrow; // Rethrow to allow for further error handling
      }
    } else if (baseCode == 'USD') {
      try {
        final rates = usdMockJson['rates'] as Map<String, num>;
        final nextTimestamp = usdMockJson['time_next_update_unix'];
        final lastTimestamp = usdMockJson['time_last_update_unix'];
        return RateResult(
          baseCode: baseCode,
          rates:
          rates.entries.map((e) => Rate(code: e.key, rate: e.value)).toList(),
          lastUpdateTime:
          DateTime.fromMillisecondsSinceEpoch((lastTimestamp as int) * 1000),
          nextUpdateTime:
          DateTime.fromMillisecondsSinceEpoch((nextTimestamp as int) * 1000),
        );
      } catch (error) {
        rethrow; // Rethrow to allow for further error handling
      }
    } else {
      throw Exception('Not implemented');
    }
  }
}