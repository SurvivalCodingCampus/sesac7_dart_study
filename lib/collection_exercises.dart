void main() {
  people.entries.forEach((person) {
    print('${person.key}의 나이는 ${person.value}살');
  });
}

Map<String, int> people = {'홍길동': 20, '한석봉': 25};
