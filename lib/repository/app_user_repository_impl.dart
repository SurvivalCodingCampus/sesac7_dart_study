import 'package:modu_3_dart_study/core/network_error.dart';
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/data_source/remote/app_user_data_source.dart';
import 'package:modu_3_dart_study/dto/app_user_dto.dart';
import 'package:modu_3_dart_study/mapper/app_user_mapper.dart';
import 'package:modu_3_dart_study/model/app_user.dart';
import 'package:modu_3_dart_study/repository/app_user_repository.dart';
import 'dart:async';

class AppUserRepositoryImpl implements AppUserRepository {
  final AppUserDataSource _appUserDataSource;
  AppUserRepositoryImpl(this._appUserDataSource);

  NetworkError statusCodeToError(int? statusCode) {
    switch (statusCode) {
      case 401:
        return NetworkError.unauthorized;
      case 404:
        return NetworkError.notFound;
      case 500:
      case 501:
      case 502:
      case 503:
        return NetworkError.serverError;
      default:
        return NetworkError.unknown;
    }
  }

  @override
  Future<Result<AppUserDto, NetworkError>> createUser(AppUser appUser) async {
    final AppUserDto dto = appUser.toDto();

    try {
      final result = await _appUserDataSource
          .createUser(dto)
          .timeout(const Duration(seconds: 10));

      print('런타임 타입 : ${result.runtimeType}');
      // 런타임 타입 : Response<AppUserDto>

      // switch (result) {
      //   // Success 타입의 객체가 result 에 들어있을때 그 객체를 success라는 이름으로 받겠다
      //   case Success<Response<AppUserDto>, NetworkError> success:
      //     return Result.success(success.value.body);
      //   case Failure<Response<AppUserDto>, NetworkError> failure:
      //     final statusCode = result.statusCode;
      //     final errorType = statusCodeToError(statusCode);
      //     return Result.failure(errorType);
      // }

      if (result.statusCode >= 200 && result.statusCode < 300) {
        return Result.success(result.body);
      } else {
        final errorType = statusCodeToError(result.statusCode);
        return Result.failure(errorType);
      }
    } on TimeoutException {
      return Result.failure(NetworkError.requestTimeout);
    } on FormatException {
      return Result.failure(NetworkError.parseError);
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }

    throw Exception('Unexpected result type');
    // AppUserDto 값을 리턴해야함
  }

  @override
  Future<Result<AppUser, NetworkError>> getUser(int userId) async {
    try {
      final result = await _appUserDataSource
          .getUser(userId)
          .timeout(const Duration(seconds: 10));

      switch (result) {
        // Success 타입의 객체가 result 에 들어있을때 그 객체를 success라는 이름으로 받겠다
        case Success<AppUser, NetworkError> success:
          final AppUser getUserResult = result.body.toModel();
          return Result.success(getUserResult);
        case Failure<AppUser, NetworkError> failure:
          final statusCode = result.statusCode;
          final errorType = statusCodeToError(statusCode);
          return Result.failure(errorType);
      }
    } on TimeoutException {
      return Result.failure(NetworkError.requestTimeout);
    } on FormatException {
      return Result.failure(NetworkError.parseError);
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }

    throw Exception('Unexpected result type');
  }

  @override
  Future<Result<List<AppUser>, NetworkError>> getUserList() async {
    try {
      final result = await _appUserDataSource.getUserList().timeout(
        const Duration(seconds: 10),
      );
      // final AppUser getUserListResult = result.map((e) => AppUser.fromJson(result.toModel()));

      switch (result) {
        // Success 타입의 객체가 result 에 들어있을때 그 객체를 success라는 이름으로 받겠다
        case Success<List<AppUserDto>, NetworkError> success:
          final getUserListResult = success.value
              .map((AppUserDto dto) => dto.toModel())
              .toList();

          return Result.success(getUserListResult);
        case Failure<List<AppUserDto>, NetworkError> failure:
          final statusCode = result.statusCode;
          final errorType = statusCodeToError(statusCode);
          return Result.failure(errorType);
      }
    } on TimeoutException {
      return Result.failure(NetworkError.requestTimeout);
    } on FormatException {
      return Result.failure(NetworkError.parseError);
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }

    throw Exception('Unexpected result type');
  }
}
