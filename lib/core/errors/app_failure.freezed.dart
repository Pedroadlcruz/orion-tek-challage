// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cache,
    required TResult Function() unexpected,
    required TResult Function() nameDuplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cache,
    TResult? Function()? unexpected,
    TResult? Function()? nameDuplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cache,
    TResult Function()? unexpected,
    TResult Function()? nameDuplication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(NameDuplicationFailure value) nameDuplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(NameDuplicationFailure value)? nameDuplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(NameDuplicationFailure value)? nameDuplication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res, AppFailure>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res, $Val extends AppFailure>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CacheFailureImplCopyWith<$Res> {
  factory _$$CacheFailureImplCopyWith(
          _$CacheFailureImpl value, $Res Function(_$CacheFailureImpl) then) =
      __$$CacheFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CacheFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$CacheFailureImpl>
    implements _$$CacheFailureImplCopyWith<$Res> {
  __$$CacheFailureImplCopyWithImpl(
      _$CacheFailureImpl _value, $Res Function(_$CacheFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CacheFailureImpl implements CacheFailure {
  const _$CacheFailureImpl();

  @override
  String toString() {
    return 'AppFailure.cache()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CacheFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cache,
    required TResult Function() unexpected,
    required TResult Function() nameDuplication,
  }) {
    return cache();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cache,
    TResult? Function()? unexpected,
    TResult? Function()? nameDuplication,
  }) {
    return cache?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cache,
    TResult Function()? unexpected,
    TResult Function()? nameDuplication,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(NameDuplicationFailure value) nameDuplication,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(NameDuplicationFailure value)? nameDuplication,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(NameDuplicationFailure value)? nameDuplication,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheFailure implements AppFailure {
  const factory CacheFailure() = _$CacheFailureImpl;
}

/// @nodoc
abstract class _$$UnexpectedFailureImplCopyWith<$Res> {
  factory _$$UnexpectedFailureImplCopyWith(_$UnexpectedFailureImpl value,
          $Res Function(_$UnexpectedFailureImpl) then) =
      __$$UnexpectedFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$UnexpectedFailureImpl>
    implements _$$UnexpectedFailureImplCopyWith<$Res> {
  __$$UnexpectedFailureImplCopyWithImpl(_$UnexpectedFailureImpl _value,
      $Res Function(_$UnexpectedFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnexpectedFailureImpl implements UnexpectedFailure {
  const _$UnexpectedFailureImpl();

  @override
  String toString() {
    return 'AppFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnexpectedFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cache,
    required TResult Function() unexpected,
    required TResult Function() nameDuplication,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cache,
    TResult? Function()? unexpected,
    TResult? Function()? nameDuplication,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cache,
    TResult Function()? unexpected,
    TResult Function()? nameDuplication,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(NameDuplicationFailure value) nameDuplication,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(NameDuplicationFailure value)? nameDuplication,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(NameDuplicationFailure value)? nameDuplication,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements AppFailure {
  const factory UnexpectedFailure() = _$UnexpectedFailureImpl;
}

/// @nodoc
abstract class _$$NameDuplicationFailureImplCopyWith<$Res> {
  factory _$$NameDuplicationFailureImplCopyWith(
          _$NameDuplicationFailureImpl value,
          $Res Function(_$NameDuplicationFailureImpl) then) =
      __$$NameDuplicationFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NameDuplicationFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$NameDuplicationFailureImpl>
    implements _$$NameDuplicationFailureImplCopyWith<$Res> {
  __$$NameDuplicationFailureImplCopyWithImpl(
      _$NameDuplicationFailureImpl _value,
      $Res Function(_$NameDuplicationFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NameDuplicationFailureImpl implements NameDuplicationFailure {
  const _$NameDuplicationFailureImpl();

  @override
  String toString() {
    return 'AppFailure.nameDuplication()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameDuplicationFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cache,
    required TResult Function() unexpected,
    required TResult Function() nameDuplication,
  }) {
    return nameDuplication();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cache,
    TResult? Function()? unexpected,
    TResult? Function()? nameDuplication,
  }) {
    return nameDuplication?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cache,
    TResult Function()? unexpected,
    TResult Function()? nameDuplication,
    required TResult orElse(),
  }) {
    if (nameDuplication != null) {
      return nameDuplication();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CacheFailure value) cache,
    required TResult Function(UnexpectedFailure value) unexpected,
    required TResult Function(NameDuplicationFailure value) nameDuplication,
  }) {
    return nameDuplication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(UnexpectedFailure value)? unexpected,
    TResult? Function(NameDuplicationFailure value)? nameDuplication,
  }) {
    return nameDuplication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CacheFailure value)? cache,
    TResult Function(UnexpectedFailure value)? unexpected,
    TResult Function(NameDuplicationFailure value)? nameDuplication,
    required TResult orElse(),
  }) {
    if (nameDuplication != null) {
      return nameDuplication(this);
    }
    return orElse();
  }
}

abstract class NameDuplicationFailure implements AppFailure {
  const factory NameDuplicationFailure() = _$NameDuplicationFailureImpl;
}
