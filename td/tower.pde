class Tower {
  
  //tower modes
  final int PLACING = 0;
  final int PLACED = 1;
  
  //tower data
  float x, y;
  int cooldown, threshold;
  int towerMode;
  int cost;
  int towerType;
  boolean circle;
  
  Tower(int type) {
    x = mouseX;
    y = mouseY;
    cooldown = 0;
    circle = false;
    towerMode = PLACING;
    towerType = type;
    if (towerType == GUN) threshold = 30;
    if (towerType == AOE) threshold = 50;
    if (towerType == SNIPER) threshold = 90;
  }
  //Tower(float _x, float _y, int c, int th) {
  //  x = _x;
  //  y = _y;
  //  cooldown = c;
  //  threshold = th;
  //  towerMode = PLACING;
  //}
  
  void show() {
    //stroke(black);
    //strokeWeight(4);
    //fill(blue);
    //if (towerMode == PLACED) {
    //  square(x, y, 40);
    //} else if (towerMode == PLACING) {
    // square(mouseX, mouseY, 40);
    // if(mousePressed) {
    //   mode = PLACED;
    //   x = mouseX;
    //   y = mouseY;
    // }
    //}
  //}
    if (towerMode == PLACING) {
        x = mouseX;
        y = mouseY;
        if (mousePressed && mouseX < 790) {
          towerMode = PLACED;
          //building = false;
      }
    }
    if (towerType == GUN) showGunTower();
    if (towerType == AOE) showAoETower();
    if (towerType == SNIPER) showSniperTower();
}

void  showGunTower() {
  stroke(black);
  strokeWeight(4);
  fill(blue);
  square(x, y, 40);
}

void showAoETower() {
  stroke(black);
  strokeWeight(4);
  fill(pink);
  circle(x, y, 40);
}

void showSniperTower() {
  stroke(black);
  strokeWeight(3);
  fill(purple);
  triangle(0, 100, 100, 200, 300, 200);
  stroke(white);
  strokeWeight(12);
  line(x+40, y+40, x + 100, y + 40);
}

void act() {
 if (towerType == GUN) gunTowerAct();
 if (towerType == AOE) aoeTowerAct();
 if (towerType == SNIPER) sniperTowerAct();
}

void gunTowerAct() {
  cooldown++;
 if (cooldown >= threshold) {
   cooldown = 0;
   bullets.add(new Bullet(x, y, 0, -10)); //UP
   bullets.add(new Bullet(x, y, 0, 10)); //DOWN
   bullets.add(new Bullet(x, y, -10, 0)); //LEFT
   bullets.add(new Bullet(x, y, 10, 0)); //RIGHT
 }
}

void aoeTowerAct() {
  cooldown++;
}

void sniperTowerAct() {
  println(cooldown);
  cooldown++;
  if (cooldown >= threshold) {
    
  }
}
}
