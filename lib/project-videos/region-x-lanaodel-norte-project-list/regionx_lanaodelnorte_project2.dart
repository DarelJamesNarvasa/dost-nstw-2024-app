import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RegionxLanaodelnorteProject2Page extends StatefulWidget {
  final String videoPath;

  const RegionxLanaodelnorteProject2Page({Key? key, required this.videoPath}) : super(key: key);

  @override
  _RegionxLanaodelnorteProject2PageState createState() => _RegionxLanaodelnorteProject2PageState();
}

class _RegionxLanaodelnorteProject2PageState extends State<RegionxLanaodelnorteProject2Page> {
  late VideoPlayerController _controller;
  bool _isDialogVisible = false; // Track if the dialog is already visible
  int _confirmationCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.videoPath, // Path to your video asset
    )
      ..initialize().then((_) {
        setState(() {
          _controller.play(); // Automatically play the video after initialization
        });
      });

    // Listen for video completion to show the popup
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration && !_isDialogVisible) {
        _isDialogVisible = true; // Set dialog visible
        _showVideoEndDialog(); // Show dialog when video ends
      }
    });
  }

  // Show dialog when video ends
  void _showVideoEndDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF282828), // Set background color to #282828
          content: Column(
            mainAxisSize: MainAxisSize.min, // Adjust size based on content
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*
              Text(
                'Confirmation Count: $_confirmationCount', // Display the confirmation count
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ), */
              //const SizedBox(height: 10), // Space between confirmation count and question
              const Text(
                'Do you want to watch the video again?',
                textAlign: TextAlign.center, // Center the text
                style: TextStyle(color: Colors.white), // Set text color to white
              ),
              const SizedBox(height: 20), // Space between text and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _confirmationCount++;
                      if (_confirmationCount == 1) {
                        Navigator.pop(context);
                        _confirmationCount = 0;
                      }
                      // Reset the page by pushing a new instance of the same page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegionxLanaodelnorteProject2Page(
                            videoPath: widget.videoPath, // Pass the same videoPath
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Color(0xFF3b98e8)), // Set 'Yes' button color to #3b98e8
                    ),
                  ),
                  const SizedBox(width: 20), // Space between buttons
                  TextButton(
                    onPressed: () {
                      // Close the dialog and navigate back to the previous screen
                      Navigator.pop(context);
                      Navigator.pop(context);
                      _isDialogVisible = false; // Reset dialog visibility
                      _confirmationCount = 0; // Reset confirmation count
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(color: Color(0xFF3b98e8)), // Set 'No' button color to #3b98e8
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ).then((_) {
      // Reset dialog visibility after dialog is closed
      _isDialogVisible = false;
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
      backgroundColor: Colors.black, // Set background color to black for full-screen effect
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
