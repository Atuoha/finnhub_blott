// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_impl_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsImplEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() retrieveNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? retrieveNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? retrieveNews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RetrieveNews value) retrieveNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RetrieveNews value)? retrieveNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RetrieveNews value)? retrieveNews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsImplEventCopyWith<$Res> {
  factory $NewsImplEventCopyWith(
          NewsImplEvent value, $Res Function(NewsImplEvent) then) =
      _$NewsImplEventCopyWithImpl<$Res, NewsImplEvent>;
}

/// @nodoc
class _$NewsImplEventCopyWithImpl<$Res, $Val extends NewsImplEvent>
    implements $NewsImplEventCopyWith<$Res> {
  _$NewsImplEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsImplEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RetrieveNewsImplCopyWith<$Res> {
  factory _$$RetrieveNewsImplCopyWith(
          _$RetrieveNewsImpl value, $Res Function(_$RetrieveNewsImpl) then) =
      __$$RetrieveNewsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RetrieveNewsImplCopyWithImpl<$Res>
    extends _$NewsImplEventCopyWithImpl<$Res, _$RetrieveNewsImpl>
    implements _$$RetrieveNewsImplCopyWith<$Res> {
  __$$RetrieveNewsImplCopyWithImpl(
      _$RetrieveNewsImpl _value, $Res Function(_$RetrieveNewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsImplEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RetrieveNewsImpl implements RetrieveNews {
  const _$RetrieveNewsImpl();

  @override
  String toString() {
    return 'NewsImplEvent.retrieveNews()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RetrieveNewsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() retrieveNews,
  }) {
    return retrieveNews();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? retrieveNews,
  }) {
    return retrieveNews?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? retrieveNews,
    required TResult orElse(),
  }) {
    if (retrieveNews != null) {
      return retrieveNews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RetrieveNews value) retrieveNews,
  }) {
    return retrieveNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RetrieveNews value)? retrieveNews,
  }) {
    return retrieveNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RetrieveNews value)? retrieveNews,
    required TResult orElse(),
  }) {
    if (retrieveNews != null) {
      return retrieveNews(this);
    }
    return orElse();
  }
}

abstract class RetrieveNews implements NewsImplEvent {
  const factory RetrieveNews() = _$RetrieveNewsImpl;
}

/// @nodoc
mixin _$NewsImplState {
  ProcessingStatus get processingStatus => throw _privateConstructorUsedError;
  CustomError get error => throw _privateConstructorUsedError;
  List<News> get news => throw _privateConstructorUsedError;

  /// Create a copy of NewsImplState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsImplStateCopyWith<NewsImplState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsImplStateCopyWith<$Res> {
  factory $NewsImplStateCopyWith(
          NewsImplState value, $Res Function(NewsImplState) then) =
      _$NewsImplStateCopyWithImpl<$Res, NewsImplState>;
  @useResult
  $Res call(
      {ProcessingStatus processingStatus, CustomError error, List<News> news});
}

/// @nodoc
class _$NewsImplStateCopyWithImpl<$Res, $Val extends NewsImplState>
    implements $NewsImplStateCopyWith<$Res> {
  _$NewsImplStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsImplState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processingStatus = null,
    Object? error = null,
    Object? news = null,
  }) {
    return _then(_value.copyWith(
      processingStatus: null == processingStatus
          ? _value.processingStatus
          : processingStatus // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CustomError,
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsImplStateImplCopyWith<$Res>
    implements $NewsImplStateCopyWith<$Res> {
  factory _$$NewsImplStateImplCopyWith(
          _$NewsImplStateImpl value, $Res Function(_$NewsImplStateImpl) then) =
      __$$NewsImplStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProcessingStatus processingStatus, CustomError error, List<News> news});
}

/// @nodoc
class __$$NewsImplStateImplCopyWithImpl<$Res>
    extends _$NewsImplStateCopyWithImpl<$Res, _$NewsImplStateImpl>
    implements _$$NewsImplStateImplCopyWith<$Res> {
  __$$NewsImplStateImplCopyWithImpl(
      _$NewsImplStateImpl _value, $Res Function(_$NewsImplStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsImplState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processingStatus = null,
    Object? error = null,
    Object? news = null,
  }) {
    return _then(_$NewsImplStateImpl(
      processingStatus: null == processingStatus
          ? _value.processingStatus
          : processingStatus // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CustomError,
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ));
  }
}

/// @nodoc

class _$NewsImplStateImpl implements _NewsImplState {
  const _$NewsImplStateImpl(
      {required this.processingStatus,
      required this.error,
      required final List<News> news})
      : _news = news;

  @override
  final ProcessingStatus processingStatus;
  @override
  final CustomError error;
  final List<News> _news;
  @override
  List<News> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  String toString() {
    return 'NewsImplState(processingStatus: $processingStatus, error: $error, news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImplStateImpl &&
            (identical(other.processingStatus, processingStatus) ||
                other.processingStatus == processingStatus) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @override
  int get hashCode => Object.hash(runtimeType, processingStatus, error,
      const DeepCollectionEquality().hash(_news));

  /// Create a copy of NewsImplState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplStateImplCopyWith<_$NewsImplStateImpl> get copyWith =>
      __$$NewsImplStateImplCopyWithImpl<_$NewsImplStateImpl>(this, _$identity);
}

abstract class _NewsImplState implements NewsImplState {
  const factory _NewsImplState(
      {required final ProcessingStatus processingStatus,
      required final CustomError error,
      required final List<News> news}) = _$NewsImplStateImpl;

  @override
  ProcessingStatus get processingStatus;
  @override
  CustomError get error;
  @override
  List<News> get news;

  /// Create a copy of NewsImplState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsImplStateImplCopyWith<_$NewsImplStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
