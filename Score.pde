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
