// ignore_for_file: avoid_classes_with_only_static_members, dangling_library_doc_comments

class CatApiPath {
  /// The path to manage place's data.
  static const String breeds = '/breeds';
  static String breedsName() => breeds.substring(1, breeds.length);
}
