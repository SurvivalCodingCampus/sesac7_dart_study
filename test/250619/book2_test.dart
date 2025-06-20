import 'dart:math';
import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/250619/book2.dart';
import 'package:test/test.dart';

void main() {
  for (int i = 0; i < 10; i++) {
    test('제목과 출간일이 같으면 같은 책으로 판단한다', () {
      final title = generateRandomBookTitle();

      final book1 = Book2(
        publishDate: DateTime.now(),
        comment: generateRandomBookComment(),
        title: title,
      );

      final book2 = Book2(
        publishDate: DateTime.now(),
        comment: generateRandomBookComment(),
        title: title,
      );

      final book3 = Book2(
        publishDate: DateTime.now(),
        comment: generateRandomBookComment(),
        title: generateRandomBookTitle(),
      );

      print(
        'book1: ${book1.title}, ${book1.publishDate.toString().substring(0, 10)}',
      );
      print(
        'book2: ${book2.title}, ${book2.publishDate.toString().substring(0, 10)}',
      );
      print(
        'book3: ${book3.title}, ${book3.publishDate.toString().substring(0, 10)}',
      );

      expect(true, book1 == book2);
      expect(false, book1 == book3);
    });
  }

  for (int i = 0; i < 10; i++) {
    test('Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다', () {
      final List<Book2> bookList = [];

      final startDate = DateTime(2025, 1, 1);
      final endDate = DateTime.now();

      for (int i = 0; i < 100; i++) {
        final randomDate = randomDateByDay(startDate, endDate);
        bookList.add(
          Book2(
            comment: generateRandomBookComment(),
            title: generateRandomBookTitle(),
            publishDate: randomDate,
          ),
        );
      }

      //정렬
      //bookList.sort((a, b) => a.compareTo(b));
      final sortedBookList = bookList.sorted((a, b) => a.compareTo(b));

      for (int i = 1; i < sortedBookList.length; i++) {
        expect(
          sortedBookList[i - 1].publishDate.compareTo(
            sortedBookList[i].publishDate,
          ),
          isNonPositive,
        );
      }
    });
  }

  for (int i = 0; i < 10; i++) {
    test('copyWith() 메서드를 제공한다 (깊은 복사)', () {
      final book = Book2(
        comment: generateRandomBookComment(),
        title: generateRandomBookTitle(),
        publishDate: DateTime.now(),
      );

      final copyBook = book.copyWith();

      expect(book.comment, copyBook.comment);
      expect(book.title, copyBook.title);
      expect(book.publishDate, copyBook.publishDate);
      expect(false, identical(book.publishDate, copyBook.publishDate));
    });
  }
}

/* void main() {
  final List<Book2> bookList = [];

  final startDate = DateTime(2020, 1, 1);
  final endDate = DateTime.now();

  for (int i = 0; i < 100; i++) {
    final randomDate = randomDateByDay(startDate, endDate);
    bookList.add(
      Book2(
        comment: generateRandomBookComment(),
        title: generateRandomBookTitle(),
        publishDate: randomDate,
      ),
    );
  }

  //정렬
  //bookList.sort((a, b) => a.compareTo(b));
  final sortedBookList = bookList.sorted((a, b) => a.compareTo(b));

  //리스트 복사
  final copyList = <Book2>[];
  for (var book in sortedBookList) {
    copyList.add(book.copyWith());
  }

  //두 리스트의 내용과 순서가 동일한지 체크
  final listEquality = ListEquality();
  print(
    'bookList와 copyList 순서와 내용 같다: ${listEquality.equals(bookList, copyList)}',
  );
  print(
    'sortedBookList와 copyList 순서와 내용 같다: ${listEquality.equals(sortedBookList, copyList)}',
  );

  //두 리스트의 내용이 동일한지 체크
  final unorderedEquality = UnorderedIterableEquality();
  print(
    'bookList와 copyList 내용 같다: ${unorderedEquality.equals(bookList, copyList)}',
  );
  print(
    'sortedBookList와 copyList 내용 같다: ${unorderedEquality.equals(sortedBookList, copyList)}',
  );

  //출력
  for (int i = 0; i < sortedBookList.length; i++) {
    print({
      (sortedBookList[i].title),
      (sortedBookList[i].publishDate),
      (sortedBookList[i].comment),
    });
    print({
      (copyList[i].title),
      (copyList[i].publishDate),
      (copyList[i].comment),
    });
  }
}
 */
