import 'package:modu_3_dart_study/assignments/2025-07-09/core/network_error.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/user_model_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/model/user_model.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/repository/user_model_repository.dart';
import 'package:test/scaffolding.dart';

import '../mocks/mock_timeout_user_model_data_source_impl.dart';
import '../mocks/mock_user_model_data_source_impl.dart';

void main() {
  test('user_model_repo 성공 test', () async {
    final UserModelDataSource mockUserModelDataSource =
        MockUserModelDataSourceImpl();
    final UserModelRepository userModelRepository = UserModelRepositoryImpl(
      mockUserModelDataSource,
    );

    final result = await userModelRepository.getUsers();
    switch (result) {
      case Success<List<UserModel>, NetworkError>():
        print(result.data);
      case Error<List<UserModel>, NetworkError>():
        {
          switch (result.error) {
            case NetworkError.requestTimeout:
              print('타임아웃');
            case NetworkError.unauthorized:
              print('권한없음');
            case NetworkError.unknown:
              print('알 수 없는 네트워크 에러');
            case NetworkError.notFound:
              print('Not Found');
            case NetworkError.serverError:
              print('서버에러');
            case NetworkError.idError:
              print('Id 에러');
          }
        }
    }
  });

  test('timeout - user_model_repo test', () async {
    final UserModelDataSource mockTimeoutUserModelDataSource =
        MockTimeoutUserModelDataSourceImpl();
    final UserModelRepository userModelRepository = UserModelRepositoryImpl(
      mockTimeoutUserModelDataSource,
    );

    final result = await userModelRepository.getUsers();
    switch (result) {
      case Success<List<UserModel>, NetworkError>():
        print(result.data);
      case Error<List<UserModel>, NetworkError>():
        {
          switch (result.error) {
            case NetworkError.requestTimeout:
              print('타임아웃');
            case NetworkError.unauthorized:
              print('권한없음');
            case NetworkError.unknown:
              print('알 수 없는 네트워크 에러');
            case NetworkError.notFound:
              print('Not Found');
            case NetworkError.serverError:
              print('서버에러');
            case NetworkError.idError:
              print('Id 에러');
          }
        }
    }
  });
}
