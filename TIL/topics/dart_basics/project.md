## Project designing
- generally project takes data from somewhere, convert that data, then present to the user

## DataSource
- The source of very data our app will be using
- could be file, API, DB, anything
- set up an interface file, then implementation to implement it
### photo_data_source.dart
```dart
import 'package:modu_3_dart_study/assignments/2025-07-09/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  List<PhotoDTO> getPhotoDTOs();
}

```

## Repository
- First step of data conversion pipeline to be used by the app
- Often responsible for "logical part of data conversion"

### photo_repository.dart
```dart
import 'package:modu_3_dart_study/assignments/2025-07-09/model/photo.dart';

abstract interface class PhotoRepository {
  List<Photo> getPhotos();
}

```

### photo_repository_impl.dart
```dart
class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  List<Photo> getPhotos() {
    //loigcal conversion of List<PhotoDTO> to List<Photo>
  }
}
```

## Model
- classes responsible for representing data into a useful and convinient form
- as little nullable as possible the better

## DTO / Mapper
- A buffer class to be rigorous against faulty data from source
- Raw data -> DTO -> (by Mapper) -> model
- DTO classes have the toJson, fromJson
- all nullable


### photo_mapper.dart
```dart
extension DtoToPhoto on PhotoDTO {
  Photo toPhoto() {
  }
}

extension PhotoToDto on Photo {
  PhotoDTO toPhotoDto() {
  }
}

```