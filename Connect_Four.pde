// Connect Four -- Daniel Sung

int player=0;  // player increments every turn 
Score score;  // initializes score class
boolean gameOn=false;  // checks if game should be running
int scoreRed=0;
int scoreYellow=0;

void setup()
{
  size(1000, 800);  // creates size of board
  background(177,156,217);  // background color
  score=new Score();
  score.scoreReset();  // resets scores to 0
  player=0;  // resets player at 0
  grid();  // draws connect four grid
  fill(234,0,34);
  text("RED: "+scoreRed,750,100);
  fill(255,242,0);
  text("YELLOW: "+scoreYellow,900, 100);
}

void grid() // draws grids
{
  background(177,156,217);

  for (int i=1; i<=7; i++)
  {
    line(0,i*100,700,i*100);
  }
  
  for (int i=1; i<=7; i++)
  {
    line(i*100,100,i*100,700);
  }
  
  for (int i=0;i<7; i++)
  {
    if (player%2==0)
      fill(234,0,34);
    else if (player%2==1)
      fill(255,242,0);
     circle(i*100+50, 50, 75);
  }
  
  line(750,600,950,600);
  line(750,500,750,600);
  line(750,500,950,500);
  line(950,500,950,600);
  fill(23,144,212);
  textAlign(CENTER);
  textSize(80);
  text("PLAY", 850,575);
  textAlign(CENTER);
  fill(40,10,112);
  textSize(40);
  text("CONNECT4", 850,675);
  textSize(20);
  text("by Daniel Sung", 850,700);
  fill(234,0,34);
  text("RED: "+scoreRed,750,100);
  fill(255,242,0);
  text("YELLOW: "+scoreYellow,900, 100);
}

void draw() {
}

void mouseClicked() {
  if (mouseX>=750 && mouseX<=950 && mouseY>=500 && mouseY<=600)  // checks if player pressed play
    gameOn=true;
    
  if (gameOn)
  {
    if (player%2==0)
    {
      for (int row=5; row>=0; row--)
      {
        if (score.isEmptySquare(row,getcol()))  // places red circle if empty square
        {
          fill(234,0,34);
          circle(getcol()*100+50, (row+1)*100+50, 75);
          score.setScore(row, getcol(),1);
          player++;
          break;
        }
      }
      
    }
  
  else if (player%2==1)  // places yellow circle if empty square
  {
    for (int row=5; row>=0; row--)
    {
      if (score.isEmptySquare(row,getcol()))
      {
        fill(255,242,0);
        circle(getcol()*100+50,row*100+150,75);
        score.setScore(row,getcol(),5);
        player++;
        break;
      }
    }
  }
  
  checkWinner();   // checks if there is a winner
  
  for (int i=0;i<7; i++)  // changes color of the circles to signal whose turn it is
  {
    if (player%2==0)
      fill(234,0,34);
    else if (player%2==1)
      fill(255,242,0);
     circle(i*100+50, 50, 75);
  }
  }  
 
  
}

int getrow()  // returns rows
{
  return mouseY/100;
}

int getcol()  // returns columns
{
  return mouseX/100;
}

void checkWinner()  // checks if there is a winner, then prints if won, or tied
{
  if (score.checkWinner()==1)
  {    
    println("RED WINS");
    textAlign(CENTER);
    textSize(40);
    fill(234,0,34);
    text("RED WINS!", 860,200);
    textSize(70);
    fill(0,128,128);
    text("Press Space to Restart", 500, 400);
    scoreRed++;
    gameOn=false;
  }
  else if (score.checkWinner()==5)
  {
    println("YELLOW WINS");
    textAlign(CENTER);
    textSize(40);
    fill(255,242,0);
    text("YELLOW WINS!", 860,350);
    textSize(70);
    fill(0,128,128);
    text("Press Space to Restart", 500, 400);
    gameOn=false;
    scoreYellow++;
  }
  else if (score.checkWinner()==0 && player>=42)
  {
    println("IT'S A TIE");
    textAlign(CENTER);
    textSize(40);
    fill(128,80,0);
    text("IT'S A TIE!", 860,300);
    textSize(70);
    fill(0,128,128);
    text("Press Space to Restart", 500, 400);
    gameOn=false;
  }
}

void gameReset()  // resets game: redraw grid, reset score, reset player
{
  score.scoreReset();
  player=0;
  grid();
  gameOn=true;
  
}

void keyPressed()  // if game is over and player presses space key, the game restarts
{
  if (key==' ' && gameOn==false)
    gameReset();
}

class Score {
  int[][] score;
  
  Score() {
    score = new int[6][7];
  }
  
  void scoreReset() {  // resets score
    for (int i=0; i<6; i++)
    {
      for (int j=0; j<7; j++)
      {
        score[i][j]=0;
      }
    }
  }
  
  void setScore(int row, int col, int val)  // sets score to given rol and column in the score matrix
  {
    if (row<6 && col<7)
    score[row][col]=val;
  }
  int giveVal(int row, int col)
  {
    return score[row][col];
  }
  
  boolean isEmptySquare(int row, int col)  // checks if emptySquare
  {
    if (row<6 && col<7)
    {
      if (score[row][col]==0)
        return true;
      else 
        return false;
    }
    else
      return false;
    
  }
  
  int checkWinner()  // return 1 if red wins return 5 if yellow wins return 0 if nobody wins
  {
    int sum=0;
    for (int i=0; i<3; i++) // checks if anyone wins on the vertical lines
    {
      for (int j=0; j<7; j++)
      {
        for (int k=5-i; k>=2-i; k--)
        {
          sum+=score[k][j];
        }
        if (sum==4)
          return 1;
        else if (sum==20)
          return 5;
        else {
          sum=0;
          continue;
        }
      }
    }
    
    
    for (int i=0; i<3; i++) // checks if anyone wins on the horizontal lines
    {
      for (int j=0; j<6; j++)
      {
        for (int k=0+i; k<4+i; k++)
        {
          sum+=score[j][k];
        }
        println(sum);
        if (sum==4)
          return 1;
        else if (sum==20)
          return 5;
        else {
          sum=0;
          continue;
        }
      }
    }
    
    for (int i=0; i<3; i++)  // checks winner at left diagonals
    {
      for (int j=0; j<4; j++)
      {
        for (int k=5, l=0; k>=2; k--,l++)
        {
          sum+=score[k-i][l+j];
        }
        println(sum);
        if (sum==4)
          return 1;
        else if (sum==20)
          return 5;
        else {
          sum=0;
          continue;
        }
      }
    }
    
    for (int i=0; i<3; i++)  // checks winner at right diagonals
    {
      for (int j=3; j>=0; j--)
      {
        for (int k=5, l=6; k>=2; k--,l--)
        {
          sum+=score[k-i][l-j];
        }
        println(sum);
        if (sum==4)
          return 1;
        else if (sum==20)
          return 5;
        else {
          sum=0;
          continue;
        }
      }
    }
    
    return 0;
  }
}
