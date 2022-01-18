//Tristan
class Music {
  float randomizerBossRoom = 0; //Using randomizer booleans incase we would have multiple songs but we had only on song for every part.
  boolean playingBossRoom = false; //Using two booleans means I can turn on off and later somewhere on but also allows for multiple things needed to be done.
  boolean playingBossRoom2 = false; //Using two booleans means I can turn on off and later somewhere on but also allows for multiple things needed to be done.
  float timeDelayBoss = 0;
  float randomizerMenu = 0; //Using randomizer booleans incase we would have multiple songs but we had only on song for every part.
  boolean playingMenu = false; //Using two booleans means I can turn on off and later somewhere on but also allows for multiple things needed to be done.
  boolean playingMenu2 = false; //Using two booleans means I can turn on off and later somewhere on but also allows for multiple things needed to be done.
  float timeDelayMenu = 0;
  float randomizerGame = 0; //Using randomizer booleans incase we would have multiple songs but we had only on song for every part.
  boolean playingGame = false; //Using two booleans means I can turn on off and later somewhere on but also allows for multiple things needed to be done.
  boolean playingGame2 = false; //Using two booleans means I can turn on off and later somewhere on but also allows for multiple things needed to be done.
  float timeDelayGame = 0;
  boolean music = false; //This boolean needs to be put on true by hand in the code. This is so the music doesn't load in to make less 
  final int MAXSONGSGAME = 2;
  final int MINSONGSGAME = 1;
  final int MAXSONGSMENU = 2;
  final int MINSONGSMENU = 1;
  final int MAXSONGSBOSS = 2;
  final int MINSONGSBOSS = 1;

  void update() {
    if (music) {
      //Jump sound for the player
      if (player.jumped) {
        jumpSound.play();
      }
      if (menu.start) {//If the game starts the main menu music needs to be stopped.
        mainMenuMusic1.stop();
      }

      if (!playingGame2) {//When the game starts this boolean will go on true and the song that will be played will be picked.
        randomizerGame++;
      }
      if (randomizerGame >= MAXSONGSGAME) {//If the number goes above the amount of songs we have it will be lowered again.
        randomizerGame = MINSONGSGAME;
      }
      timeDelayGame++; 
      if (timeDelayGame == 100) {//After 100 frames the booleans will be changed and the song that has been picked will start playing.
        playingGame2 = true;
        playingGame = false;
      }
      if (!bossFightRoom && playingGame2) {
        if (randomizerGame == 1 && !playingGame) {
          GameMusic1.play();
          playingGame = true;
        }
        if (randomizerGame == 1 && !GameMusic1.isPlaying()) {
          timeDelayGame = 0;
          playingGame2 = false;
        }
      }

      if (!playingBossRoom2) {//When the boss fight starts this boolean will go on true and the song that will be played will be picked.
        randomizerBossRoom++;
      }
      if (randomizerBossRoom >= MAXSONGSBOSS) {//If the number goes above the amount of songs we have it will be lowered again.
        randomizerBossRoom = MINSONGSBOSS;
      }
      if (bossFightRoom) {
        GameMusic1.pause(); //The music from the game will be paused so the boss music can start playing
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
        if (timeDelayBoss >= 60) {//After 60 frames the booleans will be changed and the song that has been picked will start playing again.
          playingBossRoom = false;
        }
      }
      if (!bossFightRoom && playingBossRoom) {
        bossFightMusic1.pause();
      }
    }
  }

  void menuMusic() {
    if (music) {
      if (!playingMenu2) {//When the menu loads in this boolean will go on true and the song that will be played will be picked.
        randomizerMenu++;
      }
      if (randomizerMenu >= MAXSONGSMENU) {
        randomizerMenu = MINSONGSMENU;
      }
      timeDelayMenu++;
      if (timeDelayMenu == 100) {//After 100 frames the booleans will be changed and the song that has been picked will start playing.
        playingMenu2 = true;
      }
      if (playingMenu2) {
        if (randomizerMenu == 1 && !playingMenu) {//If the number goes above the amount of songs we have it will be lowered again.
          mainMenuMusic1.play();
          playingMenu = true;
        }
        if (!mainMenuMusic1.isPlaying() && randomizerMenu == 1) {
          timeDelayMenu = 0;
          playingMenu2 = false;
          playingMenu = true;
        }
      }
    }
  }
}
