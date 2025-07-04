import 'package:modu_3_dart_study/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/model/user.dart';

class MockUserDataSourceImpl implements UserDataSource {
  final jsons = [
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
  ];
  final bool? isException;
  final bool? isOver10Data;

  MockUserDataSourceImpl({
    this.isException,
    this.isOver10Data,
  });

  @override
  Future<List<User>> getUsers() async {
    if (isException != null && isException!) {
      throw Exception('Fail to get users');
    }

    if (isOver10Data != null && isOver10Data!) {
      return [
        User(username: 'aaa'),
        User(username: 'aaa'),
        User(username: 'aaa'),
        User(username: 'aaa'),
        User(username: 'aaa'),
        User(username: 'aaa'),
        User(username: 'aaa'),
        User(username: 'aaa'),
        User(username: 'aaa'),
        User(username: 'aaa'),
        User(username: 'aaa'),
      ];
    }

    return jsons.map(User.fromJson).toList();
  }
}
