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
