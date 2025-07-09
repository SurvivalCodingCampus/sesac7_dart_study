class StoreDTO {
  final String? addr;
  final String? code;
  final String? createdAt;
  final double? lat;
  final double? lng;
  final String? name;
  final String? remainStat;
  final String? stockAt;
  final String? type;
  const StoreDTO({
    this.addr,
    this.code,
    this.createdAt,
    this.lat,
    this.lng,
    this.name,
    this.remainStat,
    this.stockAt,
    this.type,
  });
  StoreDTO copyWith({
    String? addr,
    String? code,
    String? createdAt,
    double? lat,
    double? lng,
    String? name,
    String? remainStat,
    String? stockAt,
    String? type,
  }) {
    return StoreDTO(
      addr: addr ?? this.addr,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      name: name ?? this.name,
      remainStat: remainStat ?? this.remainStat,
      stockAt: stockAt ?? this.stockAt,
      type: type ?? this.type,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'addr': addr,
      'code': code,
      'created_at': createdAt,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remain_stat': remainStat,
      'stock_at': stockAt,
      'type': type,
    };
  }

  static StoreDTO fromJson(Map<String, Object?> json) {
    return StoreDTO(
      addr: json['addr'] == null ? null : json['addr'] as String,
      code: json['code'] == null ? null : json['code'] as String,
      createdAt: json['created_at'] == null
          ? null
          : json['created_at'] as String,
      lat: json['lat'] == null ? null : json['lat'] as double,
      lng: json['lng'] == null ? null : json['lng'] as double,
      name: json['name'] == null ? null : json['name'] as String,
      remainStat: json['remain_stat'] == null
          ? null
          : json['remain_stat'] as String,
      stockAt: json['stock_at'] == null ? null : json['stock_at'] as String,
      type: json['type'] == null ? null : json['type'] as String,
    );
  }

  @override
  String toString() {
    return '''Store_DTO(
                addr:$addr,
code:$code,
createdAt:$createdAt,
lat:$lat,
lng:$lng,
name:$name,
remainStat:$remainStat,
stockAt:$stockAt,
type:$type
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is StoreDTO &&
        other.runtimeType == runtimeType &&
        other.addr == addr &&
        other.code == code &&
        other.createdAt == createdAt &&
        other.lat == lat &&
        other.lng == lng &&
        other.name == name &&
        other.remainStat == remainStat &&
        other.stockAt == stockAt &&
        other.type == type;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      addr,
      code,
      createdAt,
      lat,
      lng,
      name,
      remainStat,
      stockAt,
      type,
    );
  }
}
