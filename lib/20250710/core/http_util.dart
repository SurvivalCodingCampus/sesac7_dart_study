
import 'network_error.dart';

bool isSuccess(int statusCode) => statusCode >= 200 && statusCode < 300;

NetworkError mapStatusCodeToError(int code) {
  switch (code) {
    case 401:
      return NetworkError.unauthorized;
    case 404:
      return NetworkError.notFound;
    default:
      return NetworkError.serverError;
  }
}