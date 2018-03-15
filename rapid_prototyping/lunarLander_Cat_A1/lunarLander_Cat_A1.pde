//Lunarlander - Cat idea prototype
PVector catPos = new PVector (0,0);
PVector landPos = new PVector (0,0);
PVector landVelocity = new PVector (0,0);
PVector gravity = new PVector (0,-0.001);
int rotation = 0;
float cos = 0;
float sin = 0;
PVector direction = new PVector(0, 0);
float score = 0;

void setup () {
 size (1000,1000);
 catPos.x = width/2;
 catPos.y = height/2;
 landPos.x = width/2;
 landPos.y = height/2;
 
 smooth(4);
}

void draw () {
  renderSetup ();
  renderLand(); 
  renderCat();
  updateLand();
}

 void renderLand() {
  PVector p3 = new PVector (-100, 295);
  PVector p4 = new PVector (-40, 295);
  PVector p5 = new PVector (-80,310);  
  
  //Rotating Ship Formula
  float x = p3.x*cos - p3.y*sin;
  float y = p3.x*sin + p3.y*cos;
  
  p3.x= x;
  p3.y= y;
  
  x = p4.x*cos - p4.y*sin;
  y = p4.x*sin + p4.y*cos;
  
  p4.x = x;
  p4.y = y;
  
  x = p5.x*cos - p5.y*sin;
  y = p5.x*sin + p5.y*cos;
  
  p5.x = x;
  p5.y = y;
  
  p3.add(landPos);
  p4.add(landPos);
  p5.add(landPos);
  
  line(p3.x,p3.y, p4.x, p4.y);
  line(p4.x,p4.y, p5.x, p5.y);
  line(p5.x,p5.y, p3.x, p3.y);
  
  if (landPos.y < 250 && landPos.y > 150 && rotation > -20 && rotation < 20 )
  {
    score += 10;
    //rotation = int (random(-50, 50));
    landPos.x = width/2;
    landPos.y = height/2;
    rotation += int (random(-100, 100));
    
  cos = cos(radians(rotation));
  sin = sin(radians(rotation));
  direction = new PVector(sin * -1, cos).normalize();
  } 
  
  text("SCORE : "+ nf(score,2,4), 40,140);
  text("Rotate Left : 'A' ", 40,50);
  text("Rotate Right : 'D' ", 40,40);
  //print(rotation);
   }
 
void renderCat () {
  PVector lowerLeftHead = new PVector (-10, 0);
  PVector lowerCenterHead = new PVector (0, 0);
  PVector lowerRightHead = new PVector (10, 0);
  PVector upperLeftHead = new PVector (-10, -20);
  PVector upperCenterHead = new PVector (0, -20);
  PVector upperRightHead = new PVector (10, -20);
  PVector centerLeftHead = new PVector (-10, -10);
  PVector rightTopEar = new PVector (5, -30);
  PVector leftTopEar = new PVector (-5, -30);
  
  PVector lowerLeftChest = new PVector (-40, 10);
  PVector lowerRightChest = new PVector (0, 10);
  PVector upperLeftChest = new PVector (-40, -10);
  PVector upperRightChest = new PVector (0, -10);
  PVector tailHead = new PVector (-80, 10);
  PVector tailBegin = new PVector (-40, -9);
  PVector LowerLeftFirstLeg = new PVector (-40, 20);
  PVector LowerRightFirstLeg = new PVector (-35, 20);
  PVector LowerLeftSecondLeg = new PVector (-30, 20);
  PVector LowerRightSecondLeg = new PVector (-25, 20);
  PVector LowerLeftThirdLeg = new PVector (-15, 20);
  PVector LowerRightThirdLeg = new PVector (-10, 20);
  PVector LowerLeftFourthLeg = new PVector (-5, 20);
  PVector LowerRightFourthLeg = new PVector (0, 20);
  PVector UpperRightFirstLeg = new PVector (-35, 10);
  
  lowerLeftHead.add(catPos);
  lowerCenterHead.add(catPos);
  lowerRightHead.add(catPos);
  upperLeftHead.add(catPos);
  upperCenterHead.add(catPos);
  upperRightHead.add(catPos);
  centerLeftHead.add(catPos);
  lowerLeftChest.add(catPos);
  lowerRightChest.add(catPos);
  upperLeftChest.add(catPos);
  upperRightChest.add(catPos);
  rightTopEar.add(catPos);
  leftTopEar.add(catPos);
  tailHead.add(catPos);
  tailBegin.add(catPos);
  LowerLeftFirstLeg.add(catPos);
  LowerRightFirstLeg.add(catPos);
  LowerLeftSecondLeg.add(catPos);
  LowerRightSecondLeg.add(catPos);
  LowerLeftThirdLeg.add(catPos);
  LowerRightThirdLeg.add(catPos);
  LowerLeftFourthLeg.add(catPos);
  LowerRightFourthLeg.add(catPos);
  UpperRightFirstLeg.add(catPos);
  
  line(lowerLeftChest.x,lowerLeftChest.y,lowerRightChest.x, lowerRightChest.y);
  line(lowerRightChest.x,lowerRightChest.y, lowerCenterHead.x, lowerCenterHead.y);
  line(lowerLeftHead.x,lowerLeftHead.y, lowerRightHead.x, lowerRightHead.y);
  line(lowerRightHead.x,lowerRightHead.y, upperRightHead.x, upperRightHead.y);
  line(upperRightHead.x,upperRightHead.y, upperLeftHead.x, upperLeftHead.y);
  line(upperRightHead.x,upperRightHead.y, rightTopEar.x, rightTopEar.y);
  line(rightTopEar.x,rightTopEar.y, upperCenterHead.x, upperCenterHead.y);
  line(upperCenterHead.x,upperCenterHead.y, leftTopEar.x, leftTopEar.y);
  line(leftTopEar.x,leftTopEar.y, upperLeftHead.x, upperLeftHead.y);
  line(upperLeftHead.x,upperLeftHead.y, lowerLeftHead.x, lowerLeftHead.y);
  
  line(centerLeftHead.x,centerLeftHead.y, upperLeftChest.x, upperLeftChest.y);
  line(upperLeftChest.x,upperLeftChest.y, tailHead.x, tailHead.y);
  line(tailHead.x,tailHead.y, tailBegin.x, tailBegin.y);
  line(upperLeftChest.x,upperLeftChest.y, lowerLeftChest.x, lowerLeftChest.y);
  
  line(lowerLeftChest.x,lowerLeftChest.y, LowerLeftFirstLeg.x, LowerLeftFirstLeg.y);
  line(LowerLeftFirstLeg.x,LowerLeftFirstLeg.y, LowerRightFirstLeg.x, LowerRightFirstLeg.y);
  line(LowerRightFirstLeg.x,LowerRightFirstLeg.y, UpperRightFirstLeg.x, UpperRightFirstLeg.y);
}

void renderSetup () {
  fill(255,255,255);
  stroke(255,255,255);
  background(0,0,0);
}

void updateLand() {
  landVelocity.add(gravity); 
  landPos.add(landVelocity);
}

void keyPressed(){
  if(key == 'a'){
    if(rotation < -360)
      rotation = 0;
     rotation -= 3;
    
    //thrust.x -= 0.001;
  }
  else if(key == 'd' ){
    if(rotation>360)
      rotation = 0;
     rotation +=3;
    //thrust.x += 0.001;
  }
  
  cos = cos(radians(rotation));
  sin = sin(radians(rotation));
  direction = new PVector(sin * -1, cos).normalize();
}