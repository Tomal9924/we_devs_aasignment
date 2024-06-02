class NetworkResponse<T> {
  final T? result;
  final bool success;
  final String? error;
  final bool? unAuthorized;

  NetworkResponse({this.result, required this.success, this.error, this.unAuthorized});
}
