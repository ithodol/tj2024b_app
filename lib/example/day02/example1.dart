void main(){
  // p.70 ~ p.73 연산자

  // +
  // (숫자) 덧셈, (문자열) 병합
  int a = 2;
  int b = 1;
  print(a+b); // 3

  String firstName = 'JeonJoo';
  String lastName = 'Lee';
  String fullName = lastName + firstName;
  // 'Lee JeonJoo'

  // -
  // 뺄셈
  int a2 = 2;
  int b2= 1;
  print(a-b); // 1

  // -표현식
  // 부호를 뒤집음, 양수인 경우 음수, 음수인 경우 양수가 됨
  int a3 = 2;
  print(-a3); // -2

  // *
  // 곱셈, 문자열에 자연수 n을 곱하는 경우, 해당 문자열을 n번 반복
  int a4 = 6;
  int b4 = 3;
  print(a4 * b4); // 18

  print('*' * 5); // '*****'

  // /
  // 나눗셈, 정수끼리 나눗셈도 결과를 실수가 됨
  int a5 = 10;
  int b5 = 4;
  print(a5 / b5); // 2.5

  // ~/
  // 결과가 정수인 나눗셈(나눗셈의 몫), 따라서 정수끼리의 나눗셈의 결과는 정수가 됨
  int a6 = 10;
  int b6 = 4;
  print(a5 ~/ b5); // 2

  // %
  // 나눗셈의 나머지, 모듈로 연산이라고도 함
  int a7 = 10;
  int b7 = 4;
  print(a7 % b7); // 2

  // ++ 변수
  // 변수에 1을 더함, 연산자가 앞에 있으므로 '선반영' 되는 것
  int a8 = 0;
  print(++a8); // 1
  print(a8); // 1

  // 변수 ++
  // 변수에 1을 더함 , 연산자가 앞에 있으므로 '후반영' 되는 것
  int a9 = 0;
  print(a9++); // 0
  print(a9); // 1


  // -- 변수
  int b10 = 1;
  print(b10--); // 0
  print(b10); // 0


  // 변수 --
  // 변수에 1을 뺌, 표현식의 값은 그대로
  int b11 = 1;
  print(b11--); // 1
  print(b11); // 0


  // ==
  // 두 값이 같은지 비교
  // = 연산자와는 의미가 다르니 주의, 두 값이 같은 경우  true
  int a12 = 2;
  int b12 = 1;
  print(a12 == b12); // false

  // !=
  // 두 값이 다른지 비교, 두 값이 다른 경우 true
  int a13 = 2;
  int b13 = 1;
  print(a13 != b13); // true

  // >
  // 한 값이 다른 값보다 큰지 비교, 왼쪽에 위치한 값이 클 경우 true
  int a14 = 2;
  int b14 = 1;
  print(a14 > b14); // true

  // <
  // 한 값이 다른 값보다 작은지 비교, 왼쪽에 위치한 값이 작을 경우 true
  int a15 = 2;
  int b15 = 1;
  print(a15 < b15); // false

  // >=
  // 한 값이 다른 값보다 크거나 같은지 비교, 왼쪽에 위치한 값이 크거나 같을 경우 true
  int a16 = 2;
  int b16 = 1;
  print(a16 >= b16); // true

  // <=
  // 한 값이 다른 값보다 작너나 같은지 비교, 왼쪽에 위치한 값이 작거나 같을 경우 true
  int a17 = 2;
  int b17 = 1;
  print(a17 <= b17); // true

  // =
  // 변수에 특정한 값을 할당 또는 재할당
  // const , final 로 선언된 변수의 경우, 값의 재할당 불가
  int a18 = 1; // 할당
  print(a18); // 1
  a18 = 2; // 재할당
  print(a18); // 2



  // +=, -=, *= 등
  // 변수에 사칙연산 이후 재할당
  a *= 3; // a = a * 3


  // ! 표현식
  // 표현식의 결과를 뒤집음
  int a19 = 2;
  int b19 = 1;
  bool result = a19 > b19; // ture
  print(result); // false

  // ||
  // 여러개의 표현식을 or 조건으로 이어줌
  // 여러개의 표현식 중 하나의 표현식만 true 여도 true
  int a20 = 3;
  int b20 = 2;
  int c20 = 1;
  print(a20 > b20); // ture
  print(b20 < c20); // false
  print(a20 > b20 || b20 < c20); // true


  // &&
  // 여러개의 표현식을 and 조건으로 이어줌
  // 여러개의 표현식 모두가 true 여야만 true
  int a21 = 3;
  int b21 = 2;
  int c21 = 1;
  print(a21 > b21); // ture
  print(b21 < c21); // false
  print(a21 > b21 && b21 < c21); // false

























}