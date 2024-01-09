
import '../model/rate_result.dart';

abstract interface class RateRepository {
  Future<List<RateResult>> getRateResult(String baseCode);
}