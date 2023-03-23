// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'current_weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrentWeatherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(WeatherInfoModel currentWeather) success,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(WeatherInfoModel currentWeather)? success,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(WeatherInfoModel currentWeather)? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentWeatherInitState value) init,
    required TResult Function(CurrentWeatherErrorState value) error,
    required TResult Function(CurrentWeatherSuccessState value) success,
    required TResult Function(CurrentWeatherLoadingState value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentWeatherInitState value)? init,
    TResult Function(CurrentWeatherErrorState value)? error,
    TResult Function(CurrentWeatherSuccessState value)? success,
    TResult Function(CurrentWeatherLoadingState value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentWeatherInitState value)? init,
    TResult Function(CurrentWeatherErrorState value)? error,
    TResult Function(CurrentWeatherSuccessState value)? success,
    TResult Function(CurrentWeatherLoadingState value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWeatherStateCopyWith<$Res> {
  factory $CurrentWeatherStateCopyWith(
          CurrentWeatherState value, $Res Function(CurrentWeatherState) then) =
      _$CurrentWeatherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CurrentWeatherStateCopyWithImpl<$Res>
    implements $CurrentWeatherStateCopyWith<$Res> {
  _$CurrentWeatherStateCopyWithImpl(this._value, this._then);

  final CurrentWeatherState _value;
  // ignore: unused_field
  final $Res Function(CurrentWeatherState) _then;
}

/// @nodoc
abstract class _$$CurrentWeatherInitStateCopyWith<$Res> {
  factory _$$CurrentWeatherInitStateCopyWith(_$CurrentWeatherInitState value,
          $Res Function(_$CurrentWeatherInitState) then) =
      __$$CurrentWeatherInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrentWeatherInitStateCopyWithImpl<$Res>
    extends _$CurrentWeatherStateCopyWithImpl<$Res>
    implements _$$CurrentWeatherInitStateCopyWith<$Res> {
  __$$CurrentWeatherInitStateCopyWithImpl(_$CurrentWeatherInitState _value,
      $Res Function(_$CurrentWeatherInitState) _then)
      : super(_value, (v) => _then(v as _$CurrentWeatherInitState));

  @override
  _$CurrentWeatherInitState get _value =>
      super._value as _$CurrentWeatherInitState;
}

/// @nodoc

class _$CurrentWeatherInitState implements CurrentWeatherInitState {
  const _$CurrentWeatherInitState();

  @override
  String toString() {
    return 'CurrentWeatherState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(WeatherInfoModel currentWeather) success,
    required TResult Function() loading,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(WeatherInfoModel currentWeather)? success,
    TResult Function()? loading,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(WeatherInfoModel currentWeather)? success,
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
    required TResult Function(CurrentWeatherInitState value) init,
    required TResult Function(CurrentWeatherErrorState value) error,
    required TResult Function(CurrentWeatherSuccessState value) success,
    required TResult Function(CurrentWeatherLoadingState value) loading,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentWeatherInitState value)? init,
    TResult Function(CurrentWeatherErrorState value)? error,
    TResult Function(CurrentWeatherSuccessState value)? success,
    TResult Function(CurrentWeatherLoadingState value)? loading,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentWeatherInitState value)? init,
    TResult Function(CurrentWeatherErrorState value)? error,
    TResult Function(CurrentWeatherSuccessState value)? success,
    TResult Function(CurrentWeatherLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class CurrentWeatherInitState implements CurrentWeatherState {
  const factory CurrentWeatherInitState() = _$CurrentWeatherInitState;
}

/// @nodoc
abstract class _$$CurrentWeatherErrorStateCopyWith<$Res> {
  factory _$$CurrentWeatherErrorStateCopyWith(_$CurrentWeatherErrorState value,
          $Res Function(_$CurrentWeatherErrorState) then) =
      __$$CurrentWeatherErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$CurrentWeatherErrorStateCopyWithImpl<$Res>
    extends _$CurrentWeatherStateCopyWithImpl<$Res>
    implements _$$CurrentWeatherErrorStateCopyWith<$Res> {
  __$$CurrentWeatherErrorStateCopyWithImpl(_$CurrentWeatherErrorState _value,
      $Res Function(_$CurrentWeatherErrorState) _then)
      : super(_value, (v) => _then(v as _$CurrentWeatherErrorState));

  @override
  _$CurrentWeatherErrorState get _value =>
      super._value as _$CurrentWeatherErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CurrentWeatherErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CurrentWeatherErrorState implements CurrentWeatherErrorState {
  const _$CurrentWeatherErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CurrentWeatherState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherErrorState &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$CurrentWeatherErrorStateCopyWith<_$CurrentWeatherErrorState>
      get copyWith =>
          __$$CurrentWeatherErrorStateCopyWithImpl<_$CurrentWeatherErrorState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(WeatherInfoModel currentWeather) success,
    required TResult Function() loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(WeatherInfoModel currentWeather)? success,
    TResult Function()? loading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(WeatherInfoModel currentWeather)? success,
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
    required TResult Function(CurrentWeatherInitState value) init,
    required TResult Function(CurrentWeatherErrorState value) error,
    required TResult Function(CurrentWeatherSuccessState value) success,
    required TResult Function(CurrentWeatherLoadingState value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentWeatherInitState value)? init,
    TResult Function(CurrentWeatherErrorState value)? error,
    TResult Function(CurrentWeatherSuccessState value)? success,
    TResult Function(CurrentWeatherLoadingState value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentWeatherInitState value)? init,
    TResult Function(CurrentWeatherErrorState value)? error,
    TResult Function(CurrentWeatherSuccessState value)? success,
    TResult Function(CurrentWeatherLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CurrentWeatherErrorState implements CurrentWeatherState {
  const factory CurrentWeatherErrorState(final String message) =
      _$CurrentWeatherErrorState;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$CurrentWeatherErrorStateCopyWith<_$CurrentWeatherErrorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CurrentWeatherSuccessStateCopyWith<$Res> {
  factory _$$CurrentWeatherSuccessStateCopyWith(
          _$CurrentWeatherSuccessState value,
          $Res Function(_$CurrentWeatherSuccessState) then) =
      __$$CurrentWeatherSuccessStateCopyWithImpl<$Res>;
  $Res call({WeatherInfoModel currentWeather});
}

/// @nodoc
class __$$CurrentWeatherSuccessStateCopyWithImpl<$Res>
    extends _$CurrentWeatherStateCopyWithImpl<$Res>
    implements _$$CurrentWeatherSuccessStateCopyWith<$Res> {
  __$$CurrentWeatherSuccessStateCopyWithImpl(
      _$CurrentWeatherSuccessState _value,
      $Res Function(_$CurrentWeatherSuccessState) _then)
      : super(_value, (v) => _then(v as _$CurrentWeatherSuccessState));

  @override
  _$CurrentWeatherSuccessState get _value =>
      super._value as _$CurrentWeatherSuccessState;

  @override
  $Res call({
    Object? currentWeather = freezed,
  }) {
    return _then(_$CurrentWeatherSuccessState(
      currentWeather == freezed
          ? _value.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as WeatherInfoModel,
    ));
  }
}

/// @nodoc

class _$CurrentWeatherSuccessState implements CurrentWeatherSuccessState {
  const _$CurrentWeatherSuccessState(this.currentWeather);

  @override
  final WeatherInfoModel currentWeather;

  @override
  String toString() {
    return 'CurrentWeatherState.success(currentWeather: $currentWeather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherSuccessState &&
            const DeepCollectionEquality()
                .equals(other.currentWeather, currentWeather));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentWeather));

  @JsonKey(ignore: true)
  @override
  _$$CurrentWeatherSuccessStateCopyWith<_$CurrentWeatherSuccessState>
      get copyWith => __$$CurrentWeatherSuccessStateCopyWithImpl<
          _$CurrentWeatherSuccessState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(WeatherInfoModel currentWeather) success,
    required TResult Function() loading,
  }) {
    return success(currentWeather);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(WeatherInfoModel currentWeather)? success,
    TResult Function()? loading,
  }) {
    return success?.call(currentWeather);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(WeatherInfoModel currentWeather)? success,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(currentWeather);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentWeatherInitState value) init,
    required TResult Function(CurrentWeatherErrorState value) error,
    required TResult Function(CurrentWeatherSuccessState value) success,
    required TResult Function(CurrentWeatherLoadingState value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentWeatherInitState value)? init,
    TResult Function(CurrentWeatherErrorState value)? error,
    TResult Function(CurrentWeatherSuccessState value)? success,
    TResult Function(CurrentWeatherLoadingState value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentWeatherInitState value)? init,
    TResult Function(CurrentWeatherErrorState value)? error,
    TResult Function(CurrentWeatherSuccessState value)? success,
    TResult Function(CurrentWeatherLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CurrentWeatherSuccessState implements CurrentWeatherState {
  const factory CurrentWeatherSuccessState(
      final WeatherInfoModel currentWeather) = _$CurrentWeatherSuccessState;

  WeatherInfoModel get currentWeather => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$CurrentWeatherSuccessStateCopyWith<_$CurrentWeatherSuccessState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CurrentWeatherLoadingStateCopyWith<$Res> {
  factory _$$CurrentWeatherLoadingStateCopyWith(
          _$CurrentWeatherLoadingState value,
          $Res Function(_$CurrentWeatherLoadingState) then) =
      __$$CurrentWeatherLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrentWeatherLoadingStateCopyWithImpl<$Res>
    extends _$CurrentWeatherStateCopyWithImpl<$Res>
    implements _$$CurrentWeatherLoadingStateCopyWith<$Res> {
  __$$CurrentWeatherLoadingStateCopyWithImpl(
      _$CurrentWeatherLoadingState _value,
      $Res Function(_$CurrentWeatherLoadingState) _then)
      : super(_value, (v) => _then(v as _$CurrentWeatherLoadingState));

  @override
  _$CurrentWeatherLoadingState get _value =>
      super._value as _$CurrentWeatherLoadingState;
}

/// @nodoc

class _$CurrentWeatherLoadingState implements CurrentWeatherLoadingState {
  const _$CurrentWeatherLoadingState();

  @override
  String toString() {
    return 'CurrentWeatherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(WeatherInfoModel currentWeather) success,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(WeatherInfoModel currentWeather)? success,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(WeatherInfoModel currentWeather)? success,
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
    required TResult Function(CurrentWeatherInitState value) init,
    required TResult Function(CurrentWeatherErrorState value) error,
    required TResult Function(CurrentWeatherSuccessState value) success,
    required TResult Function(CurrentWeatherLoadingState value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentWeatherInitState value)? init,
    TResult Function(CurrentWeatherErrorState value)? error,
    TResult Function(CurrentWeatherSuccessState value)? success,
    TResult Function(CurrentWeatherLoadingState value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentWeatherInitState value)? init,
    TResult Function(CurrentWeatherErrorState value)? error,
    TResult Function(CurrentWeatherSuccessState value)? success,
    TResult Function(CurrentWeatherLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CurrentWeatherLoadingState implements CurrentWeatherState {
  const factory CurrentWeatherLoadingState() = _$CurrentWeatherLoadingState;
}
