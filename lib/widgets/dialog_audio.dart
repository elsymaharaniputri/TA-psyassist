import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({super.key});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer player = AudioPlayer();

  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Set audio asset
    player.setAsset('assets/audios/audio2.mp3');

    // Listen to position updates
    player.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });
  }

  @override
  void dispose() {
    // Dispose the player to release resources
    player.dispose();
    super.dispose();
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void handlePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: AlertDialog(
        scrollable: true,
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text('Position: ${formatDuration(position)}'),

                Slider(
                  value: position.inSeconds.toDouble(),
                  min: 0,
                  max: player.duration?.inSeconds.toDouble() ?? 100,
                  onChanged: handleSeek,
                ),
                // Slider

                // Current duration text
                Text(formatDuration(position)),
                // Play/Pause button
                IconButton(
                  icon: Icon(
                    player.playing ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: handlePlayPause,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
