import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/enum/network_error.dart';
import 'package:modu_3_dart_study/model/image_share_app_user.dart';

abstract interface class ImageShareAppUserRepository {
  Future<Result<ImageShareAppUser, NetworkError>> findByIdUser(int id);

  Future<Result<List<ImageShareAppUser>, NetworkError>> getAllUserList();

  Future<Result<ImageShareAppUser, NetworkError>> createNewUser(
    ImageShareAppUser imageShareAppUser,
  );
}
