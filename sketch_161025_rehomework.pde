//20121202 안우리
//20161025
float rw = 30, rh = 30; //원의 너비와 높이

void setup(){
  size(800, 800);
  smooth(); 
}

void draw(){
  background(0);
  //배경 물방울 그리기
  for(int j = 0; j < 20; j++){  
    for(int i = 0; i < 10; i++){
      pushMatrix();
        MyColor mc = new MyColor(0);
        fill(mc.c, 225/(i+1));    
        translate(100*i, 100*j);
        rotate(radians(90));
        beginShape();
        vertex(0, 0);
        bezierVertex(50, -50, 50, 50, 0, 0);
        endShape();  
      popMatrix();
    }
  }
  //꽃 객체사용하기  f_draw매개변수는 차례대로 꽃잎크기, 꽃크기
  //배경의 꽃  패턴
  for(int j =0; j < 5; j++){
    for(int i = 0; i < 10; i++){
      pushMatrix();
      translate(200*j, 200*i);
      //색지정
      MyColor mc = new MyColor(1);
      fill(mc.c);
      Flower f1 = new Flower();
      f1.f_draw(2, 0.2*i);     
      popMatrix();    
    }//for i
 }//for j
 
 //가운데 꽃 생성(꽃 두개로)
  pushMatrix();
  translate(width/2, height/2);
  MyColor mc2 = new MyColor(2);
  fill(mc2.c);
  Flower f = new Flower(); //꽃 생성
  f.f_draw(2,1.0);
  
  MyColor mc3 = new MyColor(2);
  fill(mc3.c, 100);
  Flower f2 = new Flower(); //꽃 생성
  f2.f_draw(2,2.0);
  popMatrix();
}//draw();

//꽃 클래스
class Flower{
  float x;
  float y;
  float s;//크기
  Flower(){//초기화
    x = 0.0;
    y = 0.0;
    s = 0.0;
  }
  void f_draw(int num, float size){ //차례대로 색깔, 꽃잎크기, 꽃크기
      for (int j = 50; j > 0; j-=10) {
      for (int i = 0; i < 360; i+=18) {
        x = sin(radians(i+j));
        y = cos(radians(i+j));
        s = j*size; //크기
        noStroke();
        //꽃잎모양
        pushMatrix();
          translate(x*j, y*j);
          rotate(radians(-i-j+90));
          beginShape();
          vertex(0, 0);
          bezierVertex(s, -s/num, s, s/num, 0, 0);
          endShape();
        popMatrix();
      }//안쪽 반복문
    }//바깥쪽 반복문//꽃 끝  
  }
}


//색깔 변경 위함
class MyColor{
    color c;
    
    MyColor(int colorSet){ //생성자
      //int colorSet  = (int)random(0, 4); //0이상 4미만(4는 미포함)
      switch(colorSet){
        case 0: 
                  c = color(#05CDE5); //스카이민트
                  break;
        case 1: 
                  c = color(#FFB803);//오렌지옐로우
                  break;
        case 2:
                  c = color(#FF035B);//핑크레드
                  break;
        case 3:
                   c = color(#FFFFFF);//흰
                  break;    
      }//switch()문
    }//생성자끝
  }