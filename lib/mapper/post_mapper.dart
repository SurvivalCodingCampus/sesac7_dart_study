import 'package:modu_3_dart_study/model/post.dart';
import 'package:modu_3_dart_study/dto/post_dto.dart';

// 기존 클래스에 메서드, getter, setter 를 새로 추가하는 기능
// 기존 클래스 수정하거나 상속하지 않고도 마치 메서드가 있었던것 처럼 사용 할 수 있다
extension DtoToPostMapper on PostDto {
  Post toModel() {
    return Post(
      userId: userId?.toInt() ?? 0,
      id: id?.toInt() ?? 0,
      title: title ?? '',
      body: body ?? '',
    );
  }
}

extension PostToDtoMapper on Post {
  PostDto toDto() {
    return PostDto(userId: userId, id: id, title: title, body: body);
  }
}
