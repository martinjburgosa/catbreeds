import 'package:equatable/equatable.dart';

import 'weight_ds_dto.dart';

const String _imageUrl = 'https://cdn2.thecatapi.com/images/';

class CatInfoDsDto extends Equatable {
  factory CatInfoDsDto.fromJson(Map<String, dynamic> map) => CatInfoDsDto(
      weight: WeightDsDto.fromJson(map['weight'] as Map<String, dynamic>),
      id: map['id'] as String,
      name: map['name'] as String,
      temperament: map['temperament'] as String,
      origin: map['origin'] as String,
      countryCodes: map['country_codes'] as String,
      countryCode: map['country_code'] as String,
      description: map['description'] as String,
      lifeSpan: map['life_span'] as String,
      indoor: int.parse(map['indoor'].toString()),
      adaptability: int.parse(map['adaptability'].toString()),
      affectionLevel: int.parse(map['affection_level'].toString()),
      childFriendly: int.parse(map['child_friendly'].toString()),
      dogFriendly: int.parse(map['dog_friendly'].toString()),
      energyLevel: int.parse(map['energy_level'].toString()),
      grooming: int.parse(map['grooming'].toString()),
      healthIssues: int.parse(map['health_issues'].toString()),
      intelligence: int.parse(map['intelligence'].toString()),
      sheddingLevel: int.parse(map['shedding_level'].toString()),
      socialNeeds: int.parse(map['social_needs'].toString()),
      strangerFriendly: int.parse(map['stranger_friendly'].toString()),
      vocalisation: int.parse(map['vocalisation'].toString()),
      experimental: int.parse(map['experimental'].toString()),
      hairless: int.parse(map['hairless'].toString()),
      natural: int.parse(map['natural'].toString()),
      rare: int.parse(map['rare'].toString()),
      rex: int.parse(map['rex'].toString()),
      suppressedTail: int.parse(map['suppressed_tail'].toString()),
      shortLegs: int.parse(map['short_legs'].toString()),
      hypoallergenic: int.parse(map['hypoallergenic'].toString()),
      referenceImageId: map['referenceImageId'].toString(),
      imageUrl: '$_imageUrl${map['reference_image_id'].toString()}.jpg');

  const CatInfoDsDto({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.hypoallergenic,
    required this.referenceImageId,
    required this.imageUrl,
  });

  final WeightDsDto weight;
  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final int hypoallergenic;
  final String referenceImageId;
  final String imageUrl;

  static List<CatInfoDsDto> listFromJson(List<dynamic> json) => json
      .map((e) => CatInfoDsDto.fromJson(e as Map<String, dynamic>))
      .toList();

  Map<String, dynamic> toJson() {
    return {
      'weight': weight.toJson(),
      'id': id,
      'name': name,
      'temperament': temperament,
      'origin': origin,
      'country_codes': countryCodes,
      'country_code': countryCode,
      'description': description,
      'life_span': lifeSpan,
      'indoor': indoor,
      'adaptability': adaptability,
      'affection_level': affectionLevel,
      'child_friendly': childFriendly,
      'dog_friendly': dogFriendly,
      'energy_level': energyLevel,
      'grooming': grooming,
      'health_issues': healthIssues,
      'intelligence': intelligence,
      'shedding_level': sheddingLevel,
      'social_needs': socialNeeds,
      'stranger_friendly': strangerFriendly,
      'vocalisation': vocalisation,
      'experimental': experimental,
      'hairless': hairless,
      'natural': natural,
      'rare': rare,
      'rex': rex,
      'suppressed_tail': suppressedTail,
      'shortLegs': shortLegs,
      'hypoallergenic': hypoallergenic,
      'reference_image_id': referenceImageId,
      'image_url': imageUrl,
    };
  }

  @override
  List<Object?> get props => [
        weight,
        id,
        name,
        temperament,
        origin,
        countryCodes,
        countryCode,
        description,
        lifeSpan,
        indoor,
        adaptability,
        affectionLevel,
        childFriendly,
        dogFriendly,
        energyLevel,
        grooming,
        healthIssues,
        intelligence,
        sheddingLevel,
        socialNeeds,
        strangerFriendly,
        vocalisation,
        experimental,
        hairless,
        natural,
        rare,
        rex,
        suppressedTail,
        shortLegs,
        hypoallergenic,
        referenceImageId,
        imageUrl,
      ];
}
