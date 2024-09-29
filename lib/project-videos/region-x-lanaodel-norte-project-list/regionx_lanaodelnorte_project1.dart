import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RegionxLanaodelnorteProject1Page extends StatefulWidget {
  final String videoPath;

  const RegionxLanaodelnorteProject1Page({Key? key, required this.videoPath}) : super(key: key);

  @override
  _RegionxLanaodelnorteProject1PageState createState() => _RegionxLanaodelnorteProject1PageState();
}

class _RegionxLanaodelnorteProject1PageState extends State<RegionxLanaodelnorteProject1Page> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.videoPath, // Path to your video asset
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // Set the height of the AppBar
        child: AppBar(
          //backgroundColor: Color(0xFF99cc33),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Container(
              width: 30, // Adjust the width
              height: 30, // Adjust the height
              child: const Icon(
                Icons.close,
                color: Colors.black, // X icon color
                size: 30, // Adjust the icon size
              ),
            ),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
          title: Center( // Center the title
            child: const Text(
              'Lanao Del Norte Project 1',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black, // Set title color here
              ),
            ),
          ),
        ),
      ),

      backgroundColor: Colors.black, // Set background color to white
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
