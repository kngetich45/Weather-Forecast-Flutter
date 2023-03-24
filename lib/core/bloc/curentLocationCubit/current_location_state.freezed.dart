// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrentLocationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(Position currentLocation) success,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String message)? error,
    TResult? Function(Position currentLocation)? success,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position currentLocation)? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentLocationInitState value) init,
    required TResult Function(CurrentLocationErrorState value) error,
    required TResult Function(CurrentLocationSuccessState value) success,
    required TResult Function(CurrentLocationLoadingState value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentLocationInitState value)? init,
    TResult? Function(CurrentLocationErrorState value)? error,
    TResult? Function(CurrentLocationSuccessState value)? success,
    TResult? Function(CurrentLocationLoadingState value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentLocationInitState value)? init,
    TResult Function(CurrentLocationErrorState value)? error,
    TResult Function(CurrentLocationSuccessState value)? success,
    TResult Function(CurrentLocationLoadingState value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentLocationStateCopyWith<$Res> {
  factory $CurrentLocationStateCopyWith(CurrentLocationState value,
          $Res Function(CurrentLocationState) then) =
      _$CurrentLocationStateCopyWithImpl<$Res, CurrentLocationState>;
}

/// @nodoc
class _$CurrentLocationStateCopyWithImpl<$Res,
        $Val extends CurrentLocationState>
    implements $CurrentLocationStateCopyWith<$Res> {
  _$CurrentLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CurrentLocationInitStateCopyWith<$Res> {
  factory _$$CurrentLocationInitStateCopyWith(_$CurrentLocationInitState value,
          $Res Function(_$CurrentLocationInitState) then) =
      __$$CurrentLocationInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrentLocationInitStateCopyWithImpl<$Res>
    extends _$CurrentLocationStateCopyWithImpl<$Res, _$CurrentLocationInitState>
    implements _$$CurrentLocationInitStateCopyWith<$Res> {
  __$$CurrentLocationInitStateCopyWithImpl(_$CurrentLocationInitState _value,
      $Res Function(_$CurrentLocationInitState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CurrentLocationInitState implements CurrentLocationInitState {
  const _$CurrentLocationInitState();

  @override
  String toString() {
    return 'CurrentLocationState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentLocationInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(Position currentLocation) success,
    required TResult Function() loading,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String message)? error,
    TResult? Function(Position currentLocation)? success,
    TResult? Function()? loading,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position currentLocation)? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentLocationInitState value) init,
    required TResult Function(CurrentLocationErrorState value) error,
    required TResult Function(CurrentLocationSuccessState value) success,
    required TResult Function(CurrentLocationLoadingState value) loading,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentLocationInitState value)? init,
    TResult? Function(CurrentLocationErrorState value)? error,
    TResult? Function(CurrentLocationSuccessState value)? success,
    TResult? Function(CurrentLocationLoadingState value)? loading,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentLocationInitState value)? init,
    TResult Function(CurrentLocationErrorState value)? error,
    TResult Function(CurrentLocationSuccessState value)? success,
    TResult Function(CurrentLocationLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class CurrentLocationInitState implements CurrentLocationState {
  const factory CurrentLocationInitState() = _$CurrentLocationInitState;
}

/// @nodoc
abstract class _$$CurrentLocationErrorStateCopyWith<$Res> {
  factory _$$CurrentLocationErrorStateCopyWith(
          _$CurrentLocationErrorState value,
          $Res Function(_$CurrentLocationErrorState) then) =
      __$$CurrentLocationErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CurrentLocationErrorStateCopyWithImpl<$Res>
    extends _$CurrentLocationStateCopyWithImpl<$Res,
        _$CurrentLocationErrorState>
    implements _$$CurrentLocationErrorStateCopyWith<$Res> {
  __$$CurrentLocationErrorStateCopyWithImpl(_$CurrentLocationErrorState _value,
      $Res Function(_$CurrentLocationErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CurrentLocationErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CurrentLocationErrorState implements CurrentLocationErrorState {
  const _$CurrentLocationErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CurrentLocationState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentLocationErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentLocationErrorStateCopyWith<_$CurrentLocationErrorState>
      get copyWith => __$$CurrentLocationErrorStateCopyWithImpl<
          _$CurrentLocationErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(Position currentLocation) success,
    required TResult Function() loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String message)? error,
    TResult? Function(Position currentLocation)? success,
    TResult? Function()? loading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position currentLocation)? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentLocationInitState value) init,
    required TResult Function(CurrentLocationErrorState value) error,
    required TResult Function(CurrentLocationSuccessState value) success,
    required TResult Function(CurrentLocationLoadingState value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentLocationInitState value)? init,
    TResult? Function(CurrentLocationErrorState value)? error,
    TResult? Function(CurrentLocationSuccessState value)? success,
    TResult? Function(CurrentLocationLoadingState value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentLocationInitState value)? init,
    TResult Function(CurrentLocationErrorState value)? error,
    TResult Function(CurrentLocationSuccessState value)? success,
    TResult Function(CurrentLocationLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CurrentLocationErrorState implements CurrentLocationState {
  const factory CurrentLocationErrorState(final String message) =
      _$CurrentLocationErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$CurrentLocationErrorStateCopyWith<_$CurrentLocationErrorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CurrentLocationSuccessStateCopyWith<$Res> {
  factory _$$CurrentLocationSuccessStateCopyWith(
          _$CurrentLocationSuccessState value,
          $Res Function(_$CurrentLocationSuccessState) then) =
      __$$CurrentLocationSuccessStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Position currentLocation});
}

/// @nodoc
class __$$CurrentLocationSuccessStateCopyWithImpl<$Res>
    extends _$CurrentLocationStateCopyWithImpl<$Res,
        _$CurrentLocationSuccessState>
    implements _$$CurrentLocationSuccessStateCopyWith<$Res> {
  __$$CurrentLocationSuccessStateCopyWithImpl(
      _$CurrentLocationSuccessState _value,
      $Res Function(_$CurrentLocationSuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentLocation = null,
  }) {
    return _then(_$CurrentLocationSuccessState(
      null == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }
}

/// @nodoc

class _$CurrentLocationSuccessState implements CurrentLocationSuccessState {
  const _$CurrentLocationSuccessState(this.currentLocation);

  @override
  final Position currentLocation;

  @override
  String toString() {
    return 'CurrentLocationState.success(currentLocation: $currentLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentLocationSuccessState &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentLocationSuccessStateCopyWith<_$CurrentLocationSuccessState>
      get copyWith => __$$CurrentLocationSuccessStateCopyWithImpl<
          _$CurrentLocationSuccessState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(Position currentLocation) success,
    required TResult Function() loading,
  }) {
    return success(currentLocation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String message)? error,
    TResult? Function(Position currentLocation)? success,
    TResult? Function()? loading,
  }) {
    return success?.call(currentLocation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position currentLocation)? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(currentLocation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentLocationInitState value) init,
    required TResult Function(CurrentLocationErrorState value) error,
    required TResult Function(CurrentLocationSuccessState value) success,
    required TResult Function(CurrentLocationLoadingState value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentLocationInitState value)? init,
    TResult? Function(CurrentLocationErrorState value)? error,
    TResult? Function(CurrentLocationSuccessState value)? success,
    TResult? Function(CurrentLocationLoadingState value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentLocationInitState value)? init,
    TResult Function(CurrentLocationErrorState value)? error,
    TResult Function(CurrentLocationSuccessState value)? success,
    TResult Function(CurrentLocationLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CurrentLocationSuccessState implements CurrentLocationState {
  const factory CurrentLocationSuccessState(final Position currentLocation) =
      _$CurrentLocationSuccessState;

  Position get currentLocation;
  @JsonKey(ignore: true)
  _$$CurrentLocationSuccessStateCopyWith<_$CurrentLocationSuccessState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CurrentLocationLoadingStateCopyWith<$Res> {
  factory _$$CurrentLocationLoadingStateCopyWith(
          _$CurrentLocationLoadingState value,
          $Res Function(_$CurrentLocationLoadingState) then) =
      __$$CurrentLocationLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrentLocationLoadingStateCopyWithImpl<$Res>
    extends _$CurrentLocationStateCopyWithImpl<$Res,
        _$CurrentLocationLoadingState>
    implements _$$CurrentLocationLoadingStateCopyWith<$Res> {
  __$$CurrentLocationLoadingStateCopyWithImpl(
      _$CurrentLocationLoadingState _value,
      $Res Function(_$CurrentLocationLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CurrentLocationLoadingState implements CurrentLocationLoadingState {
  const _$CurrentLocationLoadingState();

  @override
  String toString() {
    return 'CurrentLocationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentLocationLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(Position currentLocation) success,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String message)? error,
    TResult? Function(Position currentLocation)? success,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position currentLocation)? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentLocationInitState value) init,
    required TResult Function(CurrentLocationErrorState value) error,
    required TResult Function(CurrentLocationSuccessState value) success,
    required TResult Function(CurrentLocationLoadingState value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentLocationInitState value)? init,
    TResult? Function(CurrentLocationErrorState value)? error,
    TResult? Function(CurrentLocationSuccessState value)? success,
    TResult? Function(CurrentLocationLoadingState value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentLocationInitState value)? init,
    TResult Function(CurrentLocationErrorState value)? error,
    TResult Function(CurrentLocationSuccessState value)? success,
    TResult Function(CurrentLocationLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CurrentLocationLoadingState implements CurrentLocationState {
  const factory CurrentLocationLoadingState() = _$CurrentLocationLoadingState;
}
