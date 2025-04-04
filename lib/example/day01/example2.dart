void main() {
  // p.67
  // 레코드 (Dart3 부터 추가된 타입)
  // 튜플 = 값의 묶음 = 집합
  // 익명 : 레코드에 속한 값들은 꼭 'key' 가질 필요 없음

  // 1. 레코드 생성하는 방법1
  var record = ('first', a : 2, b : true, 'last');

  // 2. 레코드 생성하는 방법2
  (String, int) record2;
  record2 = ('유재석', 40);
  print(record2);

  // 3. 레코드의 값 호출
  print(record.$1); // key 가 존재하지 않은 첫번째 value
  print(record.a); // 'a' key 값 반환
  print(record.b); // 'b' key 값 반환
  print(record.$2); // key 가 존재하지 않은 두번째 value


  // 4. json 형식
  var json = {'name' : 'Dash', 'age' : 10, 'color' : 'green'};
  print(json);
}