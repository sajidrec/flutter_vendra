import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PipOverlay extends StatefulWidget {
  final VideoPlayerController videoController;
  final VoidCallback onClose;

  const PipOverlay({
    super.key,
    required this.videoController,
    required this.onClose,
  });

  @override
  State<PipOverlay> createState() => _PipOverlayState();
}

class _PipOverlayState extends State<PipOverlay> {
  Offset position = Offset(16.w, 100.h);
  Size pipSize = Size(150.w, 100.h);
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            isDragging = true;
            position = Offset(
              (position.dx + details.delta.dx).clamp(
                0.0,
                MediaQuery.of(context).size.width - pipSize.width,
              ),
              (position.dy + details.delta.dy).clamp(
                0.0,
                MediaQuery.of(context).size.height - pipSize.height,
              ),
            );
          });
        },
        onPanEnd: (_) {
          setState(() {
            isDragging = false;
          });
          _snapToEdge();
        },
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            width: pipSize.width,
            height: pipSize.height,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: AspectRatio(
                    aspectRatio: widget.videoController.value.aspectRatio,
                    child: VideoPlayer(widget.videoController),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: widget.onClose,
                    child: Container(
                      padding: EdgeInsets.all(4.sp),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: GestureDetector(
                    onTap: () {
                      widget.onClose();
                      // Return to full screen
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.sp),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.fullscreen,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _snapToEdge() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    setState(() {
      // Snap to nearest horizontal edge
      if (position.dx < screenWidth / 2) {
        position = Offset(16.w, position.dy);
      } else {
        position = Offset(screenWidth - pipSize.width - 16.w, position.dy);
      }

      // Keep within vertical bounds
      position = Offset(
        position.dx,
        position.dy.clamp(
          80.h,
          screenHeight - pipSize.height - 16.h,
        ),
      );
    });
  }
}