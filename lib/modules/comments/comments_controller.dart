import 'dart:io';
import 'package:get/get.dart';
import 'package:monfy_app/components/recorder.dart';
import 'package:monfy_app/models/suggest_user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monfy_app/modules/comments/comments_service.dart';
import 'package:audioplayers/audioplayers.dart';


class CommentController extends GetxController{
  var isRecording = false.obs;
  final recorder  = SoundRecorder();
  final audioPlayer = AudioPlayer();
  var isPlaying =false.obs;
  Duration duration =Duration.zero;
  Duration position =Duration.zero;
  ////////////////////////////////////////
  var id;
  var isloading=false.obs;
  var isloadingComments=false.obs;
  CommentService service= CommentService();
////////////////////////////////////////////////////
  final picker = ImagePicker();
  var image;
  String? str="";
  var imagepick;
  var isPicPathSet=false.obs;
  var PicPath="".obs;
  bool? addpostStatus;
  Future getImage(ImageSource src) async{
    imagepick = await picker.getImage(source: src);

    if(imagepick != null)
    {
      image = File (imagepick.path);

    }
    else{
      image;
      print("No Image Selected");

    }
    update();
  }
 
  //////////////////////////////////////////
  User? me;
  var Comments=[];

  @override
  void onInit() async{
    //setAudio();
    id=Get.arguments;
    pre();

    super.onInit();
     recorder.init();
     audioPlayer.onPlayerStateChanged.listen((state) {
          isPlaying.value = state == PlayerState.PLAYING;
     });
     audioPlayer.onDurationChanged.listen((newDuration) {
        duration = newDuration;
     });
     audioPlayer.onAudioPositionChanged.listen((newPosition) { 
      position = newPosition;
     });
  }
  @override
  void dispose() async{
     recorder.dispose();
    super.dispose();
  }
  @override
  void onReady() async{
    GetComments();
    super.onReady();
  }
  @override
  void onClose() {
    Get.delete();
    super.onClose();
  }
  Future setAudio() async{
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }
  
 // InternalFinalCallback<void> get onDelete => super.onDelete;
  void pre(){
    print("Hello comment");
    print(id);
  }
  Future<void>AddComment()
  async{
    isloading(true);
    isloadingComments(true);
    if(recorder.audioFile != null)
      {
        addpostStatus= await service.AddComment(recorder.audioFile!,str!,id);
      }
    else if(image != null)
      {
        addpostStatus= await service.AddComment(image!,str!,id);
      }
    else{
      addpostStatus= await service.AddComment1(str!,id);
    }
    isloading(false);
    isloadingComments(false);

  }
  Future<void>GetComments()
  async{
    Comments = await service.GetComments(id);

    isloading(false);
    isloadingComments(false);

    print(image);
  }
  Future<void>GetComments1()
  async{
    Comments = await service.GetComments(id);

    isloadingComments(false);
  }
  Future<void>DeleteComment(int id)
  async{
    isloading(true);
    isloadingComments(true);
    await service.DeleteComment(id);
    isloading(false);
    isloadingComments(false);
  }
   
}