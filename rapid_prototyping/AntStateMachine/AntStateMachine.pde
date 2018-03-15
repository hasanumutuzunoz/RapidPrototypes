  PVector screenCenter =  new PVector (0,0);
  PVector selectMenuCenter =  new PVector (0,0);
  PVector antCenter =  new PVector (0,0);
  PVector antVelocityPos = new PVector (2,0);
  PVector antVelocityNeg = new PVector (-1,0);
  //PVector antSpeed = new PVector (0.001,0);
  float playerSelect;
  boolean moveRight = true;
  
void setup () {
  screenCenter.x = width/2;
  screenCenter.y = height/2;
  selectMenuCenter.x = width/2;
  selectMenuCenter.y = height/2;
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
  renderDirections();
  //updateAnt();
  updateIsMoveToFood();
}

void updateIsMoveToFood(){
  if (playerSelect == 1)
    updateAnt();

}

void updateAnt() {
  
  if (antCenter.x == 650) {
    moveRight = false;
  }
  
  else if (antCenter.x == 0) {
    moveRight = true;
  }
  
  if (moveRight == false)
  {
    antCenter.add(antVelocityNeg);
    renderCarryFood();
  }
  else 
    antCenter.add(antVelocityPos);
  
  
}

void renderCarryFood(){
  ellipse(antCenter.x + 80, antCenter.y + 24, 10, 10);
}

void renderSetup () {
  fill(255,255,255);
  stroke(255,255,255);
  background(0,0,0);
}

void renderDirections () {
  text("Left : 'A' ", 40,50);
  text("Right : 'D' ", 40,40);
  text("Select : 'Enter' ", 40,30);
}



void renderSelectMenu() {
  PVector p0SelectMenu = new PVector (40, -160);
  PVector p1SelectMenu = new PVector (120, -160);
  PVector p2SelectMenu = new PVector (120,-240);
  PVector p3SelectMenu = new PVector (40,-240);
  
  p0SelectMenu.add(selectMenuCenter);
  p1SelectMenu.add(selectMenuCenter);
  p2SelectMenu.add(selectMenuCenter);
  p3SelectMenu.add(selectMenuCenter);
  
  line(p0SelectMenu.x,p0SelectMenu.y, p1SelectMenu.x, p1SelectMenu.y);
  line(p1SelectMenu.x,p1SelectMenu.y, p2SelectMenu.x, p2SelectMenu.y);
  line(p2SelectMenu.x,p2SelectMenu.y, p3SelectMenu.x, p3SelectMenu.y);
  line(p3SelectMenu.x,p3SelectMenu.y, p0SelectMenu.x, p0SelectMenu.y);
  
  text("Select One", screenCenter.x - 30, screenCenter.y - 250);
  text("aggro", screenCenter.x - 30, screenCenter.y - 200);
  text("gather", screenCenter.x + 60, screenCenter.y - 200);
  text("work", screenCenter.x - 120, screenCenter.y - 200);
  
}

void renderMap() {
  //Draw Ground
  PVector p0Ground = new PVector (-400, 50);
  PVector p1Ground = new PVector (400, 50);
  p0Ground.add(screenCenter);
  p1Ground.add(screenCenter);
  line(p0Ground.x,p0Ground.y, p1Ground.x, p1Ground.y);
  
  //Draw Nest
  PVector p0Nest = new PVector (-350, -100);
  PVector p1Nest = new PVector (-250, -100);
  PVector p2Nest = new PVector (-250, 50);
  PVector p3Nest = new PVector (-350, 50);
  p0Nest.add(screenCenter);
  p1Nest.add(screenCenter);
  p2Nest.add(screenCenter);
  p3Nest.add(screenCenter);
  line(p0Nest.x,p0Nest.y, p1Nest.x, p1Nest.y);
  line(p1Nest.x,p1Nest.y, p2Nest.x, p2Nest.y);
  line(p0Nest.x,p0Nest.y, p3Nest.x, p3Nest.y);
  text("NEST", screenCenter.x - 315, screenCenter.y -50 );
  
  //Draw Food
  ellipse(700, 375, 150, 150);
  text("Food", 685, 280);
}

void renderAnt() {
  PVector p0 = new PVector (60, 48);
  PVector p1 = new PVector (100, 48);
  PVector p2 = new PVector (100,30);
  PVector p3 = new PVector (60,30);
  
  p0.add(antCenter);
  p1.add(antCenter);
  p2.add(antCenter);
  p3.add(antCenter);
  
  line(p0.x,p0.y, p1.x, p1.y);
  line(p1.x,p1.y, p2.x, p2.y);
  line(p2.x,p2.y, p3.x, p3.y);
  line(p3.x,p3.y, p0.x, p0.y);
}

void setPlayerSelect() {
  if (selectMenuCenter.x == 400)
    playerSelect = 3;
    
  else if (selectMenuCenter.x == 310)
  playerSelect = 2;
    
  else if (selectMenuCenter.x == 220)
  {
  playerSelect = 1;
  
  }
}


void keyPressed () { 
  if (keyCode == ENTER) {
    setPlayerSelect();
  }
    
    else if (key == 'a') {
      if (selectMenuCenter.x > 220)
       selectMenuCenter.x -= 90;
    }
      
      else if (key == 'd') {
        if (selectMenuCenter.x < 400)
        selectMenuCenter.x += 90;
    }
     
}