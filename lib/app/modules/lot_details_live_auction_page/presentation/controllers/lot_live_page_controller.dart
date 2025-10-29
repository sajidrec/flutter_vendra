import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LotLivePageController extends GetxController {
  late VideoPlayerController videoController;
  bool isInitialized = false;

  @override
  void onInit() {
    super.onInit();

    videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    )
      ..initialize().then((_) {
        isInitialized = true;
        update(); // refresh GetBuilder
        videoController.play(); // optional: auto-play
      });
  }

  void playPauseVideo() {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
    }
    update();
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
