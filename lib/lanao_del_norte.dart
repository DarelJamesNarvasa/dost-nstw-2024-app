import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LanaoDelNortePage extends StatefulWidget {
  @override
  _LanaoDelNortePageState createState() => _LanaoDelNortePageState();
}

class _LanaoDelNortePageState extends State<LanaoDelNortePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/1_minute_DOST-X.mp4', // Path to your video asset
    )..initialize().then((_) {
      setState(() {
        _controller.play(); // Automatically play the video after initialization
      });
    });

    // Loop the video when it ends
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        _controller.seekTo(Duration.zero); // Reset to start
        _controller.play(); // Play again
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Region X Lanao Del Norte')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const Text('Welcome to Lanao del Norte', style: TextStyle(fontSize: 28)),
            //const SizedBox(height: 20),
            //const Text('This is for testing', style: TextStyle(fontSize: 16)),
            //const SizedBox(height: 20),
            _controller.value.isInitialized
                ? Flexible( // Allow the video player to resize
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
