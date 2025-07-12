import 'package:modu_3_dart_study/core/network_error.dart';
import 'package:modu_3_dart_study/core/network_validator.dart';
import 'package:modu_3_dart_study/core/network_validator_impl.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:test/test.dart';

void main() {
  final NetworkValidator validator = NetworkValidatorImpl();

  group(
    'validateStatusCode',
    () {
      test('Returns NetworkError.unknown if statusCode is less than 200.', () {
        // given
        final wrongCode = 199;

        // when
        final result = validator.checkStatusCodeError(wrongCode);

        // then
        expect(result, Result<void, NetworkError>.error(NetworkError.unknown));
      });

      test('Returns Result.success if statusCode is 200.', () {
        // given
        final validCode = 200;

        // when
        final result = validator.checkStatusCodeError(validCode);

        // then
        expect(result, Result<void, NetworkError>.success(null));
      });

      test('Returns Result.success if statusCode is 299.', () {
        // given
        final validCode = 299;

        // when
        final result = validator.checkStatusCodeError(validCode);

        // then
        expect(result, Result<void, NetworkError>.success(null));
      });

      test('Returns NetworkError.unknown if statusCode is 300.', () {
        // given
        final wrongCode = 300;

        // when
        final result = validator.checkStatusCodeError(wrongCode);

        // then
        expect(result, Result<void, NetworkError>.error(NetworkError.unknown));
      });

      test('Returns NetworkError.unauthorized if statusCode is 401.', () {
        // given
        final unauthorizedCode = 401;

        // when
        final result = validator.checkStatusCodeError(unauthorizedCode);

        // then
        expect(
          result,
          Result<void, NetworkError>.error(NetworkError.unauthorized),
        );
      });

      test('Returns NetworkError.notFound if statusCode is 404.', () {
        // given
        final notFoundCode = 404;

        // when
        final result = validator.checkStatusCodeError(notFoundCode);

        // then
        expect(result, Result<void, NetworkError>.error(NetworkError.notFound));
      });

      test('Returns NetworkError.unknown if statusCode is 499.', () {
        // given
        final wrongCode = 499;

        // when
        final result = validator.checkStatusCodeError(wrongCode);

        // then
        expect(result, Result<void, NetworkError>.error(NetworkError.unknown));
      });

      test('Returns NetworkError.serverError if statusCode is 500.', () {
        // given
        final serverErrorCode = 500;

        // when
        final result = validator.checkStatusCodeError(serverErrorCode);

        // then
        expect(
          result,
          Result<void, NetworkError>.error(NetworkError.serverError),
        );
      });

      test('Returns NetworkError.serverError if statusCode is 599.', () {
        // given
        final serverErrorCode = 599;

        // when
        final result = validator.checkStatusCodeError(serverErrorCode);

        // then
        expect(
          result,
          Result<void, NetworkError>.error(NetworkError.serverError),
        );
      });

      test('Returns NetworkError.unknown if statusCode is 600.', () {
        // given
        final wrongCode = 600;

        // when
        final result = validator.checkStatusCodeError(wrongCode);

        // then
        expect(result, Result<void, NetworkError>.error(NetworkError.unknown));
      });
    },
  );
}
