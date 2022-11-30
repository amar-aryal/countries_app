// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regional_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegionalBloc _$$_RegionalBlocFromJson(Map<String, dynamic> json) =>
    _$_RegionalBloc(
      acronym: json['acronym'] as String,
      name: json['name'] as String? ?? '',
      otherNames: (json['otherNames'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      otherAcronyms: (json['otherAcronyms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_RegionalBlocToJson(_$_RegionalBloc instance) =>
    <String, dynamic>{
      'acronym': instance.acronym,
      'name': instance.name,
      'otherNames': instance.otherNames,
      'otherAcronyms': instance.otherAcronyms,
    };
