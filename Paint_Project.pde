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
  //text test
  fill(pink);
  textSize(30);
  textAlign(CENTER,CENTER);;
  text("save",80,30);
}
void mouseDragged() {
  if (mouseX>110 && mouseX<500 && mouseY>70 && mouseY<550 && pmouseX>110 && pmouseX<500 && pmouseY>70 && pmouseY<550) {
    stroke(selectedColor);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  controlSlider();
}

void mouseReleased() {
  controlSlider();
}
void tactileCircle(int x, int y, int r) {
  strokeWeight(2);
  if (dist(x, y, mouseX, mouseY)<r) {
    stroke(white);
  } else {
    stroke(darkBrown);
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
