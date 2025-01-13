import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  static final AudioPlayer _player = AudioPlayer();

  static void playBackgroundMusic() async {
    await _player
        .play(AssetSource('sounds/background_music.mp3')); // Correct usage
  }

  static void stopBackgroundMusic() async {
    await _player.stop();
  }
}
