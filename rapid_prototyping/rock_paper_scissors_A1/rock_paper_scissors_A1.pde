  PVector screenCenter =  new PVector (0,0);
  PVector selectMenuCenter =  new PVector (0,0);

  PVector p0SelectMenu = new PVector (40, 40);
  PVector p1SelectMenu = new PVector (120, 40);
  PVector p2SelectMenu = new PVector (120,-40);
  PVector p3SelectMenu = new PVector (40,-40);
  
  float computerScore = 0;
  float playerScore = 0;
  float computerSelect;
  float playerSelect;
  boolean isComputerSelected = false;
  boolean isScoreAdded = false;
  

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
  renderPaper();
  renderRock();
  renderScissors();
  renderSelectMenu();
  renderScore ();
  
  if (isComputerSelected)
    renderComputerSelect();
}

void renderSetup () {
  fill(255,255,255);
  stroke(255,255,255);
  background(0,0,0);
}

void renderScore () {
  text("COMPUTER SCORE : "+ nf(computerScore,2,4), 40,140);
  text("PLAYER SCORE : "+ nf(playerScore,2,4), 40,100);
  text("Left : 'A' ", 40,50);
  text("Right : 'D' ", 40,40);
  text("Select : 'Enter' ", 40,30);
  text("Computer", 380,150);
}

void renderPaper() {
  PVector p0 = new PVector (60, 20);
  PVector p1 = new PVector (100, 20);
  PVector p2 = new PVector (100,-20);
  PVector p3 = new PVector (60,-20);
  
  p0.add(screenCenter);
  p1.add(screenCenter);
  p2.add(screenCenter);
  p3.add(screenCenter);
  
  line(p0.x,p0.y, p1.x, p1.y);
  line(p1.x,p1.y, p2.x, p2.y);
  line(p2.x,p2.y, p3.x, p3.y);
  line(p3.x,p3.y, p0.x, p0.y);
  
  text("Paper", screenCenter.x + 60, screenCenter.y + 40);
}

void renderRock() {
  ellipse(300, 400, 55, 55);
  
  text("Rock", screenCenter.x - 120, screenCenter.y + 40);
}

void renderScissors() {
  PVector p0 = new PVector (-10, 10);
  PVector p1 = new PVector (20, 20);
  PVector p2 = new PVector (20,-20);
  PVector p3 = new PVector (-10,-10);
  
  p0.add(screenCenter);
  p1.add(screenCenter);
  p2.add(screenCenter);
  p3.add(screenCenter);
  
  line(p0.x,p0.y, p2.x, p2.y);
  line(p3.x,p3.y, p1.x, p1.y);
  
  
  text("Scissors", screenCenter.x - 30, screenCenter.y + 40);
}

void renderSelectMenu() {
  PVector p0SelectMenu = new PVector (40, 40);
  PVector p1SelectMenu = new PVector (120, 40);
  PVector p2SelectMenu = new PVector (120,-40);
  PVector p3SelectMenu = new PVector (40,-40);
  
  p0SelectMenu.add(selectMenuCenter);
  p1SelectMenu.add(selectMenuCenter);
  p2SelectMenu.add(selectMenuCenter);
  p3SelectMenu.add(selectMenuCenter);
  
  line(p0SelectMenu.x,p0SelectMenu.y, p1SelectMenu.x, p1SelectMenu.y);
  line(p1SelectMenu.x,p1SelectMenu.y, p2SelectMenu.x, p2SelectMenu.y);
  line(p2SelectMenu.x,p2SelectMenu.y, p3SelectMenu.x, p3SelectMenu.y);
  line(p3SelectMenu.x,p3SelectMenu.y, p0SelectMenu.x, p0SelectMenu.y);
  
  text("Select One", screenCenter.x - 30, screenCenter.y - 60);
  //print(selectMenuCenter.x);
}

void renderComputerSelect() {
  //float computerSelect = int (random(0, 2));
  
  //Scissors
  if(computerSelect == 1) 
  {
  PVector p0 = new PVector (-10, -190);
  PVector p1 = new PVector (20, -180);
  PVector p2 = new PVector (20,-220);
  PVector p3 = new PVector (-10,-210);
  
  p0.add(screenCenter);
  p1.add(screenCenter);
  p2.add(screenCenter);
  p3.add(screenCenter);
  
  line(p0.x,p0.y, p2.x, p2.y);
  line(p3.x,p3.y, p1.x, p1.y);
  
    if (isScoreAdded){
      if (playerSelect == 1)
        playerScore += 10;
        
      else if (playerSelect == 3)
        computerScore += 10;
        
      isScoreAdded = false;
    }
  }
  
  //Rock
  else if(computerSelect == 0) 
  {
  ellipse(400, 200, 55, 55);
    if (isScoreAdded){
      if (playerSelect == 3)
        playerScore += 10;
        
      else if (playerSelect == 2)
        computerScore += 10;
        
      isScoreAdded = false;
    }
  }
  
  //Paper
  else if(computerSelect == 2) 
  {
  PVector p0 = new PVector (-20, -180);
  PVector p1 = new PVector (20, -180);
  PVector p2 = new PVector (20,-220);
  PVector p3 = new PVector (-20,-220);
  
  p0.add(screenCenter);
  p1.add(screenCenter);
  p2.add(screenCenter);
  p3.add(screenCenter);
  
  line(p0.x,p0.y, p1.x, p1.y);
  line(p1.x,p1.y, p2.x, p2.y);
  line(p2.x,p2.y, p3.x, p3.y);
  line(p3.x,p3.y, p0.x, p0.y);
  
    if (isScoreAdded){
      if (playerSelect == 2)
        playerScore += 10;
        
      else if (playerSelect == 1)
        computerScore += 10;
        
      isScoreAdded = false;
    }
  }
  
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
    computerSelect = int (random(0, 3));
    isComputerSelected = true;
    isScoreAdded = true;
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