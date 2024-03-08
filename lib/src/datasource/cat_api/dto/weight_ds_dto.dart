class WeightDsDto {
  factory WeightDsDto.fromJson(Map<String, dynamic> json) => WeightDsDto(
        imperial: json['imperial'] as String,
        metric: json['metric'] as String,
      );
  WeightDsDto({
    required this.imperial,
    required this.metric,
  });

  final String imperial;
  final String metric;

  Map<String, dynamic> toJson() => {
        'metric': metric,
        'imperial': imperial,
      };
}
