import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

// Stateful widget to handle audio playback.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState(); // State creation.
}

class _MyAppState extends State<MyApp> {
  final AudioPlayer audioPlayer = AudioPlayer(); // Audio player instance.

  @override
  void dispose() {
    audioPlayer.dispose(); // Release audio player resources.
    super.dispose();
  }

  // Plays an audio file.
  void playAudio() async {
    await audioPlayer.play(AssetSource('audio/sound.mp3'));
  }

  // Stops the audio playback.
  void stopAudio() async {
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    // Builds the app's UI.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Audio Player Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: playAudio, child: const Text('Play Audio')),
              ElevatedButton(
                  onPressed: stopAudio, child: const Text('Stop Audio')),
            ],
          ),
        ),
      ),
    );
  }
}
