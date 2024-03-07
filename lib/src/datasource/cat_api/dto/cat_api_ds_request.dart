class CatApiRequest {
  const CatApiRequest({
    this.q,
    this.limit,
    this.page,
  });

  final String? q;
  final int? limit;
  final int? page;

  static Map<String, dynamic>? toJson(CatApiRequest? request) {
    if (request != null) {
      return <String, String>{
        'q': request.q ?? '',
        'limit': request.limit?.toString() ?? '10',
        'page': request.page?.toString() ?? '',
      };
    }
    return {};
  }
}
