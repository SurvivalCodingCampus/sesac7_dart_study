import 'package:modu_3_dart_study/data_source/local/data_source.dart';

class MockDataSourceImpl implements DataSource{

  final List<Map<String, dynamic>> json;

  MockDataSourceImpl(this.json);

  @override
  Future<List<Map<String, dynamic>>> getAll() async{
    return json;
  }
  
}