//color variables
color black=#000000;
color white=#FFFFFF;
color gray=#C8C8C8;
color lightBrown=#7C4E32;
color darkBrown=#5A2E19;
color purple=#5C4152;
color pink =#B4585D;
color peach=#D97F76;
color cream=#F7D0A9;
color blue=#A1C0AE;
color navy=#19404F;
color orange=#FDA100;
color green=#84AB7C;
color mint=#E2FDD8;
//variable for color selection
color selectedColor;
color canvas;
//stroke thickness
float thickness;
//slider variable
int sliderY;

void setup() {
  size(800, 600);
  background(mint);
  //variable setup
  selectedColor = navy;
  thickness=1;
  sliderY=350;
  canvas=white;
  //sketchpad
  //back of sketchpad
  fill(lightBrown);
  rect(-10, 50, 530, 520);
  //paper
  strokeWeight(1);
  fill(white);
  rect(100, 60, 410, 500);
  fill(white);
  rect(-10, 60, 100, 500);
}

void draw() {
  //background correction
  noStroke();
  fill(mint);
  rect(525, 0, 300, 600);
  //paint pallete
  fill(lightBrown);
  circle(650, 450, 200);
  fill(mint);
  circle(595, 420, 60);
  //color pallete colors
  paint(700, 400, 10, purple);
  paint(660, 380, 10, navy);
  paint(725, 440, 10, pink);
  paint(720, 480, 10, peach);
  paint(700, 510, 10, cream);
  paint(660, 525, 10, blue);
  paint(620, 520, 10, orange);
  paint (590, 500, 10, green);
  //slider
  stroke(darkBrown);
  line(750, 250, 750, 350);
  circle(750, sliderY, 12);
  thickness= map(sliderY, 350, 250, 1, 20);
  //indicator
  pencil(555, 200);
  strokeWeight(thickness);
  stroke(selectedColor);
  line(555, 100, 555, 150);
  //save button
  fill(white);
  strokeWeight(3);
  tactileRect(5, 5, 85, 40);
  rect(5, 5, 80, 40);
  fill(pink);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("SAVE", 45, 25);

  //load button
  fill(white);
  tactileRect(90, 5, 170, 40);
  rect(90, 5, 80, 40);
  fill(pink);
  text("LOAD", 130, 25);

  //new button
  fill(white);
  tactileRect(175, 5, 255, 40);
  rect(175, 5, 80, 40);
  fill(pink);
  text("NEW", 215, 25);
}
void mouseDragged() {
  if (mouseX>110 && mouseX<500 && mouseY>70 && mouseY<550 && pmouseX>110 && pmouseX<500 && pmouseY>70 && pmouseY<550) {
    stroke(selectedColor);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  controlSlider();
}

void openImage(File f){
  if(f != null){
    int n=0;
    while(n<100){
      PImage pic = loadImage(f.getPath());
      image (pic,100,60);
      n=n+1;
    }
  }
}

void mouseReleased() {
  controlSlider();
  //new button
  if (mouseX>175 && mouseX<255 && mouseY>5 && mouseY<45) {
    stroke(black);
    strokeWeight(1);
    fill(canvas);
    rect(100, 60, 410, 500);
  }

  //save button
  if (mouseX>5 && mouseX<85 && mouseY>5 && mouseY<45) {
    selectOutput("Choose a name for your new image file", "saveImage");
  }

  //load button
  if(mouseX>90 && mouseX<170 && mouseY>5 && mouseY<45){
    selectInput("Pick an image to load","openImage");
  }
}

void saveImage(File f) {
  if (f !=null) {
    PImage save = get(100, 60, 410, 500);
    save.save(f.getAbsolutePath());
  }
}

void tactileCircle(int x, int y, int r) {
  strokeWeight(2);
  if (dist(x, y, mouseX, mouseY)<r) {
    stroke(white);
  } else {
    stroke(darkBrown);
  }
}
void tactileRect(int x, int y, int x2, int y2) {
  if (mouseX>x && mouseX<x2 && mouseY>y && mouseY<y2) {
    stroke(peach);
  } else {
    stroke(pink);
  }
}
void circleButton(int x, int y, int r, color c) {
  if (dist(x, y, mouseX, mouseY)<r) {
    selectedColor = c;
  }
}

void paint(int x, int y, int r, color c) {
  tactileCircle(x, y, r*2);
  fill(c);
  circleButton(x, y, r, c);
  circle(x, y, r*2);
}

void controlSlider() {
  if (mouseY>250 && mouseY<350 && mouseX>740 && mouseX<760) {
    sliderY=mouseY;
  }
}

void pencil(int x, int y) {

  pushMatrix();
  translate(x, y);
  noStroke();
  fill(selectedColor);
  triangle(-9, -6, 9, -6, 0, -30);
  fill(lightBrown);
  circle(0, -5, 20);
  fill(darkBrown);
  rect(-10, -4, 20, 90);
  popMatrix();
}
