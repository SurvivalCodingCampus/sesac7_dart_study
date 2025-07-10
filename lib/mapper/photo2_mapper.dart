import 'package:intl/intl.dart';
import 'package:modu_3_dart_study/dto/photo2/photo2_dto.dart';
import 'package:modu_3_dart_study/model/photo2/photo2.dart';
import 'package:modu_3_dart_study/model/photo2/photo2_type.dart';

extension Photo2DtoToModel on Photo2Dto {
  Photo2 toModel() {
    return Photo2(
      id: _dynamicToId(id),
      type: _stringToType(type),
      title: title ?? '',
      content: content ?? '',
      url: url ?? '',
      caption: caption ?? '',
      createdAt: _stringToDateTime(createdAt),
    );
  }

  int _dynamicToId(dynamic value) {
    if (value is num) {
      return value.toInt();
    }

    return 0;
  }

  Photo2Type _stringToType(String? value) {
    return switch (value) {
      'article' => Photo2Type.article,
      'image' => Photo2Type.image,
      'video' => Photo2Type.video,
      _ => Photo2Type.unknown,
    };
  }

  DateTime _stringToDateTime(String? value) {
    if (value == null || value == '') {
      return Photo2.unknownDate;
    }

    try {
      return DateTime.parse(value);
    } catch (e) {
      return Photo2.unknownDate;
    }
  }
}

extension Photo2ModelToDto on Photo2 {
  Photo2Dto toDto() {
    return Photo2Dto(
      id: id,
      type: type.toString(),
      title: title,
      content: content,
      url: url,
      caption: caption,
      createdAt: _formatDate(createdAt),
    );
  }

  String _formatDate(DateTime value) {
    if (value == Photo2.unknownDate) {
      return '';
    }

    return DateFormat('yyyy-MM-dd').format(value);
  }
}
