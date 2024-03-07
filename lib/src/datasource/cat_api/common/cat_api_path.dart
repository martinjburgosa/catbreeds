// ignore_for_file: avoid_classes_with_only_static_members, dangling_library_doc_comments

class CatApiPath {
  /// The path to manage breed data.
  static const String breeds = '/breeds';
  static String breedsName() => breeds.substring(1, breeds.length);

  static const String search = '/search';
  static String searchName() => search.substring(1, search.length);
}
