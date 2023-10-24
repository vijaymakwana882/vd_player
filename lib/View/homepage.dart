import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
//step 1. impliment dependecies chewie and video_player

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Step 2.create late controller for video or chewie
  late VideoPlayerController _controller;
  late ChewieController _ChewieController;
  late VideoPlayerController _assetscontroller;

  @override

  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    );
    _controller.initialize().then((value) {
      _ChewieController = ChewieController(videoPlayerController: _controller);

      _assetscontroller = VideoPlayerController.asset('assets/videos/honey.mp4');
      _assetscontroller.initialize().then(
            (value) => _ChewieController =
                ChewieController(videoPlayerController: _assetscontroller),
          );
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _ChewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orangeAccent.shade100),
      drawer: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Go to Home Page',
                    textAlign: TextAlign.start,
                  ),
                  tileColor: Colors.grey.shade100,
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 200,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Chewie(controller: _ChewieController),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
