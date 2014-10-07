SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------
// put your code inside here
int totalScore = 500;

float P1; //position
float P2;
float P3;
int fc1 ; //fruit score
int fc2 ;
int fc3 ;
int  a ;  //get score
int lucky ;  //seven



// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);
  
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
      // put your code inside here
      
      
      
     
      
      totalScore = totalScore - 50;
      
      lucky =  machine.probability(0.9);
      
      P1 = random(6) * lucky;
      P2 = random(6) * lucky;
      P3 = random(6) * lucky;
      
      machine.setSlotFruit(0,int(P1));
      machine.setSlotFruit(1,int(P2));
      machine.setSlotFruit(2,int(P3));
      
      // -------------------------------------------------
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      // put your code inside here
      
      fc1 = machine.getSlotScore(int(P1));
      fc2 = machine.getSlotScore(int(P2));
      fc3 = machine.getSlotScore(int(P3));
      
     a = fc1 * machine.getFruitCount(int(P1))+fc2 *machine.getFruitCount(int(P2))+fc3 *machine.getFruitCount(int(P3));
      
      totalScore = totalScore+a;
 
 
 
      
      // -------------------------------------------------
    }
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}






