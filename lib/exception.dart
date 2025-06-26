
void main() {
  // final numString = '10.5';
}

int checkNum(e) {
  final String numString = e; 

  try {
    // int num = int.parse(numString); 
    // parse 는 터질 가능성이 있어서 tryParse: parse가능할때 parse
    // nullable이 허용되서 ?? 로 처리해준다

    int num = int.tryParse(numString) ?? 0; 
    print('실행시 num: $num');
    return num;

  } catch (e) {
    int num = 0;
    print('에러시 num: $num');
    return num; 
  }
}
 