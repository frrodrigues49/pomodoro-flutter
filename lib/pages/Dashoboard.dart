import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:audioplayers/audioplayers.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  AudioPlayer? player;

  _runAudio(String path) async {
    try {
      await player?.play(AssetSource(path));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    player = AudioPlayer();   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tocar MP3"), centerTitle: true),
      body: Container(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            _runAudio('som.mp3');
          }, child: Text('Tocar'))
      ],),),
    );
  }
}