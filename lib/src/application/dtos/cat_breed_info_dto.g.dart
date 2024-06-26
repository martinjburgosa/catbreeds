// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_breed_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatBreedInfoDto _$CatBreedInfoDtoFromJson(Map<String, dynamic> json) =>
    CatBreedInfoDto(
      weight: WeightDto.fromJson(json['weight'] as Map<String, dynamic>),
      id: json['id'] as String,
      name: json['name'] as String,
      temperament: json['temperament'] as String,
      origin: json['origin'] as String,
      countryCodes: json['countryCodes'] as String,
      countryCode: json['countryCode'] as String,
      description: json['description'] as String,
      lifeSpan: json['lifeSpan'] as String,
      indoor: json['indoor'] as int,
      adaptability: json['adaptability'] as int,
      affectionLevel: json['affectionLevel'] as int,
      childFriendly: json['childFriendly'] as int,
      dogFriendly: json['dogFriendly'] as int,
      energyLevel: json['energyLevel'] as int,
      grooming: json['grooming'] as int,
      healthIssues: json['healthIssues'] as int,
      intelligence: json['intelligence'] as int,
      sheddingLevel: json['sheddingLevel'] as int,
      socialNeeds: json['socialNeeds'] as int,
      strangerFriendly: json['strangerFriendly'] as int,
      vocalisation: json['vocalisation'] as int,
      experimental: json['experimental'] as int,
      hairless: json['hairless'] as int,
      natural: json['natural'] as int,
      rare: json['rare'] as int,
      rex: json['rex'] as int,
      suppressedTail: json['suppressedTail'] as int,
      shortLegs: json['shortLegs'] as int,
      hypoallergenic: json['hypoallergenic'] as int,
      referenceImageId: json['referenceImageId'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$CatBreedInfoDtoToJson(CatBreedInfoDto instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'id': instance.id,
      'name': instance.name,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'countryCodes': instance.countryCodes,
      'countryCode': instance.countryCode,
      'description': instance.description,
      'lifeSpan': instance.lifeSpan,
      'indoor': instance.indoor,
      'adaptability': instance.adaptability,
      'affectionLevel': instance.affectionLevel,
      'childFriendly': instance.childFriendly,
      'dogFriendly': instance.dogFriendly,
      'energyLevel': instance.energyLevel,
      'grooming': instance.grooming,
      'healthIssues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'sheddingLevel': instance.sheddingLevel,
      'socialNeeds': instance.socialNeeds,
      'strangerFriendly': instance.strangerFriendly,
      'vocalisation': instance.vocalisation,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'rex': instance.rex,
      'suppressedTail': instance.suppressedTail,
      'shortLegs': instance.shortLegs,
      'hypoallergenic': instance.hypoallergenic,
      'referenceImageId': instance.referenceImageId,
      'imageUrl': instance.imageUrl,
    };
