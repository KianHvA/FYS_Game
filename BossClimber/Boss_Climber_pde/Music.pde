class Music {
  float randomizerBossRoom = 0;
  boolean playingBossRoom = false;
  boolean playingBossRoom2 = false;
  float timeDelayMenu = 0;
  float timeDelayBoss = 0;
  float randomizerMenu = 0;
  boolean playingMenu = false;
  boolean playingMenu2 = false;
  
  void setup() {
    
  }
  
  void update() {
    if (menu.start) {
     mainMenuMusic1.stop(); 
    }
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
        timeDelayBoss++;
      }
      if (timeDelayBoss >= 60) {
       playingBossRoom = false; 
      }
    }
    if (!bossFightRoom && playingBossRoom) {
      bossFightMusic1.stop();
    }
  }
  
  void menuMusic() {
    if (!playingMenu2) {
    randomizerMenu++;
    }
    if (randomizerMenu >= 2) {
     randomizerMenu = 1; 
    }
    timeDelayMenu++;
    if (timeDelayMenu >= 100) {
      playingMenu2 = true;
    }
    if (playingMenu2) {
     if (randomizerMenu == 1 && !playingMenu) {
      mainMenuMusic1.play();
      playingMenu = true;
     }
     if (!mainMenuMusic1.isPlaying() && randomizerMenu == 1) {
       timeDelayMenu = 0;
       playingMenu2 = false;
     }
    }
  }
  
}
