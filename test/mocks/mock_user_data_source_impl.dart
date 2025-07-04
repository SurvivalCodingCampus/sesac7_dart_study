import 'package:modu_3_dart_study/data_source/local/user_data_source.dart';

class MockUserDataSourceImpl implements UserDataSource{

  final List<Map<String, dynamic>> json;
  MockUserDataSourceImpl(this.json);

  @override
  Future<List> getAll() async {
    return json;
  }
  
}