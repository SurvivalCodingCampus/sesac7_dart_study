import 'package:modu_3_dart_study/core/network_error.dart';

abstract interface class NetworkValidator {
  NetworkError? checkStatusCodeError(int code);
}
