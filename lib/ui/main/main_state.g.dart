// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainStateImpl _$$MainStateImplFromJson(Map<String, dynamic> json) =>
    _$MainStateImpl(
      rateResult: (json['rateResult'] as List<dynamic>?)
          ?.map((e) => RateResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLoading: json['isLoading'] as bool? ?? false,
      baseMoney: json['baseMoney'] as num? ?? 1,
      targetMoney: json['targetMoney'] as num? ?? 1,
      baseCode: json['baseCode'] as String? ?? 'KRW',
      targetCode: json['targetCode'] as String? ?? 'USD',
    );

Map<String, dynamic> _$$MainStateImplToJson(_$MainStateImpl instance) =>
    <String, dynamic>{
      'rateResult': instance.rateResult,
      'isLoading': instance.isLoading,
      'baseMoney': instance.baseMoney,
      'targetMoney': instance.targetMoney,
      'baseCode': instance.baseCode,
      'targetCode': instance.targetCode,
    };
