import 'package:freezed_annotation/freezed_annotation.dart';

part 'flags.freezed.dart';
part 'flags.g.dart';

@freezed
class Flags with _$Flags {
  const factory Flags({
    @Default('') String svg,
    @Default('') String png,
  }) = _Flags;

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
}
