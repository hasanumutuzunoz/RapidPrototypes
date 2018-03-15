  PVector screenCenter =  new PVector (0,0);
  PVector selectMenuCenter =  new PVector (0,0);
  PVector antCenter =  new PVector (0,0);
  
  PVector p0SelectMenu;
  PVector p1SelectMenu;
  PVector p2SelectMenu;
  PVector p3SelectMenu;
  
  boolean isMovingDown = false;
  boolean isPath1Draw = false;
  boolean isPath2Draw = false;
  boolean isPath3Draw = false;
  boolean isPath4Draw = false;
  
  PVector p0;
  PVector p1;
  PVector p2;
  PVector p3;
  PVector p4;
  PVector p5;
  PVector p6;
  PVector p7;
  PVector p8;
  PVector p9;
  PVector p10;
  PVector p11;
  
  PVector antVelocity = new PVector (0,1);

void setup () {
  screenCenter.x = width/2;
  screenCenter.y = height/2;
  selectMenuCenter.x = width/2;
  selectMenuCenter.y = height/2 + 66;
  antCenter.x = width/2;
  antCenter.y = width/2;
  size (800,800);
  smooth(4);
}

void draw () {
  renderSetup ();
  renderAnt();
  renderSelectMenu();
  renderMap();
  drawPath();
  updateAnt();
}

void renderSetup () {
  fill(255,255,255);
  stroke(255,255,255);
  background(0,0,0);
}


void renderMap() {
  //Draw Ground
  PVector p0Ground = new PVector (-400, -150);
  PVector p1Ground = new PVector (400, -150);
  p0Ground.add(screenCenter);
  p1Ground.add(screenCenter);
  line(p0Ground.x,p0Ground.y, p1Ground.x, p1Ground.y);
}

void renderAnt() {
  PVector p0 = new PVector (-20, -152);
  PVector p1 = new PVector (20, -152);
  PVector p2 = new PVector (20,-178);
  PVector p3 = new PVector (-20,-178);
  
  p0.add(antCenter);
  p1.add(antCenter);
  p2.add(antCenter);
  p3.add(antCenter);
  
  line(p0.x,p0.y, p1.x, p1.y);
  line(p1.x,p1.y, p2.x, p2.y);
  line(p2.x,p2.y, p3.x, p3.y);
  line(p3.x,p3.y, p0.x, p0.y);
}

void updateAnt(){
  if (isMovingDown)
  {
    antCenter.add(antVelocity);
    
    if (antCenter.y == 480 && isPath2Draw == false)
        isMovingDown = false;
    
    if (antCenter.y == 560 && isPath3Draw == false)
    isMovingDown = false;
  }
}

void renderSelectMenu() {
  
  p0SelectMenu = new PVector (-40, -136);
  p1SelectMenu = new PVector (40, -136);
  p2SelectMenu = new PVector (40,-216);
  p3SelectMenu = new PVector (-40,-216); 
  
  p0SelectMenu.add(selectMenuCenter);
  p1SelectMenu.add(selectMenuCenter);
  p2SelectMenu.add(selectMenuCenter);
  p3SelectMenu.add(selectMenuCenter);
  
  line(p0SelectMenu.x,p0SelectMenu.y, p1SelectMenu.x, p1SelectMenu.y);
  line(p1SelectMenu.x,p1SelectMenu.y, p2SelectMenu.x, p2SelectMenu.y);
  line(p2SelectMenu.x,p2SelectMenu.y, p3SelectMenu.x, p3SelectMenu.y);
  line(p3SelectMenu.x,p3SelectMenu.y, p0SelectMenu.x, p0SelectMenu.y);
  print (antCenter.y);
}

void drawPath(){
  if (isPath1Draw){
  line(p0.x,p0.y, p1.x, p1.y);
  line(p2.x,p2.y, p3.x, p3.y);
  }
  
  if (isPath2Draw){
  line(p4.x,p4.y, p5.x, p5.y);
  line(p6.x,p6.y, p7.x, p7.y);
  }
  
  if (isPath3Draw){
  line(p8.x,p8.y, p9.x, p9.y);
  line(p10.x,p10.y, p11.x, p11.y);
  }
  
  //selectMenuCenter.x
}

void setPathPoint(){
  isMovingDown = true;
  if (selectMenuCenter.y == 466)
  {
    isPath1Draw = true;
    p0 = p1SelectMenu;
    p1 = p2SelectMenu;
    p2 = p3SelectMenu;
    p3 = p0SelectMenu;
    
    if (antCenter.y == 400)
      isMovingDown = true;
  }
  
  if (selectMenuCenter.y == 546)
  {
    isPath2Draw = true;
    p4 = p1SelectMenu;
    p5 = p2SelectMenu;
    p6 = p3SelectMenu;
    p7 = p0SelectMenu;
  }
  
  if (selectMenuCenter.y == 626)
  {
    isPath3Draw = true;
    p8 = p1SelectMenu;
    p9 = p2SelectMenu;
    p10 = p3SelectMenu;
    p11 = p0SelectMenu;
  }
}

void keyPressed () { 
  if (keyCode == ENTER) {
    setPathPoint();
  }
    
    else if (key == 's') {
      //if (selectMenuCenter.y > 220)
       selectMenuCenter.y += 80; //400
    }
      
      else if (key == 'w') {
        //if (selectMenuCenter.y < 400)
        selectMenuCenter.y -= 80;
    }
     
}