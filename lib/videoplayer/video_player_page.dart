import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoPath;

  const VideoPlayerPage({Key? key, required this.videoPath}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  bool _isDialogVisible = false; // Track if the dialog is already visible
  int _confirmationCount = 0;

  @override
  void initState() {
    super.initState();

    // Set immersive mode for full screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _controller = VideoPlayerController.asset(
      widget.videoPath,
    )
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration && !_isDialogVisible) {
        _isDialogVisible = true;
        //_showVideoEndDialog();

        // pop up yes/no button solution
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) _showVideoEndDialog();
        });

      }
    });
  }

  // Show dialog when video ends
  void _showVideoEndDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF282828),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Do you want to watch the video again?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
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

                      // Ensure immersive mode is set when replaying
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                            return VideoPlayerPage(
                              videoPath: widget.videoPath,
                            );
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Color(0xFF3b98e8)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      _isDialogVisible = false;
                      _confirmationCount = 0;
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(color: Color(0xFF3b98e8)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ).then((_) {
      _isDialogVisible = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    // Restore system UI overlays when leaving full-screen mode
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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