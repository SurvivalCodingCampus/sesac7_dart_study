import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/data_source/image_share_app_user/image_share_app_user_data_source.dart';
import 'package:modu_3_dart_study/enum/network_error.dart';
import 'package:modu_3_dart_study/model/image_share_app_user.dart';
import 'package:modu_3_dart_study/repository/image_share_app_user/image_share_app_user_repository.dart';
import 'package:modu_3_dart_study/repository/image_share_app_user/image_share_app_user_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../mocks/mock_image_share_app_data_source_duration_impl.dart';
import '../../mocks/mock_image_share_app_data_source_impl.dart';

void main() {
  final int mockSingleUserId = 2;
  final String mockSingleUserName = 'Bob Johnson';
  final int mockSingleUserAge = 34;
  final String mockSingleUserAddress = '456 Oak Ave, Somewhere';
  final String mockSingleUserPhoneNumber = '555-987-6543';
  final Map<String, dynamic> mockImageShareAppUserJson = {
    'id': mockSingleUserId,
    'name': mockSingleUserName,
    'age': mockSingleUserAge,
    'address': mockSingleUserAddress,
    'phoneNumber': mockSingleUserPhoneNumber,
  };

  final List<Map<String, dynamic>> mockImageShareAppUserJsonList = [
    {
      'id': 1,
      'name': 'Alice Smith',
      'age': 28,
      'address': '123 Maple St, Anytown',
      'phoneNumber': '555-123-4567',
    },
    {
      'id': 2,
      'name': 'Bob Johnson',
      'age': 34,
      'address': '456 Oak Ave, Somewhere',
      'phoneNumber': '555-987-6543',
    },
    {
      'id': 3,
      'name': 'Charlie Brown',
      'age': 22,
      'address': '789 Pine Ln, Nowhere',
      'phoneNumber': '555-111-2222',
    },
    {
      'id': 4,
      'name': 'Diana Prince',
      'age': 30,
      'address': '101 Cedar Dr, Metropolis',
      'phoneNumber': '555-333-4444',
    },
    {
      'id': 5,
      'name': 'Ethan Hunt',
      'age': 45,
      'address': '202 Birch Ct, Spyville',
      'phoneNumber': '555-555-6666',
    },
    {
      'id': 6,
      'name': 'Fiona Apple',
      'age': 29,
      'address': '303 Elm Rd, Melody',
      'phoneNumber': '555-777-8888',
    },
    {
      'id': 7,
      'name': 'George Lucas',
      'age': 78,
      'address': '404 Film Studio, Hollywood',
      'phoneNumber': '555-999-0000',
    },
    {
      'id': 8,
      'name': 'Hannah Montana',
      'age': 19,
      'address': '505 Pop Blvd, Star City',
      'phoneNumber': '555-222-3333',
    },
    {
      'id': 9,
      'name': 'Ivy Green',
      'age': 25,
      'address': '606 Willow Way, Nature Town',
      'phoneNumber': '555-444-5555',
    },
    {
      'id': 10,
      'name': 'Jack Black',
      'age': 53,
      'address': '707 Rock St, Musicville',
      'phoneNumber': '555-666-7777',
    },
  ];

  group('ImageShareAppUserRepositoryImpl Test', () {
    group('createNewUser Test', () {
      test('createNewUser Success Test', () async {
        final MockClient mockClient = MockClient((request) async {
          return http.Response(jsonEncode(mockImageShareAppUserJson), 201);
        });
        final ImageShareAppUserDataSource mockDataSource =
            MockImageShareAppDataSourceImpl(mockClient);
        final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
            ImageShareAppUserRepositoryImpl(mockDataSource);
        final ImageShareAppUser imageShareAppUser = ImageShareAppUser(
          id: mockSingleUserId,
          name: mockSingleUserName,
          age: mockSingleUserAge,
          address: mockSingleUserAddress,
          phoneNumber: mockSingleUserAddress,
        );
        final Result<ImageShareAppUser, NetworkError> result =
            await imageShareAppUserRepositoryImpl.createNewUser(
              imageShareAppUser,
            );

        switch (result) {
          case Success():
            expect(result.data.id, mockSingleUserId);
            expect(result.data.name, mockSingleUserName);
            expect(result.data.age, mockSingleUserAge);
            expect(result.data.address, mockSingleUserAddress);
            expect(result.data.phoneNumber, mockSingleUserPhoneNumber);
          case Error():
            break;
        }
      });

      group('createNewUser NetWorkErrorType 테스트 Test', () {
        test('408 requestTimeout', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 408);
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final ImageShareAppUser imageShareAppUser = ImageShareAppUser(
            id: mockSingleUserId,
            name: mockSingleUserName,
            age: mockSingleUserAge,
            address: mockSingleUserAddress,
            phoneNumber: mockSingleUserAddress,
          );
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.createNewUser(
                imageShareAppUser,
              );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.requestTimeout));
          }
        });
        test('401 unauthorized', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 401);
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final ImageShareAppUser imageShareAppUser = ImageShareAppUser(
            id: mockSingleUserId,
            name: mockSingleUserName,
            age: mockSingleUserAge,
            address: mockSingleUserAddress,
            phoneNumber: mockSingleUserAddress,
          );
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.createNewUser(
                imageShareAppUser,
              );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.unauthorized));
          }
        });
        test('404 notFound', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 404);
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final ImageShareAppUser imageShareAppUser = ImageShareAppUser(
            id: mockSingleUserId,
            name: mockSingleUserName,
            age: mockSingleUserAge,
            address: mockSingleUserAddress,
            phoneNumber: mockSingleUserAddress,
          );
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.createNewUser(
                imageShareAppUser,
              );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.notFound));
          }
        });
        test('500~600 serverError', () async {
          final MockClient mockClientStatusCode500 = MockClient((
            request,
          ) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 500);
          });
          final MockClient mockClientStatusCode599 = MockClient((
            request,
          ) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 599);
          });
          final ImageShareAppUser imageShareAppUser = ImageShareAppUser(
            id: mockSingleUserId,
            name: mockSingleUserName,
            age: mockSingleUserAge,
            address: mockSingleUserAddress,
            phoneNumber: mockSingleUserAddress,
          );
          final ImageShareAppUserDataSource mockDataSourceStatusCode500 =
              MockImageShareAppDataSourceImpl(mockClientStatusCode500);
          final ImageShareAppUserRepository
          imageShareAppUserRepositoryImplStatusCode500 =
              ImageShareAppUserRepositoryImpl(mockDataSourceStatusCode500);
          final Result<ImageShareAppUser, NetworkError> resultStatusCode500 =
              await imageShareAppUserRepositoryImplStatusCode500.createNewUser(
                imageShareAppUser,
              );

          final ImageShareAppUserDataSource mockDataSourceStatusCode599 =
              MockImageShareAppDataSourceImpl(mockClientStatusCode599);
          final ImageShareAppUserRepository
          imageShareAppUserRepositoryImplStatusCode599 =
              ImageShareAppUserRepositoryImpl(mockDataSourceStatusCode599);
          final Result<ImageShareAppUser, NetworkError> resultStatusCode599 =
              await imageShareAppUserRepositoryImplStatusCode599.createNewUser(
                imageShareAppUser,
              );

          switch (resultStatusCode500) {
            case Success():
              break;
            case Error():
              expect(
                resultStatusCode500.error,
                equals(NetworkError.serverError),
              );
          }
          switch (resultStatusCode599) {
            case Success():
              break;
            case Error():
              expect(
                resultStatusCode599.error,
                equals(NetworkError.serverError),
              );
          }
        });
        test('unknown', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 600);
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final ImageShareAppUser imageShareAppUser = ImageShareAppUser(
            id: mockSingleUserId,
            name: mockSingleUserName,
            age: mockSingleUserAge,
            address: mockSingleUserAddress,
            phoneNumber: mockSingleUserAddress,
          );
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.createNewUser(
                imageShareAppUser,
              );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.unKnown));
          }
        });
        test('jsonParsingError', () async {
          final Map<String, dynamic> mockImageShareAppUserNullJson = {
            'id': null,
            'name': null,
            'age': null,
            'address': null,
            'phoneNumber': null,
          };
          final MockClient mockClient = MockClient((request) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserNullJson),
              200,
            );
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final ImageShareAppUser imageShareAppUser = ImageShareAppUser(
            id: mockSingleUserId,
            name: mockSingleUserName,
            age: mockSingleUserAge,
            address: mockSingleUserAddress,
            phoneNumber: mockSingleUserAddress,
          );
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.createNewUser(
                imageShareAppUser,
              );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.jsonParsingError));
          }
        });
        test('FormatException jsonParsingError', () async {
          final Map<String, dynamic> mockImageShareAppUserNullJson = {
            'id': 2.0,
            'name': 'test_name',
            'age': 28.0,
            'address': 'test_address',
            'phoneNumber': 'test_phone_number',
          };
          final MockClient mockClient = MockClient((request) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserNullJson),
              200,
            );
          });
          final ImageShareAppUserDataSource mockDataSource =
          MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
          ImageShareAppUserRepositoryImpl(mockDataSource);
          final ImageShareAppUser imageShareAppUser = ImageShareAppUser(
            id: mockSingleUserId,
            name: mockSingleUserName,
            age: mockSingleUserAge,
            address: mockSingleUserAddress,
            phoneNumber: mockSingleUserAddress,
          );
          final Result<ImageShareAppUser, NetworkError> result =
          await imageShareAppUserRepositoryImpl.createNewUser(
            imageShareAppUser,
          );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.jsonParsingError));
          }
        });
      });
      test('RequestTimeOutTest', () async {
        final MockClient mockClient = MockClient((request) async {
          return http.Response(jsonEncode(mockImageShareAppUserJson), 200);
        });
        final ImageShareAppUserDataSource mockDataSource =
            MockImageShareAppDataSourceDurationImpl(mockClient);
        final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
            ImageShareAppUserRepositoryImpl(mockDataSource);
        final ImageShareAppUser imageShareAppUser = ImageShareAppUser(
          id: mockSingleUserId,
          name: mockSingleUserName,
          age: mockSingleUserAge,
          address: mockSingleUserAddress,
          phoneNumber: mockSingleUserAddress,
        );
        final Result<ImageShareAppUser, NetworkError> result =
            await imageShareAppUserRepositoryImpl.createNewUser(
              imageShareAppUser,
            );

        switch (result) {
          case Success():
            break;
          case Error():
            expect(result.error, equals(NetworkError.requestTimeout));
        }
      });
    });

    group('findByIdUser Test', () {
      test('findByIdUser Success Test', () async {
        final MockClient mockClient = MockClient((request) async {
          return http.Response(jsonEncode(mockImageShareAppUserJson), 200);
        });
        final ImageShareAppUserDataSource mockDataSource =
            MockImageShareAppDataSourceImpl(mockClient);
        final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
            ImageShareAppUserRepositoryImpl(mockDataSource);
        final Result<ImageShareAppUser, NetworkError> result =
            await imageShareAppUserRepositoryImpl.findByIdUser(
              mockSingleUserId,
            );

        switch (result) {
          case Success():
            expect(result.data.id, mockSingleUserId);
            expect(result.data.name, mockSingleUserName);
            expect(result.data.age, mockSingleUserAge);
            expect(result.data.address, mockSingleUserAddress);
            expect(result.data.phoneNumber, mockSingleUserPhoneNumber);
          case Error():
            break;
        }
      });

      group('findByIdUser NetWorkErrorType 테스트 Test', () {
        test('408 requestTimeout', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 408);
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.findByIdUser(
                mockSingleUserId,
              );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.requestTimeout));
          }
        });
        test('401 unauthorized', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 401);
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.findByIdUser(
                mockSingleUserId,
              );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.unauthorized));
          }
        });
        test('404 notFound', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 404);
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.findByIdUser(
                mockSingleUserId,
              );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.notFound));
          }
        });
        test('500~600 serverError', () async {
          final MockClient mockClientStatusCode500 = MockClient((
            request,
          ) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 500);
          });
          final MockClient mockClientStatusCode599 = MockClient((
            request,
          ) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 599);
          });
          final ImageShareAppUserDataSource mockDataSourceStatusCode500 =
              MockImageShareAppDataSourceImpl(mockClientStatusCode500);
          final ImageShareAppUserRepository
          imageShareAppUserRepositoryImplStatusCode500 =
              ImageShareAppUserRepositoryImpl(mockDataSourceStatusCode500);
          final Result<ImageShareAppUser, NetworkError> resultStatusCode500 =
              await imageShareAppUserRepositoryImplStatusCode500.findByIdUser(
                mockSingleUserId,
              );

          final ImageShareAppUserDataSource mockDataSourceStatusCode599 =
              MockImageShareAppDataSourceImpl(mockClientStatusCode599);
          final ImageShareAppUserRepository
          imageShareAppUserRepositoryImplStatusCode599 =
              ImageShareAppUserRepositoryImpl(mockDataSourceStatusCode599);
          final Result<ImageShareAppUser, NetworkError> resultStatusCode599 =
              await imageShareAppUserRepositoryImplStatusCode599.findByIdUser(
                mockSingleUserId,
              );

          switch (resultStatusCode500) {
            case Success():
              break;
            case Error():
              expect(
                resultStatusCode500.error,
                equals(NetworkError.serverError),
              );
          }
          switch (resultStatusCode599) {
            case Success():
              break;
            case Error():
              expect(
                resultStatusCode599.error,
                equals(NetworkError.serverError),
              );
          }
        });
        test('unknown', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(jsonEncode(mockImageShareAppUserJson), 600);
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.findByIdUser(
                mockSingleUserId,
              );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.unKnown));
          }
        });
        test('jsonParsingError', () async {
          final Map<String, dynamic> mockImageShareAppUserNullJson = {
            'id': null,
            'name': null,
            'age': null,
            'address': null,
            'phoneNumber': null,
          };
          final MockClient mockClient = MockClient((request) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserNullJson),
              200,
            );
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.findByIdUser(
                mockSingleUserId,
              );

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.jsonParsingError));
          }
        });
        test('FormatException jsonParsingError', () async {
          final Map<String, dynamic> mockImageShareAppUserNullJson = {
            'id': 2.0,
            'name': 'test_name',
            'age': 28.0,
            'address': 'test_address',
            'phoneNumber': 'test_phone_number',
          };
          final MockClient mockClient = MockClient((request) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserNullJson),
              200,
            );
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<ImageShareAppUser, NetworkError> result =
              await imageShareAppUserRepositoryImpl.findByIdUser(2);

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.jsonParsingError));
          }
        });
      });
      test('RequestTimeOutTest', () async {
        final MockClient mockClient = MockClient((request) async {
          return http.Response(jsonEncode(mockImageShareAppUserJson), 200);
        });
        final ImageShareAppUserDataSource mockDataSource =
            MockImageShareAppDataSourceDurationImpl(mockClient);
        final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
            ImageShareAppUserRepositoryImpl(mockDataSource);
        final Result<ImageShareAppUser, NetworkError> result =
            await imageShareAppUserRepositoryImpl.findByIdUser(
              mockSingleUserId,
            );

        switch (result) {
          case Success():
            break;
          case Error():
            expect(result.error, equals(NetworkError.requestTimeout));
        }
      });
    });

    group('getAllUserList Test', () {
      test('getAllUserList Success Test', () async {
        final MockClient mockClient = MockClient((request) async {
          return http.Response(jsonEncode(mockImageShareAppUserJsonList), 200);
        });
        final ImageShareAppUserDataSource mockDataSource =
            MockImageShareAppDataSourceImpl(mockClient);
        final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
            ImageShareAppUserRepositoryImpl(mockDataSource);
        final Result<List<ImageShareAppUser>, NetworkError> result =
            await imageShareAppUserRepositoryImpl.getAllUserList();
        switch (result) {
          case Success():
            final ImageShareAppUser firstUser = result.data.first;
            expect(result.data.length, 10);
            expect(firstUser.id, 1);
            expect(firstUser.name, 'Alice Smith');
            expect(firstUser.age, 28);
            expect(firstUser.address, '123 Maple St, Anytown');
            expect(firstUser.phoneNumber, '555-123-4567');
          case Error():
            break;
        }
      });

      group('getAllUserList NetWorkErrorType 테스트 Test', () {
        test('408 requestTimeout', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserJsonList),
              408,
            );
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<List<ImageShareAppUser>, NetworkError> result =
              await imageShareAppUserRepositoryImpl.getAllUserList();

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.requestTimeout));
          }
        });
        test('401 unauthorized', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserJsonList),
              401,
            );
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<List<ImageShareAppUser>, NetworkError> result =
              await imageShareAppUserRepositoryImpl.getAllUserList();

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.unauthorized));
          }
        });
        test('404 notFound', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserJsonList),
              404,
            );
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<List<ImageShareAppUser>, NetworkError> result =
              await imageShareAppUserRepositoryImpl.getAllUserList();

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.notFound));
          }
        });
        test('500~600 serverError', () async {
          final MockClient mockClientStatusCode500 = MockClient((
            request,
          ) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserJsonList),
              500,
            );
          });
          final MockClient mockClientStatusCode599 = MockClient((
            request,
          ) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserJsonList),
              599,
            );
          });
          final ImageShareAppUserDataSource mockDataSourceStatusCode500 =
              MockImageShareAppDataSourceImpl(mockClientStatusCode500);
          final ImageShareAppUserRepository
          imageShareAppUserRepositoryImplStatusCode500 =
              ImageShareAppUserRepositoryImpl(mockDataSourceStatusCode500);
          final Result<List<ImageShareAppUser>, NetworkError>
          resultStatusCode500 =
              await imageShareAppUserRepositoryImplStatusCode500
                  .getAllUserList();

          final ImageShareAppUserDataSource mockDataSourceStatusCode599 =
              MockImageShareAppDataSourceImpl(mockClientStatusCode599);
          final ImageShareAppUserRepository
          imageShareAppUserRepositoryImplStatusCode599 =
              ImageShareAppUserRepositoryImpl(mockDataSourceStatusCode599);
          final Result<List<ImageShareAppUser>, NetworkError>
          resultStatusCode599 =
              await imageShareAppUserRepositoryImplStatusCode599
                  .getAllUserList();

          switch (resultStatusCode500) {
            case Success():
              break;
            case Error():
              expect(
                resultStatusCode500.error,
                equals(NetworkError.serverError),
              );
          }
          switch (resultStatusCode599) {
            case Success():
              break;
            case Error():
              expect(
                resultStatusCode599.error,
                equals(NetworkError.serverError),
              );
          }
        });
        test('unknown', () async {
          final MockClient mockClient = MockClient((request) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserJsonList),
              600,
            );
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<List<ImageShareAppUser>, NetworkError> result =
              await imageShareAppUserRepositoryImpl.getAllUserList();

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.unKnown));
          }
        });
        test('jsonParsingError', () async {
          final List<Map<String, dynamic>> mockImageShareAppUserNullJson = [
            {
              'id': null,
              'name': null,
              'age': null,
              'address': null,
              'phoneNumber': null,
            },
          ];
          final MockClient mockClient = MockClient((request) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserNullJson),
              200,
            );
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<List<ImageShareAppUser>, NetworkError> result =
              await imageShareAppUserRepositoryImpl.getAllUserList();

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.jsonParsingError));
          }
        });
        test('FormatException jsonParsingError', () async {
          final List<Map<String, dynamic>> mockImageShareAppUserNullJson = [
            {
              'id': 2.0,
              'name': 'test_name',
              'age': 28.0,
              'address': 'test_address',
              'phoneNumber': 'test_phone_number',
            },
          ];
          final MockClient mockClient = MockClient((request) async {
            return http.Response(
              jsonEncode(mockImageShareAppUserNullJson),
              200,
            );
          });
          final ImageShareAppUserDataSource mockDataSource =
              MockImageShareAppDataSourceImpl(mockClient);
          final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
              ImageShareAppUserRepositoryImpl(mockDataSource);
          final Result<List<ImageShareAppUser>, NetworkError> result =
              await imageShareAppUserRepositoryImpl.getAllUserList();

          switch (result) {
            case Success():
              break;
            case Error():
              expect(result.error, equals(NetworkError.jsonParsingError));
          }
        });
      });
      test('RequestTimeOutTest', () async {
        final MockClient mockClient = MockClient((request) async {
          return http.Response(jsonEncode(mockImageShareAppUserJsonList), 200);
        });
        final ImageShareAppUserDataSource mockDataSource =
            MockImageShareAppDataSourceDurationImpl(mockClient);
        final ImageShareAppUserRepository imageShareAppUserRepositoryImpl =
            ImageShareAppUserRepositoryImpl(mockDataSource);
        final Result<List<ImageShareAppUser>, NetworkError> result =
            await imageShareAppUserRepositoryImpl.getAllUserList();

        switch (result) {
          case Success():
            break;
          case Error():
            expect(result.error, equals(NetworkError.requestTimeout));
        }
      });
    });
  });
}
