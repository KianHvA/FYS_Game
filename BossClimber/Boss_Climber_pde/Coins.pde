class Coins{
  float coinX, coinY, coinSize;
  int coinCounter;
  
  Coins(){
    coinX = random(100, 200);
    coinY = random(100, 500);
    coinSize = 30;
    coinCounter = 600;
  }
  
  void updateCoins(){
    if (playerCoin(player.posPlayer.x, player.posPlayer.y, player.sizePlayer.x, coinX, coinY, coinSize)){
      coinSize = 0;
      scoreHandler.score += 500;
      
      if (coinCounter <= 0){
        resetCoin();
        coinCounter = 600;
      }
    }
    
    if (coinCounter > 0){
        coinCounter--;
      }
  }
  
  void draw(){
    fill(#FEFF00);
    circle(coinX, coinY, coinSize);
  }
  
  void resetCoin(){
    coinX = random(100, 200);
    coinY = random(100, 500);
    coinSize = 30;
  }
  
  boolean playerCoin(float px, float py, float ps, float cx, float cy, float cs){
    float distCoinX = px - cx;
    float distCoinY = py - cy;
    
    float coinDistance = sqrt((distCoinX * distCoinX) + (distCoinY * distCoinY));
    
    if (coinDistance <= ps + cs){
      return true;
    }
    return false;
  }
}
