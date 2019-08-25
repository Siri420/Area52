class person { //<>//
  float x, y, height, width, ySpeed, xSpeed;
  boolean alive;
}
class agent {
  float x, y, height, width, ySpeed, xSpeed;
  boolean alive, isTouching; //use collision check program from dionsaurGame
}
class alien {
  float x, y, height, width, ySpeed, xSpeed;
  boolean captured, isTouching;
}
person player=new person();
alien[] aliens;
agent[] agents;
int numberOfAliens=10;

void setup() {
  newLevel();
  fullScreen();
  textSize(40);
  noStroke();
  player=new person();
  player.x=int(500);
  player.y=int(height/2+370);
  player.height=int(20);
  player.width=int(20);
  player.ySpeed=int(0);
  player.xSpeed=int(0);

  loop();
}

void draw() {
  background(100);
  player.x=player.x+player.xSpeed;
  player.y=player.y+player.ySpeed;
  for (int i=0; i<agents.length; i=i+1) {
    agents[i].x=agents[i].x+agents[i].xSpeed;
    agents[i].y=agents[i].y+agents[i].ySpeed;
    if (agents[i].x<0 || agents[i].x>width) {
      agents[i].xSpeed=agents[i].xSpeed*-1;
    }
    if (agents[i].y<0 || agents[i].y>height) {
      agents[i].ySpeed=agents[i].ySpeed*-1;
    }
    fill(255, 0, 0);
    ellipse(agents[i].x, agents[i].y, agents[i].width, agents[i].height);
  }
  for (int i=0; i<aliens.length; i=i+1) {
    aliens[i].x=aliens[i].x+aliens[i].xSpeed;
    aliens[i].y=aliens[i].y+aliens[i].ySpeed;
    if (aliens[i].x<0 || aliens[i].x>width) {
      aliens[i].xSpeed=aliens[i].xSpeed*-1;
    }
    if (aliens[i].y<0 || aliens[i].y>height) {
      aliens[i].ySpeed=aliens[i].ySpeed*-1;
    }
    fill(0, 0, 0);
    rect(player.x, player.y, player.width, player.height);
    fill(0, 255, 0);
    ellipse(aliens[i].x, aliens[i].y, aliens[i].width, aliens[i].height);
    if (dist(player.x, player.y, aliens[i].x, aliens[i].y) < (player.width+10) || (dist(player.x, player.y, aliens[i].x, aliens[i].y) <  (player.height+10))) {
      //(player.x<aliens[i].x+aliens[i].width || player.x+player.width>aliens[i].x || player.y<aliens[i].y+aliens[i].height || player.y+player.height>aliens[i].y) { Not working collision program :(
      aliens[i].captured=true;
    }
    if (aliens[i].captured==true) {
      aliens[i]=aliens[numberOfAliens-1];
      // println(aliens.length-1);
    }
    //if(shit>
    //}
  }
}

void keyPressed() {
  if (key == 'w'||key == 'W') {
    player.ySpeed=int(-7);
    player.xSpeed=int(0);
  }
  if (key == 's'||key == 'S') {
    player.ySpeed=int(7);
    player.xSpeed=int(0);
  }
  if (key == 'd'||key == 'D') {
    player.xSpeed=int(7);
    player.ySpeed=int(0);
  }
  if (key == 'a'||key == 'A') {
    player.ySpeed=int(0);
    player.xSpeed=int(-7);
  }
}

//void newLevel(int level) {
//}
void makeAliens() {
  aliens=new alien[numberOfAliens];
  for (int i=0; i<aliens.length; i=i+1) {
    aliens[i]=new alien();
    aliens[i].x=width/2+int(random(400))-20;
    aliens[i].y=height/2+int(random(400))-20;
    aliens[i].width=10;
    aliens[i].height=10;
    aliens[i].xSpeed=int(random(4));
    aliens[i].ySpeed=int(random(4));
  }
}
void makeAgents() {
  agents=new agent[50];
  for (int i=0; i<agents.length; i=i+1) {
    agents[i]=new agent();
    agents[i].x=int(random(700, width-1));
    agents[i].y=int(random(1, height-1));
    agents[i].width=30;
    agents[i].height=30;
    agents[i].xSpeed=int(random(2, 4));
    agents[i].ySpeed=int(random(2, 4));
  //  if (randomizer==1) {
   //   agents[i].ySpeed=agents[i].ySpeed*-1;
   // }
  }
}

void newLevel() {
  makeAliens();
  makeAgents();
}
