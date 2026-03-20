// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsDataGen {
  const $AssetsDataGen();

  /// File path: assets/data/experience.json
  String get experience => 'assets/data/experience.json';

  /// File path: assets/data/projects.json
  String get projects => 'assets/data/projects.json';

  /// File path: assets/data/skills.json
  String get skills => 'assets/data/skills.json';

  /// List of all assets
  List<String> get values => [experience, projects, skills];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/android-icon.svg
  SvgGenImage get androidIcon =>
      const SvgGenImage('assets/images/android-icon.svg');

  /// File path: assets/images/angular-icon.svg
  SvgGenImage get angularIcon =>
      const SvgGenImage('assets/images/angular-icon.svg');

  /// File path: assets/images/app-store-icon.svg
  SvgGenImage get appStoreIcon =>
      const SvgGenImage('assets/images/app-store-icon.svg');

  /// File path: assets/images/dart-lang.png
  AssetGenImage get dartLang =>
      const AssetGenImage('assets/images/dart-lang.png');

  /// File path: assets/images/elfie-logo.png
  AssetGenImage get elfieLogo =>
      const AssetGenImage('assets/images/elfie-logo.png');

  /// File path: assets/images/essilor-logo-vector.png
  AssetGenImage get essilorLogoVector =>
      const AssetGenImage('assets/images/essilor-logo-vector.png');

  /// File path: assets/images/flutter_logo.svg
  SvgGenImage get flutterLogo =>
      const SvgGenImage('assets/images/flutter_logo.svg');

  /// File path: assets/images/github-logo.svg
  SvgGenImage get githubLogo =>
      const SvgGenImage('assets/images/github-logo.svg');

  /// File path: assets/images/google-play-icon.png
  AssetGenImage get googlePlayIcon =>
      const AssetGenImage('assets/images/google-play-icon.png');

  /// File path: assets/images/hubble-icon.svg
  SvgGenImage get hubbleIcon =>
      const SvgGenImage('assets/images/hubble-icon.svg');

  /// File path: assets/images/hywallet-icon.png
  AssetGenImage get hywalletIcon =>
      const AssetGenImage('assets/images/hywallet-icon.png');

  /// File path: assets/images/ios-icon.svg
  SvgGenImage get iosIcon => const SvgGenImage('assets/images/ios-icon.svg');

  /// File path: assets/images/js-icon.svg
  SvgGenImage get jsIcon => const SvgGenImage('assets/images/js-icon.svg');

  /// File path: assets/images/linkedin-icon.svg
  SvgGenImage get linkedinIcon =>
      const SvgGenImage('assets/images/linkedin-icon.svg');

  /// File path: assets/images/nextjs-icon.png
  AssetGenImage get nextjsIcon =>
      const AssetGenImage('assets/images/nextjs-icon.png');

  /// File path: assets/images/node-icon.svg
  SvgGenImage get nodeIcon => const SvgGenImage('assets/images/node-icon.svg');

  /// File path: assets/images/pq_splash.png
  AssetGenImage get pqSplash =>
      const AssetGenImage('assets/images/pq_splash.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/react-icon.svg
  SvgGenImage get reactIcon =>
      const SvgGenImage('assets/images/react-icon.svg');

  /// File path: assets/images/restoration-ai-icon.png
  AssetGenImage get restorationAiIcon =>
      const AssetGenImage('assets/images/restoration-ai-icon.png');

  /// File path: assets/images/restoration-ai.png
  AssetGenImage get restorationAi =>
      const AssetGenImage('assets/images/restoration-ai.png');

  /// File path: assets/images/rocket.gltf
  String get rocket => 'assets/images/rocket.gltf';

  /// File path: assets/images/skype-icon.svg
  SvgGenImage get skypeIcon =>
      const SvgGenImage('assets/images/skype-icon.svg');

  /// File path: assets/images/skype.png
  AssetGenImage get skype => const AssetGenImage('assets/images/skype.png');

  /// File path: assets/images/telegram-icon.svg
  SvgGenImage get telegramIcon =>
      const SvgGenImage('assets/images/telegram-icon.svg');

  /// File path: assets/images/transwap-logo.png
  AssetGenImage get transwapLogo =>
      const AssetGenImage('assets/images/transwap-logo.png');

  /// File path: assets/images/truckster.png
  AssetGenImage get truckster =>
      const AssetGenImage('assets/images/truckster.png');

  /// File path: assets/images/web-icon.svg
  SvgGenImage get webIcon => const SvgGenImage('assets/images/web-icon.svg');

  /// List of all assets
  List<dynamic> get values => [
        androidIcon,
        angularIcon,
        appStoreIcon,
        dartLang,
        elfieLogo,
        essilorLogoVector,
        flutterLogo,
        githubLogo,
        googlePlayIcon,
        hubbleIcon,
        hywalletIcon,
        iosIcon,
        jsIcon,
        linkedinIcon,
        nextjsIcon,
        nodeIcon,
        pqSplash,
        profile,
        reactIcon,
        restorationAiIcon,
        restorationAi,
        rocket,
        skypeIcon,
        skype,
        telegramIcon,
        transwapLogo,
        truckster,
        webIcon
      ];
}

class Assets {
  const Assets._();

  static const $AssetsDataGen data = $AssetsDataGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
