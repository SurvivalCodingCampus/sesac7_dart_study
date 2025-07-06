## HTTP-Connection
---
### RestAPI를 사용해서 통신하여 원하는 데이터를 받아서 사용할 수 있다.
- Dart에서는 http, dio, retrofit 라이브러리를 사용하여 통신할 수 있는데 dart에서 제공하는 http 라이브러리를 사용하자.
- http 라이브러리를 사용하기위해서는 import 후 alias로 http를 붙여서 사용한다.
	- http 대부분 Top-level Function이기 때문이다.
	```dart
	import 'package:http/http.dart' as http;
	```
- Header나 Body가 필요없는 예제
	```dart
	import 'package:http/http.dart' as http;

	void main() async {
		final uri = Uri.parse('https://asd.asd/getTest');
		final http.Response response = await http.get(uri);
		
		if (response.statusCode == 200) {
			print(response.body);
		}
	}
	```
- Header나 Body가 필요한 방식의 예제
	```dart
	import 'package:http/http.dart' as http;

	void main() async {  
		final uri = Uri.parse('https://asd.asd/getTest');  
		final http.Response response = await http.post(
			uri, 
			headers: {'Content-Type': 'application/json; charset=UTF-8'}, 
			body: {
				'id' : 0, 
				'title' : 'testTitle'
			}  
		); 
		
		if (response.statusCode == 200) {
			print(response.body);
		}
	}
	```
