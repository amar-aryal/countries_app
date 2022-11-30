import 'package:freezed_annotation/freezed_annotation.dart';

part 'translations.freezed.dart';
part 'translations.g.dart';

@freezed
class Translations with _$Translations {
  const factory Translations({
    @Default('') String br,
    @Default('') String pt,
    @Default('') String nl,
    @Default('') String hr,
    @Default('') String fa,
    @Default('') String de,
    @Default('') String es,
    @Default('') String fr,
    @Default('') String ja,
    @Default('') String it,
    @Default('') String hu,
  }) = _Translations;

  factory Translations.fromJson(Map<String, dynamic> json) =>
      _$TranslationsFromJson(json);
}
