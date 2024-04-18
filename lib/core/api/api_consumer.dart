abstract class ApiConsumer {
  Future<dynamic> get(
    path, {
    Object? data,
    Map<String, dynamic>? queryParameters,

  });

  Future<dynamic> post(
    path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> patch(
    path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> delete(
    path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
