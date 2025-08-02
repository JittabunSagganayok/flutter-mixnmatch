// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uploader_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UploadState {
  int get id => throw _privateConstructorUsedError;
  File? get file => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, File file) processing,
    required TResult Function(int id, File? file, String? fileName, String url)
        completed,
    required TResult Function(
            int id, File file, Object? error, StackTrace? stackTrace)
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, File file)? processing,
    TResult? Function(int id, File? file, String? fileName, String url)?
        completed,
    TResult? Function(int id, File file, Object? error, StackTrace? stackTrace)?
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, File file)? processing,
    TResult Function(int id, File? file, String? fileName, String url)?
        completed,
    TResult Function(int id, File file, Object? error, StackTrace? stackTrace)?
        failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Processing value) processing,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Processing value)? processing,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadStateCopyWith<UploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadStateCopyWith<$Res> {
  factory $UploadStateCopyWith(
          UploadState value, $Res Function(UploadState) then) =
      _$UploadStateCopyWithImpl<$Res, UploadState>;
  @useResult
  $Res call({int id, File file});
}

/// @nodoc
class _$UploadStateCopyWithImpl<$Res, $Val extends UploadState>
    implements $UploadStateCopyWith<$Res> {
  _$UploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? file = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      file: null == file
          ? _value.file!
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProcessingCopyWith<$Res>
    implements $UploadStateCopyWith<$Res> {
  factory _$$_ProcessingCopyWith(
          _$_Processing value, $Res Function(_$_Processing) then) =
      __$$_ProcessingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, File file});
}

