// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';

// class RecordingPage extends StatefulWidget {
//   const RecordingPage({Key? key}) : super(key: key);

//   @override
//   _RecordingPageState createState() => _RecordingPageState();
// }

// class _RecordingPageState extends State<RecordingPage> {
//   late MyRecorder _recorder;
//   bool _isRecording = false;

//   @override
//   void initState() {
//     super.initState();
//     _recorder = MyRecorder();
//   }

//   Future<void> _toggleRecording() async {
//     if (_isRecording) {
//       await _recorder.stopRecording();
//     } else {
//       await _recorder.startRecording();
//     }
//     setState(() {
//       _isRecording = !_isRecording;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Recording Page'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _toggleRecording,
//           child: Text(_isRecording ? 'Stop Recording' : 'Start Recording'),
//         ),
//       ),
//     );
//   }
// }

// class MyRecorder {
//   late FlutterSoundRecorder _recorder;
//   late String _filePath;

//   Future<void> startRecording() async {
//     _recorder = FlutterSoundRecorder();
//     await _recorder.openAudioSession(
//       focus: AudioFocus.requestFocusAndDuckOthers,
//       category: SessionCategory.record,
//     );
//     await _recorder.startRecorder(
//       toFile: _filePath,
//       codec: Codec.mp3,
//     );
//   }

//   Future<void> stopRecording() async {
//     await FlutterSoundRecorder().stopRecorder();
//   }

//   Future<int> getAudioBytes() async {
//     // return await FlutterSound().readAsBytes(_filePath);
//     await _recorder.stopRecorder();
//     await _recorder.closeAudioSession();

//     return 1;
//   }
// }
