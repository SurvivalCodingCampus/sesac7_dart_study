class PhotoDto {
  PhotoDto({
    dynamic id,
    dynamic type,
    dynamic url,
    dynamic caption,
    dynamic title,
    dynamic content,
    dynamic createdAt,
  }) {
    _id = id;
    _type = type;
    _url = url;
    _caption = caption;
    _title = title;
    _content = content;
    _createdAt = createdAt;
  }

  PhotoDto.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _url = json['url'];
    _caption = json['caption'];
    _title = json['title'];
    _content = json['content'];
    _createdAt = json['created_at'];
  }

  dynamic _id;
  dynamic _type;
  dynamic _url;
  dynamic _caption;
  dynamic _title;
  dynamic _content;
  dynamic _createdAt;

  dynamic get id => _id;

  dynamic get type => _type;

  dynamic get url => _url;

  dynamic get caption => _caption;

  dynamic get title => _title;

  dynamic get content => _content;

  dynamic get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['url'] = _url;
    map['caption'] = _caption;
    map['title'] = _title;
    map['content'] = _content;
    map['created_at'] = _createdAt;
    return map;
  }
}