/// @nodoc
class __$$_ProcessingCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$_Processing>
    implements _$$_ProcessingCopyWith<$Res> {
  __$$_ProcessingCopyWithImpl(
      _$_Processing _value, $Res Function(_$_Processing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? file = null,
  }) {
    return _then(_$_Processing(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$_Processing implements _Processing {
  _$_Processing(this.id, this.file);

  @override
  final int id;
  @override
  final File file;

  @override
  String toString() {
    return 'UploadState.processing(id: $id, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Processing &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProcessingCopyWith<_$_Processing> get copyWith =>
      __$$_ProcessingCopyWithImpl<_$_Processing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, File file) processing,
    required TResult Function(int id, File? file, String? fileName, String url)
        completed,
    required TResult Function(
            int id, File file, Object? error, StackTrace? stackTrace)
        failed,
  }) {
    return processing(id, file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, File file)? processing,
    TResult? Function(int id, File? file, String? fileName, String url)?
        completed,
    TResult? Function(int id, File file, Object? error, StackTrace? stackTrace)?
        failed,
  }) {
    return processing?.call(id, file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, File file)? processing,
    TResult Function(int id, File? file, String? fileName, String url)?
        completed,
    TResult Function(int id, File file, Object? error, StackTrace? stackTrace)?
        failed,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(id, file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Processing value) processing,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Processing value)? processing,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements UploadState {
  factory _Processing(final int id, final File file) = _$_Processing;

  @override
  int get id;
  @override
  File get file;
  @override
  @JsonKey(ignore: true)
  _$$_ProcessingCopyWith<_$_Processing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CompletedCopyWith<$Res>
    implements $UploadStateCopyWith<$Res> {
  factory _$$_CompletedCopyWith(
          _$_Completed value, $Res Function(_$_Completed) then) =
      __$$_CompletedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, File? file, String? fileName, String url});
}

/// @nodoc
class __$$_CompletedCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$_Completed>
    implements _$$_CompletedCopyWith<$Res> {
  __$$_CompletedCopyWithImpl(
      _$_Completed _value, $Res Function(_$_Completed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? file = freezed,
    Object? fileName = freezed,
    Object? url = null,
  }) {
    return _then(_$_Completed(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Completed implements _Completed {
  _$_Completed(this.id, this.file, this.fileName, this.url);

  @override
  final int id;
  @override
  final File? file;
  @override
  final String? fileName;
  @override
  final String url;

  @override
  String toString() {
    return 'UploadState.completed(id: $id, file: $file, fileName: $fileName, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Completed &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, file, fileName, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompletedCopyWith<_$_Completed> get copyWith =>
      __$$_CompletedCopyWithImpl<_$_Completed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, File file) processing,
    required TResult Function(int id, File? file, String? fileName, String url)
        completed,
    required TResult Function(
            int id, File file, Object? error, StackTrace? stackTrace)
        failed,
  }) {
    return completed(id, file, fileName, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, File file)? processing,
    TResult? Function(int id, File? file, String? fileName, String url)?
        completed,
    TResult? Function(int id, File file, Object? error, StackTrace? stackTrace)?
        failed,
  }) {
    return completed?.call(id, file, fileName, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, File file)? processing,
    TResult Function(int id, File? file, String? fileName, String url)?
        completed,
    TResult Function(int id, File file, Object? error, StackTrace? stackTrace)?
        failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(id, file, fileName, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Processing value) processing,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Processing value)? processing,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed implements UploadState {
  factory _Completed(final int id, final File? file, final String? fileName,
      final String url) = _$_Completed;

  @override
  int get id;
  @override
  File? get file;
  String? get fileName;
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_CompletedCopyWith<_$_Completed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailedCopyWith<$Res> implements $UploadStateCopyWith<$Res> {
  factory _$$_FailedCopyWith(_$_Failed value, $Res Function(_$_Failed) then) =
      __$$_FailedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, File file, Object? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$_FailedCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$_Failed>
    implements _$$_FailedCopyWith<$Res> {
  __$$_FailedCopyWithImpl(_$_Failed _value, $Res Function(_$_Failed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? file = null,
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$_Failed(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      freezed == error ? _value.error : error,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$_Failed implements _Failed {
  _$_Failed(this.id, this.file, this.error, this.stackTrace);

  @override
  final int id;
  @override
  final File file;
  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'UploadState.failed(id: $id, file: $file, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failed &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.file, file) || other.file == file) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, file,
      const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailedCopyWith<_$_Failed> get copyWith =>
      __$$_FailedCopyWithImpl<_$_Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, File file) processing,
    required TResult Function(int id, File? file, String? fileName, String url)
        completed,
    required TResult Function(
            int id, File file, Object? error, StackTrace? stackTrace)
        failed,
  }) {
    return failed(id, file, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, File file)? processing,
    TResult? Function(int id, File? file, String? fileName, String url)?
        completed,
    TResult? Function(int id, File file, Object? error, StackTrace? stackTrace)?
        failed,
  }) {
    return failed?.call(id, file, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, File file)? processing,
    TResult Function(int id, File? file, String? fileName, String url)?
        completed,
    TResult Function(int id, File file, Object? error, StackTrace? stackTrace)?
        failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(id, file, error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Processing value) processing,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Processing value)? processing,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements UploadState {
  factory _Failed(final int id, final File file, final Object? error,
      final StackTrace? stackTrace) = _$_Failed;

  @override
  int get id;
  @override
  File get file;
  Object? get error;
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$_FailedCopyWith<_$_Failed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UploadResult {
  int? get id => throw _privateConstructorUsedError;
  File? get file => throw _privateConstructorUsedError;
  String? get fileName => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadResultCopyWith<UploadResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadResultCopyWith<$Res> {
  factory $UploadResultCopyWith(
          UploadResult value, $Res Function(UploadResult) then) =
      _$UploadResultCopyWithImpl<$Res, UploadResult>;
  @useResult
  $Res call({int? id, File? file, String? fileName, String url});
}

/// @nodoc
class _$UploadResultCopyWithImpl<$Res, $Val extends UploadResult>
    implements $UploadResultCopyWith<$Res> {
  _$UploadResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? file = freezed,
    Object? fileName = freezed,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UploadResultCopyWith<$Res>
    implements $UploadResultCopyWith<$Res> {
  factory _$$_UploadResultCopyWith(
          _$_UploadResult value, $Res Function(_$_UploadResult) then) =
      __$$_UploadResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, File? file, String? fileName, String url});
}

/// @nodoc
class __$$_UploadResultCopyWithImpl<$Res>
    extends _$UploadResultCopyWithImpl<$Res, _$_UploadResult>
    implements _$$_UploadResultCopyWith<$Res> {
  __$$_UploadResultCopyWithImpl(
      _$_UploadResult _value, $Res Function(_$_UploadResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? file = freezed,
    Object? fileName = freezed,
    Object? url = null,
  }) {
    return _then(_$_UploadResult(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UploadResult implements _UploadResult {
  const _$_UploadResult({this.id, this.file, this.fileName, required this.url});

  @override
  final int? id;
  @override
  final File? file;
  @override
  final String? fileName;
  @override
  final String url;

  @override
  String toString() {
    return 'UploadResult(id: $id, file: $file, fileName: $fileName, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, file, fileName, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadResultCopyWith<_$_UploadResult> get copyWith =>
      __$$_UploadResultCopyWithImpl<_$_UploadResult>(this, _$identity);
}

abstract class _UploadResult implements UploadResult {
  const factory _UploadResult(
      {final int? id,
      final File? file,
      final String? fileName,
      required final String url}) = _$_UploadResult;

  @override
  int? get id;
  @override
  File? get file;
  @override
  String? get fileName;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_UploadResultCopyWith<_$_UploadResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ImageUploadResult {
  File get file => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageUploadResultCopyWith<ImageUploadResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUploadResultCopyWith<$Res> {
  factory $ImageUploadResultCopyWith(
          ImageUploadResult value, $Res Function(ImageUploadResult) then) =
      _$ImageUploadResultCopyWithImpl<$Res, ImageUploadResult>;
  @useResult
  $Res call({File file, String url});
}

/// @nodoc
class _$ImageUploadResultCopyWithImpl<$Res, $Val extends ImageUploadResult>
    implements $ImageUploadResultCopyWith<$Res> {
  _$ImageUploadResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageUploadResultCopyWith<$Res>
    implements $ImageUploadResultCopyWith<$Res> {
  factory _$$_ImageUploadResultCopyWith(_$_ImageUploadResult value,
          $Res Function(_$_ImageUploadResult) then) =
      __$$_ImageUploadResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File file, String url});
}

/// @nodoc
class __$$_ImageUploadResultCopyWithImpl<$Res>
    extends _$ImageUploadResultCopyWithImpl<$Res, _$_ImageUploadResult>
    implements _$$_ImageUploadResultCopyWith<$Res> {
  __$$_ImageUploadResultCopyWithImpl(
      _$_ImageUploadResult _value, $Res Function(_$_ImageUploadResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? url = null,
  }) {
    return _then(_$_ImageUploadResult(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ImageUploadResult implements _ImageUploadResult {
  const _$_ImageUploadResult({required this.file, required this.url});

  @override
  final File file;
  @override
  final String url;

  @override
  String toString() {
    return 'ImageUploadResult(file: $file, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageUploadResult &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageUploadResultCopyWith<_$_ImageUploadResult> get copyWith =>
      __$$_ImageUploadResultCopyWithImpl<_$_ImageUploadResult>(
          this, _$identity);
}

abstract class _ImageUploadResult implements ImageUploadResult {
  const factory _ImageUploadResult(
      {required final File file,
      required final String url}) = _$_ImageUploadResult;

  @override
  File get file;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_ImageUploadResultCopyWith<_$_ImageUploadResult> get copyWith =>
      throw _privateConstructorUsedError;
}
