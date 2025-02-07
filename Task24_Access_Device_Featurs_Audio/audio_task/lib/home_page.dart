import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class AudioRecorderScreen extends StatefulWidget {
  const AudioRecorderScreen({super.key});

  @override
  State<AudioRecorderScreen> createState() => _AudioRecorderScreenState();
}

class _AudioRecorderScreenState extends State<AudioRecorderScreen> {
  // Recorder object will be initialized in init state.
  late AudioRecorder recorder;

  // Player object will be initialized in init state.
  late AudioPlayer player;

// boolean to track recording state
  bool isRecording = false;

//String stores the final audio path.
  String? audiopath;

  @override
  void initState() {
    super.initState();
    recorder = AudioRecorder();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    recorder.dispose();
    player.dispose();
    super.dispose();
  }

  // Generate file path will be passed to recorder using path provider package
  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/my_audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
  }

  // Start recording audio using sound package
  Future<void> startRecording() async {
    if (await recorder.hasPermission()) {
      String path = await _getFilePath();
      await recorder.start(RecordConfig(), path: path);
      setState(() {
        isRecording = true;
      });
    }
  }

  // Stop recording audio
  Future<void> stopRecording() async {
    String? path = await recorder.stop();
    setState(() {
      isRecording = false;
      audiopath = path;
    });
  }

  // Play the recorded audio using audio player package
  Future<void> playRecord() async {
    await player.play(UrlSource(audiopath!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Made Audio Recorder :)'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          recordingButton(),
          if (isRecording) Text("Recording...."),
          if (audiopath != null && !isRecording)
            FilledButton(
                onPressed: () {
                  playRecord();
                },
                child: Text("Play Audio"))
        ]),
      ),
    );
  }

  // Widget to handle start/stop recording button
  Widget recordingButton() {
    return !isRecording
        ? FilledButton(
            onPressed: () {
              startRecording();
            },
            child: Text("Start Recording"))
        : FilledButton(
            onPressed: () {
              stopRecording();
            },
            child: Text("Stop Recording"));
  }
}
