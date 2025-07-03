import 'package:modu_3_dart_study/repository/model/photo.dart';

abstract interface class PhotoDataSource{
  Future<List<Map<String, dynamic>>> getAll();
}