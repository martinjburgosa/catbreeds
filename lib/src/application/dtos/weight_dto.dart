import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight_dto.g.dart';

@JsonSerializable()
class WeightDto extends Equatable {
  factory WeightDto.fromJson(Map<String, dynamic> json) =>
      _$WeightDtoFromJson(json);

  const WeightDto({
    required this.imperial,
    required this.metric,
  });

  final String imperial;
  final String metric;

  Map<String, dynamic> toJson() => _$WeightDtoToJson(this);

  @override
  List<Object?> get props => [imperial, metric];
}
