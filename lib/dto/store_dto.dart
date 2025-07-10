class StoreDto {
  String? addr;
  String? code;
  String? createdAt;
  double? lat;
  double? lng;
  String? name;
  String? remainStat;
  String? stockAt;
  String? type;

  StoreDto({
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

  StoreDto copyWith({
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
    return StoreDto(
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

  Map<String, dynamic> toJson() {
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

  factory StoreDto.fromJson(Map<String, dynamic> json) {
    return StoreDto(
      addr: json['addr'] as String?,
      code: json['code'] as String?,
      createdAt: json['created_at'] as String?,
      lat: json['lat'] as double?,
      lng: json['lng'] as double?,
      name: json['name'] as String?,
      remainStat: json['remain_stat'] as String?,
      stockAt: json['stock_at'] as String?,
      type: json['type'] as String?,
    );
  }

  @override
  String toString() =>
      "StoreDto(addr: $addr,code: $code,createdAt: $createdAt,lat: $lat,lng: $lng,name: $name,remainStat: $remainStat,stockAt: $stockAt,type: $type)";

  @override
  int get hashCode => Object.hash(
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreDto &&
          runtimeType == other.runtimeType &&
          addr == other.addr &&
          code == other.code &&
          createdAt == other.createdAt &&
          lat == other.lat &&
          lng == other.lng &&
          name == other.name &&
          remainStat == other.remainStat &&
          stockAt == other.stockAt &&
          type == other.type;
}
