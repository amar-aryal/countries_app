// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'regional_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegionalBloc _$RegionalBlocFromJson(Map<String, dynamic> json) {
  return _RegionalBloc.fromJson(json);
}

/// @nodoc
mixin _$RegionalBloc {
  String get acronym => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get otherNames => throw _privateConstructorUsedError;
  List<String> get otherAcronyms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionalBlocCopyWith<RegionalBloc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionalBlocCopyWith<$Res> {
  factory $RegionalBlocCopyWith(
          RegionalBloc value, $Res Function(RegionalBloc) then) =
      _$RegionalBlocCopyWithImpl<$Res, RegionalBloc>;
  @useResult
  $Res call(
      {String acronym,
      String name,
      List<String> otherNames,
      List<String> otherAcronyms});
}

/// @nodoc
class _$RegionalBlocCopyWithImpl<$Res, $Val extends RegionalBloc>
    implements $RegionalBlocCopyWith<$Res> {
  _$RegionalBlocCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acronym = null,
    Object? name = null,
    Object? otherNames = null,
    Object? otherAcronyms = null,
  }) {
    return _then(_value.copyWith(
      acronym: null == acronym
          ? _value.acronym
          : acronym // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      otherNames: null == otherNames
          ? _value.otherNames
          : otherNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      otherAcronyms: null == otherAcronyms
          ? _value.otherAcronyms
          : otherAcronyms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegionalBlocCopyWith<$Res>
    implements $RegionalBlocCopyWith<$Res> {
  factory _$$_RegionalBlocCopyWith(
          _$_RegionalBloc value, $Res Function(_$_RegionalBloc) then) =
      __$$_RegionalBlocCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String acronym,
      String name,
      List<String> otherNames,
      List<String> otherAcronyms});
}

/// @nodoc
class __$$_RegionalBlocCopyWithImpl<$Res>
    extends _$RegionalBlocCopyWithImpl<$Res, _$_RegionalBloc>
    implements _$$_RegionalBlocCopyWith<$Res> {
  __$$_RegionalBlocCopyWithImpl(
      _$_RegionalBloc _value, $Res Function(_$_RegionalBloc) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acronym = null,
    Object? name = null,
    Object? otherNames = null,
    Object? otherAcronyms = null,
  }) {
    return _then(_$_RegionalBloc(
      acronym: null == acronym
          ? _value.acronym
          : acronym // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      otherNames: null == otherNames
          ? _value._otherNames
          : otherNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      otherAcronyms: null == otherAcronyms
          ? _value._otherAcronyms
          : otherAcronyms // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegionalBloc implements _RegionalBloc {
  const _$_RegionalBloc(
      {required this.acronym,
      this.name = '',
      final List<String> otherNames = const [],
      final List<String> otherAcronyms = const []})
      : _otherNames = otherNames,
        _otherAcronyms = otherAcronyms;

  factory _$_RegionalBloc.fromJson(Map<String, dynamic> json) =>
      _$$_RegionalBlocFromJson(json);

  @override
  final String acronym;
  @override
  @JsonKey()
  final String name;
  final List<String> _otherNames;
  @override
  @JsonKey()
  List<String> get otherNames {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherNames);
  }

  final List<String> _otherAcronyms;
  @override
  @JsonKey()
  List<String> get otherAcronyms {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherAcronyms);
  }

  @override
  String toString() {
    return 'RegionalBloc(acronym: $acronym, name: $name, otherNames: $otherNames, otherAcronyms: $otherAcronyms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegionalBloc &&
            (identical(other.acronym, acronym) || other.acronym == acronym) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._otherNames, _otherNames) &&
            const DeepCollectionEquality()
                .equals(other._otherAcronyms, _otherAcronyms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      acronym,
      name,
      const DeepCollectionEquality().hash(_otherNames),
      const DeepCollectionEquality().hash(_otherAcronyms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegionalBlocCopyWith<_$_RegionalBloc> get copyWith =>
      __$$_RegionalBlocCopyWithImpl<_$_RegionalBloc>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegionalBlocToJson(
      this,
    );
  }
}

abstract class _RegionalBloc implements RegionalBloc {
  const factory _RegionalBloc(
      {required final String acronym,
      final String name,
      final List<String> otherNames,
      final List<String> otherAcronyms}) = _$_RegionalBloc;

  factory _RegionalBloc.fromJson(Map<String, dynamic> json) =
      _$_RegionalBloc.fromJson;

  @override
  String get acronym;
  @override
  String get name;
  @override
  List<String> get otherNames;
  @override
  List<String> get otherAcronyms;
  @override
  @JsonKey(ignore: true)
  _$$_RegionalBlocCopyWith<_$_RegionalBloc> get copyWith =>
      throw _privateConstructorUsedError;
}
