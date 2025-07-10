import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/repository/photo_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-07-09/repository/photo_repository_impl.dart';

void main() {
  final PhotoDataSource source = MockPhotoDataSourceImpl();
  final PhotoRepository repo = PhotoRepositoryImpl(source);

  final photos = repo.getPhotos();
  print(photos);
}
