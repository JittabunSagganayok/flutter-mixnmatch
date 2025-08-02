import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploader_state.freezed.dart';

@freezed
class UploadState with _$UploadState {
  factory UploadState.processing(int id, File file) = _Processing;
  factory UploadState.completed(
      int id, File? file, String? fileName, String url) = _Completed;
  factory UploadState.failed(
      int id, File file, Object? error, StackTrace? stackTrace) = _Failed;
}

@freezed
class UploadResult with _$UploadResult {
  const factory UploadResult({
    int? id,
    File? file,
    String? fileName,
    required String url,
  }) = _UploadResult;
}

@freezed
class ImageUploadResult with _$ImageUploadResult {
  const factory ImageUploadResult({
    required File file,
    required String url,
  }) = _ImageUploadResult;
}
