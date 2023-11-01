// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cache,
    required TResult Function() unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cache,
    TResult? Function()? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cache,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CacheException value) cache,
    required TResult Function(UnexpectedException value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CacheException value)? cache,
    TResult? Function(UnexpectedException value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CacheException value)? cache,
    TResult Function(UnexpectedException value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CacheExceptionImplCopyWith<$Res> {
  factory _$$CacheExceptionImplCopyWith(_$CacheExceptionImpl value,
          $Res Function(_$CacheExceptionImpl) then) =
      __$$CacheExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CacheExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$CacheExceptionImpl>
    implements _$$CacheExceptionImplCopyWith<$Res> {
  __$$CacheExceptionImplCopyWithImpl(
      _$CacheExceptionImpl _value, $Res Function(_$CacheExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CacheExceptionImpl implements CacheException {
  const _$CacheExceptionImpl();

  @override
  String toString() {
    return 'AppException.cache()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CacheExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cache,
    required TResult Function() unexpected,
  }) {
    return cache();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cache,
    TResult? Function()? unexpected,
  }) {
    return cache?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cache,
    TResult Function()? unexpected,
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
    required TResult Function(CacheException value) cache,
    required TResult Function(UnexpectedException value) unexpected,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CacheException value)? cache,
    TResult? Function(UnexpectedException value)? unexpected,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CacheException value)? cache,
    TResult Function(UnexpectedException value)? unexpected,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheException implements AppException {
  const factory CacheException() = _$CacheExceptionImpl;
}

/// @nodoc
abstract class _$$UnexpectedExceptionImplCopyWith<$Res> {
  factory _$$UnexpectedExceptionImplCopyWith(_$UnexpectedExceptionImpl value,
          $Res Function(_$UnexpectedExceptionImpl) then) =
      __$$UnexpectedExceptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnexpectedExceptionImpl>
    implements _$$UnexpectedExceptionImplCopyWith<$Res> {
  __$$UnexpectedExceptionImplCopyWithImpl(_$UnexpectedExceptionImpl _value,
      $Res Function(_$UnexpectedExceptionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnexpectedExceptionImpl implements UnexpectedException {
  const _$UnexpectedExceptionImpl();

  @override
  String toString() {
    return 'AppException.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedExceptionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cache,
    required TResult Function() unexpected,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cache,
    TResult? Function()? unexpected,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cache,
    TResult Function()? unexpected,
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
    required TResult Function(CacheException value) cache,
    required TResult Function(UnexpectedException value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CacheException value)? cache,
    TResult? Function(UnexpectedException value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CacheException value)? cache,
    TResult Function(UnexpectedException value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedException implements AppException {
  const factory UnexpectedException() = _$UnexpectedExceptionImpl;
}
