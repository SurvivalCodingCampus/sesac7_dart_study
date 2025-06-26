import 'dart:convert';

class User{
  final String name;
  final String email;

  User({required this.name, required this.email});

  Map<String, dynamic> toJason() {
    return {'name': name, 'email': email};
  }
  User.fromUser(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];
}
void main(){
  User user = User(name: '홍', email: 'aaa@abc.com');
  print(user.toJason());
  String json = jsonEncode(user.toJason());
  print(json);
}