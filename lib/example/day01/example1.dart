// Dart 언어
// 한줄 주석
/* 여러줄 주석 */

// 2. Dart 프로그램 진입점 함수 = main
// void main(){}

// 3. 콘솔 출력함수 = print();

// 4. 실행 : ctrl + shift + F10
void main(){
  print("Hello, world!");
  
  // p.64
  // 1. 문자열 타입
  String name = '전은서'; print(name);
  String name2 = "전은서"; print(name2);
  String name3 = "이름 : $name"; print(name3);


  // 2. 숫자 타입
  // num : int, double 상위 타입
  int year = 2023;  print(year); // 정수
  double pi = 3.14159;  print(pi); // 실수
  num year2 = 2023;
  num pi2= 3.14159;

  // 3. 불 타입
  bool darkMode = false;  print(darkMode);

  // p.65 컬렉션 List<타입> 중복 허용 vs set<타입> 중복 불가능 vs Map<타입, 타입> key-value
  List<String> fruits = ['사과', '딸기', '바나나', '샤머'];
  print(fruits); print(fruits[3]); print(fruits.length);


  Set<int> odds = {1, 3, 5, 7, 7, 9, 9};
  print(odds);

  Map<String, int> regionMap = {'서울' : 0, '인천' : 1, '대전' : 2, '부산' : 3, '대구' : 4, '광주' : 5, '울산' : 6, '세종' : 7,'세종' : 0};
  print(regionMap);
  print(regionMap['서울']);

  // p.65
  // 1. Object 모든 자료들을 Object(최상위 타입) 저장, 타입 변환 필요
  Object a = 1;
  Object b = 3.14;
  Object c = '유재석';

  // 2. dynamic 동적 타입으로 대입되는 순간 타입 결정, 타입 변환 필요 없음
  dynamic a1 = 1;
  dynamic a2 = 3.14;
  dynamic a3 = '유재석';
  dynamic a4 = ['사과'];
  dynamic a5 = {1, 3, 4};
  dynamic a6 = {'name' : '유재석', 'age' : 40};

  // 3. 타입? : null이 될 수 있는 타입 vs JAVA Optional
  String? nickname = null;
  // String? nickname = null; // Dart3 부터 타입 뒤에 '?' 붙여서 null 안정성 보장

  // var : 처음 할당된 값의 타입이 결정됨
  // dynamic : 선언된 변수는 모든 타입들이 들어올 수 있음
}