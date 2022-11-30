import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:know_my_country/core/models/currency.dart';
import 'package:know_my_country/core/models/flags.dart';
import 'package:know_my_country/core/models/language.dart';
import 'package:know_my_country/core/models/regional_bloc.dart';
import 'package:know_my_country/core/models/translations.dart';

part 'country.freezed.dart';
part 'country.g.dart';

@freezed
class Country with _$Country {
  const factory Country({
    required String name,
    @Default([]) List<String> topLevelDomain,
    @Default('') String alpha2Code,
    @Default('') String alpha3Code,
    @Default([]) List<String> callingCodes,
    @Default('') String capital,
    @Default([]) List<String> altSpellings,
    required String region,
    required String continent,
    @Default(0) int population,
    @Default([]) List<num> latlng,
    @Default('') String demonym,
    required num area,
    @Default(0) double gini,
    @Default([]) List<String> timezones,
    @Default([]) List<String> borders,
    @Default('') String nativeName,
    @Default('') String numericCode,
    @Default([]) List<Currency> currencies,
    @Default([]) List<Language> languages,
    Translations? translations,
    Flags? flags,
    @Default([]) List<RegionalBloc> regionalBlocs,
    @Default('') String cioc,
    @Default(false) bool independent,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
