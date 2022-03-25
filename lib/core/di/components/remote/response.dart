class HttpStatus {
  static const success = 200;
  static const created = 201;
  static const serverError = 500;
  static const notFound = 404;
  static const accessDenied = 401;
  static const found = 302;
}

class HttpResponse<T> {
  int statusCode;
  bool isSuccess;
  String? message;
  T? data;

  HttpResponse({
    this.statusCode = HttpStatus.serverError,
    this.isSuccess = false,
    this.message = "",
    this.data,
  });
}
