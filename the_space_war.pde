//RUSHI JETALPURIA
//DYNAMIC VIDEO GAME
//THE SPACE WAR!!!!
import processing.sound.*;
SoundFile bulletSound;
SoundFile file;
int playerX=500;
int playerY=600;
int playerWidth=100;
int bulletX;
int bulletY=0;
int bullet=0;
int enemyX;
int enemyY=0;
int enemyTouched=0;
int bulletTouched=0;
int[] posX = new int[2];
int[] posY = new int[2];
int count=20;
PFont myFont;
PFont myFont1;
int textY=400;
int playSize=20;
boolean play=false;
int score=0;
float playColorR;
float playColorG;
float playColorB;
float playerColorR;
float playerColorG;
float playerColorB;
void setup() {
  size(1000, 700);
  frameRate(60);
  bulletSound = new SoundFile(this, "bulletSound.wav");
  file = new SoundFile(this, "Space Invaders 91 - Opening Theme.wav");
  file.loop();
  //pick a random RGB color values to fill in the player
  playerColorR=(random(0, 255));
  playerColorG=(random(0, 255));
  playerColorB=(random(0, 255));
  playColorR=(random(0, 255));
  playColorG=(random(0, 255));
  playColorB=(random(0, 255));
}

void draw() { 
  //sound
  file.amp(1+(0.5*(score*minute())));
  strokeWeight(2);
  filter(POSTERIZE, 255);
  //background code===============================================================================================
  background(0);
  for (int x=0; x<width; x=x+35) {
    for (int y=0; y<height; y=y+35) {
      stroke(random(0, 255), random(0, 255), random(0, 255));
      fill(random(0, 255), random(0, 255), random(0, 255));
      float size=random(0, 10);
      ellipse(x, y, size, size);
    }
  }
  //starting animation===================================================================
  myFont = loadFont("Jokerman-Regular-100.vlw");
  myFont1 = loadFont("DialogInput.bold-40.vlw");
  textFont(myFont, 100);

  if (!play) {
    if (frameCount%count==0) {
      fill(random(0, 255), random(0, 255), random(0, 255));
      text("The Space War!", 100, textY);
      if (count>1) {
        --count;
      }
    }
    if (textY>200 && count==1) {
      --textY;
    }
    if (textY==200) { 
      ellipseMode(CENTER);
      fill(playColorR+mouseX/4, playColorG+mouseX/4, playColorB+mouseX/4);
      ellipse(500, 450, playSize, playSize);
      if (playSize<200) {
        ++playSize;
      }
      if (playSize>=200) {
        fill(playColorB, playColorR, playColorG);
        textFont(myFont, 50);
        text("START", 420, 480);
        textFont(myFont1, 30);
        fill(#ffffff);
        text("PRESS 'S' OR CLICK 'START' TO START/RESUME", 120, 640);
        text("©2018 The Space War Inc. NO Rights Reserved! ;-)", 80, 670);
      }
    }
  }
  //the actual game code starts here========================================================================
  else if (play) {
    textFont(myFont, 50);
    fill(playerColorR+mouseX/4, playerColorG+mouseX/4, playerColorB+mouseX/4);
    text("score: "+ score, 10, 50);
    //recording player coordinates in an array
    for (int i=0; i<2; ++i) {
      int tempX;
      int tempY;
      posX[i]=playerX;
      posY[i]=playerY;
      if (i==1) {
        tempX=posX[1];
        posX[0]=posX[1];
        posX[1]=tempX;
        tempY=posY[1];
        posY[0]=posY[1];
        posY[1]=tempY;
        i=0;
      }
      break;
    }
    //bullet===================================================================================
    ellipseMode(CENTER);
    fill(playerColorB+mouseY/4, playerColorR+mouseY/4, playerColorG+mouseY/4);
    if (bullet==1 && play==true) {
      ellipse(bulletX, bulletY, 30, 30);
      bulletY=bulletY-15;
    }
    if ((bulletX-15<=enemyX+30) && (bulletX+15>=enemyX-30) && (bulletY-15<=enemyY+30) && (bulletY+15>=enemyY))
    {
      bulletTouched=1;
      enemyY=0;
      ++score;
    } else if (bulletY<=0) {
      bulletTouched=0;
    }

    //enemy===================================================================================
    if (enemyY==0) {
      enemyX=posX[0];
    }
    if (bulletTouched==0) {
      fill(playerColorG+mouseY/4, playerColorB+mouseY/4, playerColorR+mouseY/4);    
      triangle(enemyX, enemyY, enemyX-30, enemyY+30, enemyX+30, enemyY+30);
    }
    if (enemyY<=700) {
      ++enemyY;
      enemyY=enemyY+(second()%10);
    } else {
      enemyY=0;
      enemyTouched=0;
    }
    //if enemy touches the player
    if (enemyX+30>=(playerX-(playerWidth/2)) && enemyX-30<=(playerX+(playerWidth/2)) && enemyY+30>=(playerY-15) && enemyY+30<=(playerY+15))
    {
      enemyTouched=1;
      playerX=500;
      playerY=600;
      playerWidth=100;
      play=false;
      score=0;
      enemyY=0;
      enemyTouched=0;
    }


    strokeWeight(2);
    //player 1=================================================================================
    if (enemyTouched==0) {
      fill(playerColorR+mouseY/4, playerColorG+mouseY/4, playerColorB+mouseY/4);
      rectMode(CENTER);
      rect(playerX, playerY, playerWidth, 30);
      playerWidth=100+((score*second())/30);
    }

    //platform=================================================================================
    fill(#848484);
    rect(500, 695, 1000, 50);
  }
}


void keyPressed() {
  if (key==CODED) {
    if (keyCode==RIGHT) {
      if (playerX<=950) {
        playerX=playerX+20;
      }
    }
    if (keyCode==LEFT) {
      if (playerX>=50) {
        playerX=playerX-20;
      }
    }
    if (keyCode==UP) {
      if (playerY>=550) {
        playerY=playerY-20;
      }
    }
    if (keyCode==DOWN) {
      if (playerY<=650) {
        playerY=playerY+20;
      }
    }
  }
  if (key == 'x') {
    bullet=1;
    if (bulletY<=0 && enemyTouched==0 && play==true) {
      bulletY=posY[0];
      bulletX=posX[0];
      bulletSound.play();
    }
  }
  if (key=='s' && playSize>=200) {
    play=true;
  }
  if (key=='p') {
    play=false;
  }
}

void mousePressed() {
  if ((mouseButton==LEFT)&&(mouseX>=400) && (mouseX<=600) && (mouseY>=350) && (mouseY<=550) && (playSize>=200)) {
    play=true;
  }
  if (mouseButton==RIGHT && play==true) {
    play=false;
  }
}
