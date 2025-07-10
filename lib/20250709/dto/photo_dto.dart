class PhotoDto {

  Object? id;
  String? type;
  String? title;
  String? content;
  String? url;
  String? caption;
  String? createdAt;
  
  PhotoDto({
      this.id, 
      this.type, 
      this.title, 
      this.content, 
      this.url, 
      this.caption, 
      this.createdAt,});

  PhotoDto.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    content = json['content'];
    url = json['url'];
    caption = json['caption'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['title'] = title;
    map['content'] = content;
    map['url'] = url;
    map['caption'] = caption;
    map['created_at'] = createdAt;
    return map;
  }

}