/// 랜덤한 짧은 책 코멘트를 생성합니다.
String generateRandomBookComment() {
  final random = Random();

  final comments = [
    // 긍정적 & 감성적
    '마지막 장을 넘기기 아쉬웠어요.',
    '깊은 감동과 여운을 남기는 작품입니다.',
    '밤새워 단숨에 읽어버렸습니다. 인생 책 등극!',
    '가슴이 따뜻해지는 이야기네요.',
    '오랜만에 만난, 보석 같은 책입니다.',

    // 생각할 거리 & 통찰
    '세상을 보는 새로운 시각을 열어줍니다.',
    '작가의 통찰력에 여러 번 감탄했습니다.',
    '두고두고 다시 읽고 싶은 책이에요.',
    '많은 질문을 던지는, 생각할 거리가 많은 책입니다.',

    // 간결한 칭찬
    '흡입력이 정말 대단해요. 시간 가는 줄 몰랐네요.',
    '기대 이상으로 재미있습니다. 강력 추천!',
    '독자에게 큰 울림을 주는 필독서입니다.',
    '누구나 좋아할 만한 이야기.',

    // 약간의 비평 & 복합적
    '조금 어렵지만, 다 읽고 나면 뿌듯함을 느낄 수 있어요.',
    '호불호가 갈릴 수 있는 독특한 스타일의 글입니다.',
    '초반 진입장벽이 있지만, 후반부의 감동이 엄청납니다.',
    '결말이 조금 아쉽지만, 과정은 훌륭했습니다.',
  ];

  // 전체 코멘트 리스트에서 랜덤한 인덱스를 선택하여 반환
  return comments[random.nextInt(comments.length)];
}

DateTime randomDateByDay(DateTime start, DateTime end) {
  // 1. 시작 날짜와 끝 날짜의 차이를 계산하여 Duration 객체를 얻습니다.
  final difference = end.difference(start);

  // 2. 두 날짜 사이의 총 일수(day)를 구합니다.
  final daysInRange = difference.inDays;

  // 만약 시작 날짜가 끝 날짜보다 뒤에 있다면 시작 날짜를 그대로 반환합니다.
  if (daysInRange < 0) {
    return start;
  }

  // 3. 0부터 총 일수 사이의 랜덤한 숫자를 선택합니다.
  //    end.difference(start)는 마지막 날짜를 포함하지 않으므로,
  //    마지막 날짜까지 범위에 포함시키기 위해 nextInt의 인자에 +1을 해줍니다.
  //    예: 1월 3일 - 1월 1일 = 2일. 0, 1, 2일 중 랜덤값을 뽑으려면 nextInt(3)이 필요.
  final random = Random();
  final randomDays = random.nextInt(daysInRange + 1);

  // 4. 시작 날짜에 위에서 뽑은 랜덤한 일수를 더하여 최종 날짜를 계산합니다.
  return start.add(Duration(days: randomDays));
}

/// 리스트에서 랜덤한 요소를 하나 선택하여 반환하는 헬퍼 함수
String _pickRandom(List<String> list, Random random) {
  return list[random.nextInt(list.length)];
}

/// 랜덤한 짧은 책 제목을 생성합니다.
String generateRandomBookTitle() {
  final random = Random();

  // 제목을 구성할 단어 목록
  // 이 목록을 수정하거나 확장하여 결과물을 다양하게 만들 수 있습니다.
  final adjectives = [
    '고요한',
    '마지막',
    '푸른',
    '작은',
    '잊혀진',
    '영원한',
    '차가운',
    '빛나는',
    '붉은',
    '보이지 않는',
  ];
  final nouns = [
    '바다',
    '숲',
    '도시',
    '그림자',
    '기억',
    '약속',
    '거울',
    '열쇠',
    '여행자',
    '노래',
    '새벽',
    '비',
    '꿈',
  ];
  final prefixes = ['시간의', '꿈의', '새벽의', '경계의', '심연의', '하늘의', '바람의'];

  // 생성할 제목의 패턴을 랜덤하게 선택 (0, 1, 2 중 하나)
  final pattern = random.nextInt(3);

  switch (pattern) {
    case 0:
      // 패턴 1: [수식어] + [명사] (예: 고요한 바다)
      final adjective = _pickRandom(adjectives, random);
      final noun = _pickRandom(nouns, random);
      return '$adjective $noun';

    case 1:
      // 패턴 2: [명사]의 + [명사] (예: 시간의 경계)
      final prefix = _pickRandom(prefixes, random);
      final noun = _pickRandom(nouns, random);
      return '$prefix $noun';

    case 2:
      // 패턴 3: [수식어] + [명사]의 [명사] (예: 잊혀진 도시의 노래)
      final adjective = _pickRandom(adjectives, random);
      final noun1 = _pickRandom(nouns, random);
      final noun2 = _pickRandom(nouns, random);
      // 두 명사가 같지 않도록 처리
      if (noun1 == noun2) {
        return '$adjective $noun1'; // 같으면 패턴 1처럼 단순하게 만듦
      }
      return '$adjective ${noun1}의 $noun2';

    default:
      // 예외적인 경우를 위한 기본값
      return '무제';
  }
}
