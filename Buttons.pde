class Buttons {
  //instance variables
  int x, y, w, h;
  String text;
  color normal, highlight;
  boolean clicked;
  
  //constructors
  Buttons (int x, int y, int w, int h, String text, color normal, color highlight) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.normal = normal;
    this.highlight = highlight;
    this.normal = normal;
    clicked = false;
    
  }
  
  //behavior functions
  void show () {
        if (mouseX >x-w/2 && mouseX <x+w/2 && mouseY >y-h/2 && mouseY < y+h/2) {
      fill(highlight);
        } else {
      fill(normal); 
        }
        stroke(0);
        strokeWeight(4);
        rect(x, y, w, h);
      
       if (mouseX >x-w/2 && mouseX <x+w/2 && mouseY >y-h/2 && mouseY < y+h/2) {
      fill(normal);
        } else {
      fill(highlight); 
        }
        textSize(w/8);
        text(text, x, y);
        
  
  if (mouseReleased && mouseX >x-w/2 && mouseX <x+w/2 && mouseY >y-h/2 && mouseY < y+h/2) {
    clicked = true;
  } else {
    clicked = false;
  }
  
    }
    
      void show2 () {
        if (mouseX >x-w/2 && mouseX <x+w/2 && mouseY >y-h/2 && mouseY < y+h/2) {
      fill(highlight);
        } else {
      fill(normal); 
        }
        noStroke();
        rect(x, y, w, h);
      
       if (mouseX >x-w/2 && mouseX <x+w/2 && mouseY >y-h/2 && mouseY < y+h/2) {
      fill(normal);
        } else {
      fill(highlight); 
        }
        textSize(w/6);
        text(text, x, y);
        
  
  if (mouseReleased && mouseX >x-w/2 && mouseX <x+w/2 && mouseY >y-h/2 && mouseY < y+h/2) {
    clicked = true;
  } else {
    clicked = false;
  }
  
    }
}
