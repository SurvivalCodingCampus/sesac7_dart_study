import 'package:modu_3_dart_study/core/network_error.dart';
import 'package:modu_3_dart_study/core/network_validator.dart';

class NetworkValidatorImpl implements NetworkValidator {
  @override
  NetworkError? checkStatusCodeError(int code) {
    switch (code) {
      case >= 200 && < 300:
        return null;
      case 401:
        return NetworkError.unauthorized;
      case 404:
        return NetworkError.notFound;
      case >= 500 && < 600:
        return NetworkError.serverError;
      default:
        return NetworkError.unknown;
    }
  }
}
