import 'dart:async';

import 'package:modu_3_dart_study/core/exceptions.dart';
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/data_source/image_share_app_user/image_share_app_user_data_source.dart';
import 'package:modu_3_dart_study/dto/image_share_app_user/image_share_app_user_dto.dart';
import 'package:modu_3_dart_study/enum/network_error.dart';
import 'package:modu_3_dart_study/mapper/image_share_app_user_mapper.dart';
import 'package:modu_3_dart_study/model/image_share_app_user.dart';
import 'package:modu_3_dart_study/repository/image_share_app_user/image_share_app_user_repository.dart';

class ImageShareAppUserRepositoryImpl implements ImageShareAppUserRepository {
  final ImageShareAppUserDataSource _dataSource;

  ImageShareAppUserRepositoryImpl(ImageShareAppUserDataSource dataSource)
    : _dataSource = dataSource;

  @override
  Future<Result<ImageShareAppUser, NetworkError>> createNewUser(
    ImageShareAppUser imageShareAppUser,
  ) async {
    final Response<ImageShareAppUserDto> response = await _dataSource
        .createImageShareAppUser(imageShareAppUser.toDto())
        .timeout(Duration(seconds: 10));

    try {
      final NetworkError? networkErrorType = response.statusCode
          .statusCodeToNetworkErrorType();
      if (networkErrorType == null) {
        return Success(response.body.toModel());
      } else {
        return Error(networkErrorType);
      }
    } on JsonParsingException {
      return Error(NetworkError.jsonParsingError);
    } on TimeoutException {
      return Error(NetworkError.requestTimeout);
    } catch (e) {
      return Error(NetworkError.unKnown);
    }
  }

  @override
  Future<Result<ImageShareAppUser, NetworkError>> findByIdUser(int id) async {
    try {
      final Response<ImageShareAppUserDto> response = await _dataSource
          .getImageShareAppUserFindById(id)
          .timeout(Duration(seconds: 10));
      final NetworkError? networkErrorType = response.statusCode
          .statusCodeToNetworkErrorType();
      if (networkErrorType == null) {
        return Success(response.body.toModel());
      } else {
        return Error(networkErrorType);
      }
    } on JsonParsingException {
      return Error(NetworkError.jsonParsingError);
    } on TimeoutException {
      return Error(NetworkError.requestTimeout);
    } catch (e) {
      return Error(NetworkError.unKnown);
    }
  }

  @override
  Future<Result<List<ImageShareAppUser>, NetworkError>> getAllUserList() async {
    try {
      final Response<List<ImageShareAppUserDto>> response = await _dataSource
          .getImageShareAppUsers()
          .timeout(Duration(seconds: 10));
      final NetworkError? networkErrorType = response.statusCode
          .statusCodeToNetworkErrorType();
      if (networkErrorType == null) {
        return Success(response.body.map((dto) => dto.toModel()).toList());
      } else {
        return Error(networkErrorType);
      }
    } on JsonParsingException {
      return Error(NetworkError.jsonParsingError);
    } on TimeoutException {
      return Error(NetworkError.requestTimeout);
    } catch (e) {
      return Error(NetworkError.unKnown);
    }
  }
}
