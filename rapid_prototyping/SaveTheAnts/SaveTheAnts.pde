PVector screenCenter =  new PVector (0,0);
PVector selectMenuCenter =  new PVector (0,0);
boolean collectAnt1 = false;
boolean collectAnt2 = false;
boolean collectAnt3 = false;
boolean isAntsHome = false;

void setup () {
  screenCenter.x = width/2;
  screenCenter.y = height/2;
  selectMenuCenter.x = width/2;
  selectMenuCenter.y = height/2;
  size (800,800);
  smooth(4);
}

void draw () {
  renderSetup ();
  renderAnts();
  renderSelectMenu();
  renderMap();
  renderDirections ();
}

void renderSetup () {
  fill(255,255,255);
  stroke(255,255,255);
  background(0,0,0);
}

void renderDirections () {
  text("Down : 'S' ", 40,50);
  text("Up : 'W' ", 40,40);
  text("Select : 'Enter' ", 40,30);
  text("COLLECT ALL THE ANTS AND BRING THEM TO HOME", 10,150);
}

void renderAnts(){
  if (!collectAnt1) {
    renderAnt1();
  }
  
  if (!collectAnt2) {
    renderAnt2();
  }
  
  if (!collectAnt3) {
    renderAnt3();
  }
  
  if (isAntsHome) {
    renderAntsAtHome();
  }
}

void renderMap() {
  //Draw Path
  PVector p0Ant1 = new PVector (-60, 400);
  PVector p1Ant1 = new PVector (60, 400);
  PVector p2Ant1 = new PVector (60,-300);
  PVector p3Ant1 = new PVector (-60,-300);
  
  p0Ant1.add(screenCenter);
  p1Ant1.add(screenCenter);
  p2Ant1.add(screenCenter);
  p3Ant1.add(screenCenter);
  
  line(p0Ant1.x,p0Ant1.y, p1Ant1.x, p1Ant1.y);
  line(p1Ant1.x,p1Ant1.y, p2Ant1.x, p2Ant1.y);
  line(p2Ant1.x,p2Ant1.y, p3Ant1.x, p3Ant1.y);
  line(p3Ant1.x,p3Ant1.y, p0Ant1.x, p0Ant1.y);
  
   
  
  //Draw Home
  PVector p0Home = new PVector (-200, -400);
  PVector p1Home = new PVector (200, -400);
  PVector p2Home = new PVector (200, -300);
  PVector p3Home = new PVector (-200, -300);
  
  p0Home.add(screenCenter);
  p1Home.add(screenCenter);
  p2Home.add(screenCenter);
  p3Home.add(screenCenter);
  
  line(p0Home.x,p0Home.y, p1Home.x, p1Home.y);
  line(p1Home.x,p1Home.y, p2Home.x, p2Home.y);
  line(p2Home.x,p2Home.y, p3Home.x, p3Home.y);
  line(p3Home.x,p3Home.y, p0Home.x, p0Home.y);
  text("HOME", screenCenter.x - 15, screenCenter.y - 350);
  
}

void renderAnt1() {
  PVector p0 = new PVector (-20, -152);
  PVector p1 = new PVector (20, -152);
  PVector p2 = new PVector (20,-178);
  PVector p3 = new PVector (-20,-178);
  
  p0.add(screenCenter);
  p1.add(screenCenter);
  p2.add(screenCenter);
  p3.add(screenCenter);
  
  line(p0.x,p0.y, p1.x, p1.y);
  line(p1.x,p1.y, p2.x, p2.y);
  line(p2.x,p2.y, p3.x, p3.y);
  line(p3.x,p3.y, p0.x, p0.y);
  
  text("ANT 1", screenCenter.x - 15, screenCenter.y - 160);
}

void renderAnt2() {
  PVector p0 = new PVector (-20, 152);
  PVector p1 = new PVector (20, 152);
  PVector p2 = new PVector (20,178);
  PVector p3 = new PVector (-20,178);
  
  p0.add(screenCenter);
  p1.add(screenCenter);
  p2.add(screenCenter);
  p3.add(screenCenter);
  
  line(p0.x,p0.y, p1.x, p1.y);
  line(p1.x,p1.y, p2.x, p2.y);
  line(p2.x,p2.y, p3.x, p3.y);
  line(p3.x,p3.y, p0.x, p0.y);
  text("ANT 3", screenCenter.x - 15, screenCenter.y + 170);
  
}

void renderAnt3() {
  PVector p0 = new PVector (-20, 72);
  PVector p1 = new PVector (20, 72);
  PVector p2 = new PVector (20,98);
  PVector p3 = new PVector (-20,98);
  
  p0.add(screenCenter);
  p1.add(screenCenter);
  p2.add(screenCenter);
  p3.add(screenCenter);
  
  line(p0.x,p0.y, p1.x, p1.y);
  line(p1.x,p1.y, p2.x, p2.y);
  line(p2.x,p2.y, p3.x, p3.y);
  line(p3.x,p3.y, p0.x, p0.y);
  text("ANT 2", screenCenter.x - 15, screenCenter.y + 90);
  
}

void renderSelectMenu() {
  
  PVector p0SelectMenu = new PVector (-40, 380);
  PVector p1SelectMenu = new PVector (40, 380);
  PVector p2SelectMenu = new PVector (40,300);
  PVector p3SelectMenu = new PVector (-40,300); 
  
  p0SelectMenu.add(selectMenuCenter);
  p1SelectMenu.add(selectMenuCenter);
  p2SelectMenu.add(selectMenuCenter);
  p3SelectMenu.add(selectMenuCenter);
  
  line(p0SelectMenu.x,p0SelectMenu.y, p1SelectMenu.x, p1SelectMenu.y);
  line(p1SelectMenu.x,p1SelectMenu.y, p2SelectMenu.x, p2SelectMenu.y);
  line(p2SelectMenu.x,p2SelectMenu.y, p3SelectMenu.x, p3SelectMenu.y);
  line(p3SelectMenu.x,p3SelectMenu.y, p0SelectMenu.x, p0SelectMenu.y);
  print (selectMenuCenter.y);
  
  text("PLAYER", selectMenuCenter.x - 20, selectMenuCenter.y + 300);
}

void renderAntsAtHome() {
  text("All Ants Home! Congratulations!", screenCenter.x - 80, screenCenter.y - 325);
}

void collectAnt(){
  if (selectMenuCenter.y == 240) {
    collectAnt2 = true;
  }
  
  if (selectMenuCenter.y == 160) {
    collectAnt3 = true;
  }
  
  if (selectMenuCenter.y == -80) {
    collectAnt1 = true;
  }
  
  if (selectMenuCenter.y == -320) {
    //renderAntsAtHome();
    isAntsHome = true;
  } 
}

void keyPressed () { 
  if (keyCode == ENTER) {
    collectAnt();
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