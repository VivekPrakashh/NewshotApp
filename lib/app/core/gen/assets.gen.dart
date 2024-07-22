/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/alert.mp3
  String get alert => 'assets/audio/alert.mp3';

  /// File path: assets/audio/happy-pop-1-185286.mp3
  String get happyPop1185286 => 'assets/audio/happy-pop-1-185286.mp3';

  /// List of all assets
  List<String> get values => [alert, happyPop1185286];
}

class $AssetsGifGen {
  const $AssetsGifGen();

  /// File path: assets/gif/CompleteGIF.gif
  AssetGenImage get completeGIF =>
      const AssetGenImage('assets/gif/CompleteGIF.gif');

  /// List of all assets
  List<AssetGenImage> get values => [completeGIF];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/download.png
  AssetGenImage get download =>
      const AssetGenImage('assets/images/download.png');

  /// File path: assets/images/google-play.png
  AssetGenImage get googlePlay =>
      const AssetGenImage('assets/images/google-play.png');

  /// File path: assets/images/ic_notification_icon.png
  AssetGenImage get icNotificationIcon =>
      const AssetGenImage('assets/images/ic_notification_icon.png');

  /// File path: assets/images/ios-download.png
  AssetGenImage get iosDownload =>
      const AssetGenImage('assets/images/ios-download.png');

  /// File path: assets/images/logo.jpeg
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.jpeg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [download, googlePlay, icNotificationIcon, iosDownload, logo];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/Vault.json
  String get vault => 'assets/lottie/Vault.json';

  /// File path: assets/lottie/all-done.json
  String get allDone => 'assets/lottie/all-done.json';

  /// File path: assets/lottie/error-404.json
  String get error404 => 'assets/lottie/error-404.json';

  /// File path: assets/lottie/language.json
  String get language => 'assets/lottie/language.json';

  /// File path: assets/lottie/lock.json
  String get lock => 'assets/lottie/lock.json';

  /// File path: assets/lottie/not_items.json
  String get notItems => 'assets/lottie/not_items.json';

  /// File path: assets/lottie/rating-head.json
  String get ratingHead => 'assets/lottie/rating-head.json';

  /// File path: assets/lottie/rating.json
  String get rating => 'assets/lottie/rating.json';

  /// File path: assets/lottie/right_emoji.json
  String get rightEmoji => 'assets/lottie/right_emoji.json';

  /// File path: assets/lottie/star.json
  String get star => 'assets/lottie/star.json';

  /// File path: assets/lottie/success1.json
  String get success1 => 'assets/lottie/success1.json';

  /// File path: assets/lottie/success10.json
  String get success10 => 'assets/lottie/success10.json';

  /// File path: assets/lottie/success11.json
  String get success11 => 'assets/lottie/success11.json';

  /// File path: assets/lottie/success12.json
  String get success12 => 'assets/lottie/success12.json';

  /// File path: assets/lottie/success13.json
  String get success13 => 'assets/lottie/success13.json';

  /// File path: assets/lottie/success14.json
  String get success14 => 'assets/lottie/success14.json';

  /// File path: assets/lottie/success2.json
  String get success2 => 'assets/lottie/success2.json';

  /// File path: assets/lottie/success3.json
  String get success3 => 'assets/lottie/success3.json';

  /// File path: assets/lottie/success4.json
  String get success4 => 'assets/lottie/success4.json';

  /// File path: assets/lottie/success5.json
  String get success5 => 'assets/lottie/success5.json';

  /// File path: assets/lottie/success6.json
  String get success6 => 'assets/lottie/success6.json';

  /// File path: assets/lottie/success7.json
  String get success7 => 'assets/lottie/success7.json';

  /// File path: assets/lottie/success8.json
  String get success8 => 'assets/lottie/success8.json';

  /// File path: assets/lottie/success9.json
  String get success9 => 'assets/lottie/success9.json';

  /// File path: assets/lottie/tap-animation.json
  String get tapAnimation => 'assets/lottie/tap-animation.json';

  /// File path: assets/lottie/tap-animation00.json
  String get tapAnimation00 => 'assets/lottie/tap-animation00.json';

  /// File path: assets/lottie/theme.json
  String get theme => 'assets/lottie/theme.json';

  /// List of all assets
  List<String> get values => [
        vault,
        allDone,
        error404,
        language,
        lock,
        notItems,
        ratingHead,
        rating,
        rightEmoji,
        star,
        success1,
        success10,
        success11,
        success12,
        success13,
        success14,
        success2,
        success3,
        success4,
        success5,
        success6,
        success7,
        success8,
        success9,
        tapAnimation,
        tapAnimation00,
        theme
      ];
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsGifGen gif = $AssetsGifGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
