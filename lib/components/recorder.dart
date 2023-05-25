import 'dart:io';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:monfy_app/modules/comments/comments_controller.dart';
import 'package:permission_handler/permission_handler.dart';
//final pathToSaveAudio='audio_example.aac';
final pathToSaveAudio='audio_example.aac';
class SoundRecorder{
 // CommentController controller = CommentController();

  FlutterSoundRecorder? _audioRecorder;
  var _isRecorderInitalised = false;
  
  File? audioFile;

  Future _record() async{
    if(!_isRecorderInitalised) return;
    print("U Started");
    await _audioRecorder!.startRecorder(toFile: pathToSaveAudio);
  }
  Future _stop() async{
    if(!_isRecorderInitalised) return;
    final path=await _audioRecorder!.stopRecorder();
    audioFile= File(path!);
        print("U ended");
        print("Audio:  $audioFile");
  }
  Future init() async {
    _audioRecorder =FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted){
      throw RecordingPermissionException("EeeeeeeRrrrrrOoooooRrrrr");
    }

    await _audioRecorder!.openAudioSession();
    _isRecorderInitalised=true;
  }
  void dispose(){
    _audioRecorder!.closeAudioSession();
    _audioRecorder=null;
    _isRecorderInitalised=false;
  }
  Future toggleRecording() async {
    if(_audioRecorder!.isStopped)
    {await _record();}
    else{
      await _stop();
    }
  }
}