class Music {
  float randomizerBossRoom = 0;
  boolean playingBossRoom = false;
  boolean playingBossRoom2 = false;
  float timeDelay = 0;
  
  void setup() {
    
  }
  
  void update() {
    if (!playingBossRoom2) {
      randomizerBossRoom++;
      }
      if (randomizerBossRoom >= 2) {
       randomizerBossRoom = 1; 
      }
    if (bossFightRoom) {
      if (randomizerBossRoom == 1 && !playingBossRoom && !playingBossRoom2) {
       bossFightMusic1.play(); 
       playingBossRoom = true;
       playingBossRoom2 = true;
      }
      if (randomizerBossRoom == 1 && bossFightMusic1.isPlaying()) {
        playingBossRoom = true;
      }
      if (randomizerBossRoom == 1 && !bossFightMusic1.isPlaying()) {
        playingBossRoom2 = false;
        timeDelay++;
      }
      if (timeDelay >= 60) {
       playingBossRoom = false; 
      }
    }
    if (!bossFightRoom) {
      bossFightMusic1.stop();
    }
  }
  
}
