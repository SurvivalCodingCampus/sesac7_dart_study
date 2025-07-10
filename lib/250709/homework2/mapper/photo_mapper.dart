import '../dto/photo_dto.dart';
import '../model/photo.dart';

final DateTime DATE_NOT_AVAILABLE = DateTime.fromMillisecondsSinceEpoch(0);

extension DtoToModel on PhotoDto {
  Photo toModel() {
    //Type: Article, Image, Video, Unknown
    Type enumType = Type.Unknown;
    if (type != null) {
      if (type?.toLowerCase() == 'article') enumType = Type.Article;
      if (type?.toLowerCase() == 'image') enumType = Type.Image;
      if (type?.toLowerCase() == 'video') enumType = Type.Video;
    }

    return Photo(
      id: id is num ? id.toInt() : int.tryParse(id) ?? -1,
      type: enumType,
      title: title ?? '',
      content: content ?? '',
      createdAt: createdAt == null
          ? DATE_NOT_AVAILABLE
          : (DateTime.tryParse((createdAt as String)) ?? DATE_NOT_AVAILABLE),
      url: url ?? '',
      caption: caption ?? '',
    );
  }
}

// dynamic id;
// String? type;
// String? title;
// String? content;
// String? createdAt;

// final num id;
// final Type type;
// final String title;
// final String content;
// final DateTime createdAt;
