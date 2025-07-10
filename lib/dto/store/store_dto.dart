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

  factory StoreDto.fromJson(Map<String, dynamic> json) => StoreDto(
    addr: json['addr'] as String?,
    code: json['code'] as String?,
    createdAt: json['created_at'] as String?,
    lat: (json['lat'] as num?)?.toDouble(),
    lng: (json['lng'] as num?)?.toDouble(),
    name: json['name'] as String?,
    remainStat: json['remain_stat'] as String?,
    stockAt: json['stock_at'] as String?,
    type: json['type'] as String?,
  );

  Map<String, dynamic> toJson() => {
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
