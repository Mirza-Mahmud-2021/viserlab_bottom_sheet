import 'package:flutter/material.dart';
import 'package:viserlab_bottom_sheet/bottom_sheet_types/ios_style_bottom_sheet.dart';
import 'bottom_sheet_types.dart';

class ViserLabBottomSheet {

  final Widget child;
  final Color backgroundColor;
  final bool allSideMargin;
  double? elevation;
  final bool enableDrag;
  final bool isDismissible;
  final double radius;
  BottomSheetTypes? bottomSheetTypes;
  String? bottomSheetTitle;

  ViserLabBottomSheet({
    this.backgroundColor = Colors.white,
    this.allSideMargin = false,
    this.elevation,
    this.enableDrag = true,
    this.isDismissible = true,
    this.radius = 15,
    required this.child,
    this.bottomSheetTypes = BottomSheetTypes.customBottomSheet,
    this.bottomSheetTitle
  });

  void viserLabBottomSheet(BuildContext context, {
    AnimationController? transitionController,
    Offset? anchorPoint,
  }) {
    showModalBottomSheet(
      isDismissible: isDismissible,
      anchorPoint: anchorPoint,
      elevation: elevation,
      enableDrag: enableDrag,
      transitionAnimationController: transitionController,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 50),
          curve: Curves.decelerate,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            margin: allSideMargin ? const EdgeInsets.all(15) : EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.12
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: allSideMargin ? BorderRadius.circular(radius) : BorderRadius.vertical(top: Radius.circular(radius))
            ),
            child: buildBottomSheet()
          )
        ),
      )
    );
  }

  buildBottomSheet() {
    if(bottomSheetTypes == BottomSheetTypes.customBottomSheet){
      return child;
    }
    else if(bottomSheetTypes == BottomSheetTypes.iosBottomSheet){
      return IosStyleBottomSheet(child: child);
    }
    else if(bottomSheetTypes == BottomSheetTypes.androidBottomSheet){
      return ;
    }
  }
}
