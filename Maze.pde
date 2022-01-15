public class Maze
{
  int path = 6;
  int tried = 2;
  int[][] OBgrid = new int[10][10];

  Maze() {
    //initialize
    for (int i = 0; i < OBgrid.length; i++) {
      for (int k = 0; k < OBgrid[0].length; k++) {
        OBgrid[i][k] = (int) random(0, 2);
      }
    }
  }

  void randomize() {
    for (int i = 0; i < OBgrid.length; i++) {
      for (int k = 0; k < OBgrid[0].length; k++) {
        OBgrid[i][k] = (int) random(0, 2);
      }
    }
  }

  int getV(int r, int c) {
  return OBgrid[r][c];
  }

  boolean trial(int r, int c) {
    boolean done = false;

    if (valid (r, c)) {
      OBgrid[r][c] = tried;

      if (r == 4 && c == OBgrid[0].length-1) {
        done = true;
      } else {
        done = trial (r+1, c);
        if (!done)
          done = trial(r, c+1);
        if (!done)
          done = trial (r-1, c);
        if (!done)
          done = trial (r, c-1);
      }

      if (done)
        OBgrid[r][c] = path;
    }
    return done;
  }

  boolean valid(int r, int c) {
    boolean result = false;

    if (r >= 0 && r < OBgrid.length && c >= 0 && c < OBgrid[r].length) {
      if (OBgrid[r][c] == 0)
        result = true;
    }

    return result;
  }

  String toString() {
    String result = "\n";
    for (int i = 0; i < OBgrid.length; i++) {
      for (int k = 0; k < OBgrid[0].length; k++) {
        result += OBgrid[i][k] + " ";
      }
      result += "\n";
    }
    return result;
  }
}
