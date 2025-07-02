class Company {
  String _name;
  String _catchPhrase;
  String _bs;

  // 생성자
  Company({
    required String name,
    required String catchPhrase,
    required String bs,
  }) : _name = name,
       _catchPhrase = catchPhrase,
       _bs = bs;

  // getter
  String get name => _name;

  String get catchPhrase => _catchPhrase;

  String get bs => _bs;

  // setter
  set name(String name) {
    if (name.isEmpty) {
      throw Exception('회사 이름을 입력해야 합니다.');
    }
    _name = name;
  }

  set catchPhrase(String catchPhrase) {
    if (catchPhrase.isEmpty) {
      throw Exception('캐치프레이즈를 입력해야 합니다.');
    }
    _catchPhrase = catchPhrase;
  }

  set bs(String bs) {
    if (bs.isEmpty) {
      throw Exception('업종을 입력해야 합니다.');
    }
    _bs = bs;
  }

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'name': name.isEmpty ? 'undefined' : name,
      'catchPhrase': catchPhrase.isEmpty ? 'undefined' : catchPhrase,
      'bs': bs.isEmpty ? 'undefined' : bs,
    };
  }

  // 역직렬화
  Company.fromJson(Map<String, dynamic> json)
    : _name = json['name'].isEmpty ? 'undefined' : json['name'],
      _catchPhrase = json['catchPhrase'].isEmpty
          ? 'undefined'
          : json['catchPhrase'],
      _bs = json['bs'].isEmpty ? 'undefined' : json['bs'];

  @override
  String toString() {
    return '[name: $name, catchPhrase: $catchPhrase, bs: $bs]';
  }
}
