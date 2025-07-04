import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/model/user/user.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/user_repository.dart';
import 'package:modu_3_dart_study/assignments/repository_practice/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([UserDataSource])
void main() {
  group('UserRepositoryImpl 테스트', () {
    final mockDataSource = MockUserDataSource();
    final UserRepository repository = UserRepositoryImpl(mockDataSource);

    test('전체 User 리스트를 반환', () async {
      // 목데이터 생성은 했는데 그래서 이게 내가 직접만드는거랑 차이가 뭔지 모르겠음
      // 데이터도 직접 넣어서 mockito를 통해 파일을 생성하고 테스트를 돌린다?

      when(mockDataSource.getAll()).thenAnswer(
        (_) async => [
          {
            "id": 1,
            "name": "Leanne Graham",
            "username": "Bret",
            "email": "Sincere@april.biz",
            "address": {
              "street": "Kulas Light",
              "suite": "Apt. 556",
              "city": "Gwenborough",
              "zipcode": "92998-3874",
              "geo": {"lat": "-37.3159", "lng": "81.1496"},
            },
            "phone": "1-770-736-8031 x56442",
            "website": "hildegard.org",
            "company": {
              "name": "Romaguera-Crona",
              "catchPhrase": "Multi-layered client-server neural-net",
              "bs": "harness real-time e-markets",
            },
          },
          {
            "id": 2,
            "name": "Ervin Howell",
            "username": "Antonette",
            "email": "Shanna@melissa.tv",
            "address": {
              "street": "Victor Plains",
              "suite": "Suite 879",
              "city": "Wisokyburgh",
              "zipcode": "90566-7771",
              "geo": {"lat": "-43.9509", "lng": "-34.4618"},
            },
            "phone": "010-692-6593 x09125",
            "website": "anastasia.net",
            "company": {
              "name": "Deckow-Crist",
              "catchPhrase": "Proactive didactic contingency",
              "bs": "synergize scalable supply-chains",
            },
          },
          {
            "id": 3,
            "name": "Clementine Bauch",
            "username": "Samantha",
            "email": "Nathan@yesenia.net",
            "address": {
              "street": "Douglas Extension",
              "suite": "Suite 847",
              "city": "McKenziehaven",
              "zipcode": "59590-4157",
              "geo": {"lat": "-68.6102", "lng": "-47.0653"},
            },
            "phone": "1-463-123-4447",
            "website": "ramiro.info",
            "company": {
              "name": "Romaguera-Jacobson",
              "catchPhrase": "Face to face bifurcated interface",
              "bs": "e-enable strategic applications",
            },
          },
        ],
      );

      final users = await repository.getUsers();

      expect(users, isA<List<User>>());
      expect(users.length, 3);
      expect(users.first.name, 'Leanne Graham');
    });

    test('username으로 정렬된 리스트를 반환', () async {
      // 목데이터 생성은 했는데 그래서 이게 내가 직접만드는거랑 차이가 뭔지 모르겠음

      when(mockDataSource.getAll()).thenAnswer(
        (_) async => [
          {
            "id": 1,
            "name": "Leanne Graham",
            "username": "Bret",
            "email": "Sincere@april.biz",
            "address": {
              "street": "Kulas Light",
              "suite": "Apt. 556",
              "city": "Gwenborough",
              "zipcode": "92998-3874",
              "geo": {"lat": "-37.3159", "lng": "81.1496"},
            },
            "phone": "1-770-736-8031 x56442",
            "website": "hildegard.org",
            "company": {
              "name": "Romaguera-Crona",
              "catchPhrase": "Multi-layered client-server neural-net",
              "bs": "harness real-time e-markets",
            },
          },
          {
            "id": 2,
            "name": "Ervin Howell",
            "username": "Antonette",
            "email": "Shanna@melissa.tv",
            "address": {
              "street": "Victor Plains",
              "suite": "Suite 879",
              "city": "Wisokyburgh",
              "zipcode": "90566-7771",
              "geo": {"lat": "-43.9509", "lng": "-34.4618"},
            },
            "phone": "010-692-6593 x09125",
            "website": "anastasia.net",
            "company": {
              "name": "Deckow-Crist",
              "catchPhrase": "Proactive didactic contingency",
              "bs": "synergize scalable supply-chains",
            },
          },
          {
            "id": 3,
            "name": "Clementine Bauch",
            "username": "Samantha",
            "email": "Nathan@yesenia.net",
            "address": {
              "street": "Douglas Extension",
              "suite": "Suite 847",
              "city": "McKenziehaven",
              "zipcode": "59590-4157",
              "geo": {"lat": "-68.6102", "lng": "-47.0653"},
            },
            "phone": "1-463-123-4447",
            "website": "ramiro.info",
            "company": {
              "name": "Romaguera-Jacobson",
              "catchPhrase": "Face to face bifurcated interface",
              "bs": "e-enable strategic applications",
            },
          },
        ],
      );

      final users = await repository.getUsersTop10ByUserName();
      expect(users.length, 3);
      expect(users.first.username, 'Antonette');
      expect(users.last.username, 'Samantha');
    });
  });
}
