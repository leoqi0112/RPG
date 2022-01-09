class DarknessCell {
  float opacity;
  float x, y, size;
  
  DarknessCell(float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 0;
  }
  
  void show(int lightValue) {
    opacity = lightValue;
    noStroke();
    fill(black, opacity);
    rectMode(CORNER);
    square(x, y, size);   
  }
}
