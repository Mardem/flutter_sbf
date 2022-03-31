class HttpStatus {
  static const int success = 200;
  static const int created = 201;
  static const int serverError = 500;
  static const int notFound = 404;
  static const int accessDenied = 401;
  static const int found = 302;
}

class HttpResponse<T> {
  HttpResponse({
    this.statusCode = HttpStatus.serverError,
    this.isSuccess = false,
    this.message = '',
    this.data,
  });

  int statusCode;
  bool isSuccess;
  String? message;
  T? data;
}
