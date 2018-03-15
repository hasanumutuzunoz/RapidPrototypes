//Lunarlander - Bird Idea Prototype
int rotation = 0;
PVector birdPos =  new PVector (0,0);
float astroidPosX = int (random(400, 800)); 
float astroidPosY = int (random(0, 800)); 
PVector astroidPos = new PVector (astroidPosX,astroidPosY);
PVector astroidSpeed = new PVector (-0.001,0);
PVector astroidVelocity = new PVector (0,0);
float score = 0;

void setup () {
  birdPos.x = width/4;
  birdPos.y = height/4;
  size (800,800);
  smooth(4);
}

void draw () {
  renderSetup ();
  renderBird ();
  renderAstroid ();
  renderScore ();
  update();
}

void update() {
  astroidVelocity.add(astroidSpeed);
  astroidPos.add(astroidVelocity);
}

void renderSetup () {
  fill(255,255,255);
  stroke(255,255,255);
  background(0,0,0);
}

void renderScore () {
  text("SCORE : "+ nf(score,2,4), 40,140);
  text("Fly Up : 'W' ", 40,50);
  text("Fly Down : 'S' ", 40,40);
}

void renderBird () {
  PVector p0 = new PVector (-20, 20);
  PVector p1 = new PVector (20, 20);
  PVector p2 = new PVector (20,-20);
  PVector p3 = new PVector (-20,-20);
  
  p0.add(birdPos);
  p1.add(birdPos);
  p2.add(birdPos);
  p3.add(birdPos);
  
  line(p0.x,p0.y, p1.x, p1.y);
  line(p1.x,p1.y, p2.x, p2.y);
  line(p2.x,p2.y, p3.x, p3.y);
  line(p3.x,p3.y, p0.x, p0.y);
  
  text("BIRD", birdPos.x - 20, birdPos.y - 30);
}


void renderAstroid () {
  PVector p0 = new PVector (-20, 20);
  PVector p1 = new PVector (20, 20);
  PVector p2 = new PVector (20,-20);
  PVector p3 = new PVector (-20,-20);
  
  p0.add(astroidPos);
  p1.add(astroidPos);
  p2.add(astroidPos);
  p3.add(astroidPos);
  
  line(p0.x,p0.y, p1.x, p1.y);
  line(p1.x,p1.y, p2.x, p2.y);
  line(p2.x,p2.y, p3.x, p3.y);
  line(p3.x,p3.y, p0.x, p0.y);
  
  text("POINT", astroidPos.x - 20, astroidPos.y - 30);
  
  if (astroidPos.x < birdPos.x + 10 && astroidPos.x > birdPos.x - 10 && astroidPos.y < birdPos.y + 10 && astroidPos.y > birdPos.y - 10)
  {
    astroidPos.x = int (random(400, 800)); 
    astroidPos.y = int (random(400, 800)); 
    score += 10;
  }
}



void keyPressed () { 
  if (key == 'w') {
     birdPos.y -= 10.0;
  }
  else if (key == 's') {
     birdPos.y += 10.0;
    }  
}