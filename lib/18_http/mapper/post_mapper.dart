import 'package:modu_3_dart_study/18_http/dto/post_dto.dart';
import 'package:modu_3_dart_study/18_http/model/post.dart';

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
    return PostDto(
      userId: userId,
      id: id,
      title: title,
      body: body,
    );
  }
}
