part of '../sources/dio/dio_source.dart';

extension JsonResultDecoderExt<T> on JsonResultDecoder {
  static object<T>(JsonObjectDecoder<T> object) {
    return (object, null);
  }

  static array<T>(JsonArrayDecoder<T> array) {
    return (null, array);
  }

  T when({
    required Map<String, dynamic> Function() onObject,
    required List Function() onArray,
  }) {
    if (this.$1 != null) return this.$1!(onObject());
    return this.$2!(onArray());
  }

  T maybeWhen({
    required T Function() orElse,
    Map<String, dynamic>? onObject,
    List? onArray,
  }) {
    if (this.$2 != null && onArray != null) return this.$2!(onArray);
    if (this.$1 != null && onObject != null) return this.$1!(onObject);
    return orElse();
  }
}