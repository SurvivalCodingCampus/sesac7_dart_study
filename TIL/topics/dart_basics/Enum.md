## Enum(열거형)
---
### 미리 정해놓은 값들에 대한 집합
- enum keyword를 사용해서 작성하고 스코프 내부에는 값을 작성한다.
	```dart
	enum DayType {
		monday,
		tuesday,
		wednesday,
		thursday,
		friday,
		saturday,
		sunday
	}
	```
- 어떠한 여러 옵션을 가지는 값에 대한 범위를 지정해 놓을 수 있다.
- enum을 사용해서 휴먼에러를 방지할 수 있다.
- switch문이랑 함께 사용하면 모든 처리를 강제로 구현하게 할 수 있다.
	```dart
	enum DayType {
		monday,
		tuesday,
		wednesday,
		thursday,
		friday,
		saturday,
		sunday
	}
	void main() {
		DayType dayType = DayType.friday;  
		switch(dayType) {  
		  case DayType.monday:   
		    print('monday');  
		    break;  
		  case DayType.tuesday:  
		    print('tuesday');  
		    break;  
		  case DayType.wednesday:  
		    print('wednesday');  
		    break;  
		  case DayType.thursday:  
		    print('thursday');  
		    break;  
		  case DayType.friday:  
		    print('friday');  
		    break;  
		  case DayType.saturday:  
		    print('saturday');  
		    break;  
		  case DayType.sunday:  
		    print('sunday');  
		    break;  
		}
	}	
	```