void main(){
  // p.73 ~ p.84

  // 조건문
  int number = 31;
  if(number % 2 == 1){
    print('홀수');
  }else{
    print('짝수');
  }

  String light = 'red';
  if(light == 'green'){
    print('초록불');
  }else if(light == 'yellow'){
    print('노란불');
  }else if(light == 'red'){
    print('빨간불');
  }else{
    print('잘못된 신호입니다');
  }

  String light2 = 'purple';
  if(light2 == 'green'){
    print('초록불');
  }else if(light2 == 'yellow'){
    print('노란불');
  }else if(light2 == 'red'){
    print('빨간불');
  }

  // 반복문
  for(int i = 0; i < 100; i ++){
    print(i + 1);
  }


  List<String> subjects = ['자료구조', '이산수학', '알고리즘', '플러터'];
  for(String subject in subjects){
    print(subject);
  }


  int i = 0;
  while (i < 100){
    print(i + 1);
    i = i + 1;
  }


  int i2 = 0;
  while(true){
    print(i2 + 1);
    i2 = i2 + 1;
    break;
  }


  int i3 = 0;
  while (true){
    print(i3 + 1);
    i3 = i3 + 1;
    if(i3 == 100){
      break;
    }
  }



  for(int i = 0; i < 100; i++){
    if( i % 2 == 0){
      continue;
    }
    print(i+1);
  }

  // 함수
  int add(int a, int b){
    return a + b;
  }

  int number2 = add(1,2);
  print(number2);



  switch(number2){
    case 1:
      print('one');
  }

  const a2 = 'a';
  const b2 = 'b';
  const obj = [a2, b2];
  switch(obj){
    case [a2, b2] :
      print('$a2, $b2');
  }


  const obj1 = 1;
  const first = 1;
  const last = 4;
  switch(obj1){
    case 1 :
      print('one');
    case >= first && <= last :
      print('in range');
    case(var a3, var b3) :
      print('a3 = $a3, b3 = $b3');

    default:
  }
}