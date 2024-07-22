import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/extenstions.dart';
part 'text_scale_factors.freezed.dart';
part 'text_scale_factors.g.dart';

@freezed
class TextScaleFactor with _$TextScaleFactor {
  const factory TextScaleFactor.small() = _Small;
  const factory TextScaleFactor.normal() = _Normal;
  const factory TextScaleFactor.large() = _Large;

  factory TextScaleFactor.fromJson(Map<String, dynamic> json) =>
      _$TextScaleFactorFromJson(json);
}

extension TextScaleFactorX on TextScaleFactor {
  double? getTextScaleFactor(MediaQueryData mediaQuery) {
    // debugPrint(mediaQuery.toString());
    final textScaleFactor = calculateAdjustedTextScaleFactor(mediaQuery);

    return map(
        small: (_) => 0.9,
        normal: (_) => Get.locale!.isEnglish()
            ? textScaleFactor
            : textScaleFactor + (textScaleFactor * 0.03),
        large: (_) => Get.locale!.isEnglish()
            ? textScaleFactor + (textScaleFactor * 0.06)
            : textScaleFactor + (textScaleFactor * 0.1));
  }

  bool get isSmall => this == const TextScaleFactor.small();
  bool get isNormal => this == const TextScaleFactor.normal();
  bool get isLarge => this == const TextScaleFactor.large();
}

// Function to calculate adjusted text scale factor
double calculateAdjustedTextScaleFactor(MediaQueryData deviceData) {
  if (deviceData.devicePixelRatio >= 3.1) {
    return 1;
  }
  // Slope and y-intercept from the linear equation
  const double m = -0.325;
  const double b = 1.975;

  // const double m = -0.35;
  // const double b = 2.05;

  // Calculate textScaleFactor based on devicePixelRatio
  double textScaleFactor = m * deviceData.devicePixelRatio + b;

  return textScaleFactor;
}
