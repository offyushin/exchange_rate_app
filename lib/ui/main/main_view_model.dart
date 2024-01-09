import 'package:currency_exchange/data/repository/rate_repository.dart';
import 'package:flutter/material.dart';

import 'main_state.dart';

class MainViewModel extends ChangeNotifier {
  final RateRepository _rateRepository;

  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required RateRepository rateRepository,
  }) : _rateRepository = rateRepository {
    _updateRateResult(state.baseCode);
  }

  Future<void> _updateRateResult(String baseCode) async {
    final result = await _rateRepository.getRateResult(baseCode);
    _state = state.copyWith(rateResult: result);
    notifyListeners();
  }

  void inputBaseMoney(num baseMoney) {
    final rateResult = state.rateResult!
    .firstWhere((result) => result.baseCode == state.baseCode);
    final rate = rateResult.rates
    .firstWhere((rate) => rate.code == state.targetCode).rate;
    _state = state.copyWith(
      baseMoney: baseMoney,
      targetMoney: baseMoney * rate,
    );
    notifyListeners();
  }

  void inputBaseCode(String baseCode) async {
    _state = state.copyWith(baseCode: baseCode);

    await _updateRateResult(baseCode);

    final rateResult = state.rateResult!
        .firstWhere((result) => result.baseCode == state.baseCode);

    final rate = rateResult.rates
        .firstWhere((rate) => rate.code == state.targetCode).rate;

    _state = state.copyWith(
      targetMoney: state.baseMoney * rate
    );

    notifyListeners();
  }

  void targetBaseMoney(num baseMoney) {}

  void targetBaseCode(String baseCode) {}
}
