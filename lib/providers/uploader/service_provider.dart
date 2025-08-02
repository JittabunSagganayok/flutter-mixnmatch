import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mixnmatch/constant/configs.dart';
import 'package:mixnmatch/utils/prefs.dart';

final apiEndpointProvider = Provider.autoDispose<String>((ref) {
  return "$baseApi/api/";
});

final preferencesProvider = Provider.autoDispose<Prefs>((ref) {
  return Prefs();
});

final dioProvider = Provider.autoDispose<Dio>((ref) {
  return _providerDioClient(
    endpoint: ref.read(apiEndpointProvider),
  );
});

Dio provideDioClient({
  String endpoint = "$baseApi/api/",
}) {
  return _providerDioClient(endpoint: endpoint);
}

Interceptor _getSessionInterceptor() {
  return InterceptorsWrapper(
    onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      final token = prefs.accessToken;
      if (token.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $token";
      }
      options.headers["lang-id"] = prefs.accessLangId;
      return handler.next(options);
    },
  );
}

Interceptor _getCacheInterceptor() {
  final cacheOptions = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.request,
    hitCacheOnErrorExcept: [401, 403],
    maxStale: const Duration(days: 1),
    priority: CachePriority.normal,
    cipher: null,
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: false,
  );
  return DioCacheInterceptor(options: cacheOptions);
}

Dio _providerDioClient({required String endpoint}) {
  final options = BaseOptions(
      baseUrl: endpoint,
      // connectTimeout: const Duration(seconds: 30),
      // receiveTimeout: const Duration(seconds: 30),
      // sendTimeout: const Duration(minutes: 1),
      contentType: ContentType.json.value);

  final dio = Dio(options);
  dio.interceptors.addAll([
    _getSessionInterceptor(),
    _getCacheInterceptor(),
    LogInterceptor(
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseBody: kDebugMode,
        responseHeader: kDebugMode,
        logPrint: (object) => log(object.toString(), name: "DIO")),
  ]);
  return dio;
}
