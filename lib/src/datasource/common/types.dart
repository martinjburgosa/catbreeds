// ignore_for_file: avoid_classes_with_only_static_members

part of 'sources/dio/dio_source.dart';

/// Represents a logic to turn the given [T] to JSON.
typedef RequestEncoder<T> = Map<String, dynamic>? Function(T?);

/// Represents an object decoder value for the [JsonResultDecoder].
typedef JsonObjectDecoder<T> = T Function(Map<String, dynamic>);

/// Represents a list decoder value for the [JsonResultDecoder].
typedef JsonArrayDecoder<T> = T Function(List);

/// Represents the way of casting the given [T] data from a JSON value.
typedef JsonResultDecoder<T> = (JsonObjectDecoder<T>?, JsonArrayDecoder<T>?);

/// Represents the method which is called with the internal [Dio] API.
typedef DioCall = Future<Response> Function([Map<String, dynamic>?, Options?]);

/// No operation (NoOp) request encoder
Map<String, dynamic>? noOpRequestEncoder<T>(T? data) {
  Map<String, dynamic>? result;
  if (data != null) {
    throw ArgumentError('Missing RequestEncoder for input $data');
  }
  return result;
}

/// A class to describe the logic to manage an [ID] through the url of request.
@immutable
class PathEncoderDecoder {
  static const _idKey = '@';

  /// Returns a JSON with the provided [id].
  static Map<String, dynamic> encode<T>(T? id) {
    if (id != null) {
      return {_idKey: id};
    }
    throw ArgumentError(
      '''
        You must supply an id of type <IN> when using a PathEncoderDecoder.
        Make sure you are using the correct RequestEncoder for your datasource.
        ''',
    );
  }

  /// Returns a string that represents the full path within registered [id].
  static String decode(DioPath path, Map<String, dynamic>? parameters) {
    if (parameters != null && parameters.containsKey(_idKey)) {
      return path + (parameters[_idKey].toString());
    }
    throw ArgumentError(
      '''
      	The path parameters should contain an id of type <IN>.
        Make sure you are using the correct RequestEncoder for your datasource.
        ''',
    );
  }

  /// Returns a bool with [True] if the [decode] has been used or [False] if hasn't been.
  static bool createdWithThisEncoder(Map<String, dynamic>? parameters) {
    return parameters?.keys.any((k) => k == _idKey) ?? false;
  }
}

/// An storage for the path of source's request.
class DioPath extends Equatable {
  DioPath(String value) : _path = value {
    if (!value.startsWith('/')) {
      throw ArgumentError.value(value, 'value', 'should start with /');
    }
    if (value.endsWith('/')) {
      throw ArgumentError.value(value, 'value', 'cannot end with /');
    }
  }

  final String _path;

  /// Returns the current value for the path.
  String get value => _path;

  /// Returns the sumatory of current path with a new segment.
  String operator +(String segment) {
    if (segment.startsWith('/')) {
      throw ArgumentError.value(segment, 'segment', 'cannot start with /');
    }
    return '$_path/$segment';
  }

  @override
  List<Object?> get props => [value];
}
