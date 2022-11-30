import 'package:freezed_annotation/freezed_annotation.dart';

part 'regional_bloc.freezed.dart';
part 'regional_bloc.g.dart';

@freezed
class RegionalBloc with _$RegionalBloc {
  const factory RegionalBloc({
    required String acronym,
    @Default('') String name,
    @Default([]) List<String> otherNames,
    @Default([]) List<String> otherAcronyms,
  }) = _RegionalBloc;

  factory RegionalBloc.fromJson(Map<String, dynamic> json) =>
      _$RegionalBlocFromJson(json);
}
