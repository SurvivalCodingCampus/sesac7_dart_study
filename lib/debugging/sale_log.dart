import 'dart:convert';

class SaleLog {
  double _price; // 가격
  DateTime? _cvtDateTime; // 판매 시간
  String? _dateTimeToString; // 판매 시간을 json 형식에 맞춰 문자열로 변환한 결과값

  // 생성자
  SaleLog({required double price, required DateTime cvtDateTime})
    : _price = price,
      _cvtDateTime = cvtDateTime {
    // 판매 시간을 초기화 한 다음 json 형식에 맞게 변환
    final List<String> dateTimeConvert = cvtDateTime
        .toLocal()
        .toString()
        .substring(0, 19)
        .split(' ');
    _dateTimeToString = '${dateTimeConvert[0]}T${dateTimeConvert[1]}';
  }

  // getter
  double get price => _price;

  DateTime? get cvtDateTime => _cvtDateTime;

  String? get dateTimeToString => _dateTimeToString;

  // setter
  set price(double price) {
    if (price < 0) {
      throw Exception('가격은 음수가 될 수 없습니다.');
    }

    _price = price;
  }

  // 직렬화
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cvtDatetime': dateTimeToString,
    };
  }

  // 역직렬화
  SaleLog.fromJson(Map<String, dynamic> json)
    : _price = json['price'],
      _dateTimeToString = json['cvtDatetime'];

  @override
  String toString() {
    return 'price: $price, cvtDatetime: $dateTimeToString';
  }
}

void main() {
  SaleLog s = SaleLog(
    price: 58.25,
    cvtDateTime: DateTime(1991, 08, 21, 10, 08, 31),
  );
  print(s.dateTimeToString);
  String a = jsonEncode(s.toJson());
  print(a);

  String test = '''{
          "price": 58.25,
          "cvtDatetime": "2023-03-26T08:00:00"
        } ''';
  Map<String, dynamic> testMap = jsonDecode(test);
  SaleLog s3 = SaleLog.fromJson(testMap);
  print(s3.toString());
}
