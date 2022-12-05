// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      name: json['name'] as String,
      topLevelDomain: (json['topLevelDomain'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      alpha2Code: json['alpha2Code'] as String? ?? '',
      alpha3Code: json['alpha3Code'] as String? ?? '',
      callingCodes: (json['callingCodes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      capital: json['capital'] as String? ?? '',
      altSpellings: (json['altSpellings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      region: json['region'] as String,
      subregion: json['subregion'] as String,
      population: json['population'] as int? ?? 0,
      latlng:
          (json['latlng'] as List<dynamic>?)?.map((e) => e as num).toList() ??
              const [],
      demonym: json['demonym'] as String? ?? '',
      area: json['area'] as num,
      gini: (json['gini'] as num?)?.toDouble() ?? 0,
      timezones: (json['timezones'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      borders: (json['borders'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      nativeName: json['nativeName'] as String? ?? '',
      numericCode: json['numericCode'] as String? ?? '',
      currencies: (json['currencies'] as List<dynamic>?)
              ?.map((e) => Currency.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      translations: json['translations'] == null
          ? null
          : Translations.fromJson(json['translations'] as Map<String, dynamic>),
      flags: json['flags'] == null
          ? null
          : Flags.fromJson(json['flags'] as Map<String, dynamic>),
      regionalBlocs: (json['regionalBlocs'] as List<dynamic>?)
              ?.map((e) => RegionalBloc.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cioc: json['cioc'] as String? ?? '',
      independent: json['independent'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'name': instance.name,
      'topLevelDomain': instance.topLevelDomain,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'callingCodes': instance.callingCodes,
      'capital': instance.capital,
      'altSpellings': instance.altSpellings,
      'region': instance.region,
      'subregion': instance.subregion,
      'population': instance.population,
      'latlng': instance.latlng,
      'demonym': instance.demonym,
      'area': instance.area,
      'gini': instance.gini,
      'timezones': instance.timezones,
      'borders': instance.borders,
      'nativeName': instance.nativeName,
      'numericCode': instance.numericCode,
      'currencies': instance.currencies,
      'languages': instance.languages,
      'translations': instance.translations,
      'flags': instance.flags,
      'regionalBlocs': instance.regionalBlocs,
      'cioc': instance.cioc,
      'independent': instance.independent,
    };
