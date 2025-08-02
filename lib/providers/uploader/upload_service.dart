import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mixnmatch/ext/file_ext.dart';
import 'package:mixnmatch/providers/uploader/service_provider.dart';
import 'package:rxdart_ext/rxdart_ext.dart';

final uploadServiceProvider = Provider<UploadService>((ref) {
  return UploadService(ref.read(dioProvider));
});

class UploadService {
  final Dio dio;

  UploadService(this.dio);

  Single<String> uploadFile(
    File file, {
    String module = 'customer/file',
  }) {
    return Single.value(file)
        .flatMapSingle(
          (value) => Single.fromFuture(
            dio.post(
              'systems/upload',
              data: FormData.fromMap(
                {
                  'module': module,
                  'file': MultipartFile.fromFileSync(
                    value.path,
                    filename: file.fileName,
                  )
                },
              ),
            ),
          ),
        )
        .map((event) => event.data["result"]["url"]);
  }
}
