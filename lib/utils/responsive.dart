import 'package:flutter/material.dart';

class ResponsiveUtil {
  static bool isFoldPhone(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > 600 && width < 900; // Fold phones unfolded
  }

  static bool isFlipPhone(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return height < 700 && width < 400; // Flip phones folded
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 900;
  }

  static double getResponsiveWidth(BuildContext context, double normalSize) {
    if (isFoldPhone(context)) {
      return normalSize * 1.5;
    } else if (isFlipPhone(context)) {
      return normalSize * 0.9;
    }
    return normalSize;
  }

  static double getResponsiveHeight(BuildContext context, double normalSize) {
    if (isFlipPhone(context)) {
      return normalSize * 0.8;
    }
    return normalSize;
  }

  static double getResponsiveFontSize(BuildContext context, double normalSize) {
    if (isFoldPhone(context)) {
      return normalSize * 1.2;
    } else if (isFlipPhone(context)) {
      return normalSize * 0.9;
    }
    return normalSize;
  }

  static EdgeInsets getResponsivePadding(BuildContext context, EdgeInsets normal) {
    if (isFoldPhone(context)) {
      return normal * 1.5;
    } else if (isFlipPhone(context)) {
      return normal * 0.8;
    }
    return normal;
  }
}