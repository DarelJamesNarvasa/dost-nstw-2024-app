import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IlocosNortePage extends StatefulWidget {
  @override
  _IlocosNortePageState createState() => _IlocosNortePageState();
}

class _IlocosNortePageState extends State<IlocosNortePage> {
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
      appBar: AppBar(
        title: const Text(
          'DOST REGION I ILOCOS NORTE',
          style: TextStyle(
            fontFamily: 'Roboto',
            //fontSize: 22,
            color: Colors.black, // Set title color here
            //color: Colors.blueAccent,
          ),
        ),
        backgroundColor: Color(0xFF99cc33), // AppBar background color
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0), // Add right margin here
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional padding around the image
              child: Image.asset(
                'assets/background/2024-NSTW-BLK-09.png', // Replace with your image path
                height: 100, // Adjust height as needed
                width: 100, // Adjust width as needed
              ),
            ),
          ),
        ],
      ),

      backgroundColor: Colors.black,  // Set background color to black
      //backgroundColor: Color(0xFF00aceb), // Set background color to black
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
