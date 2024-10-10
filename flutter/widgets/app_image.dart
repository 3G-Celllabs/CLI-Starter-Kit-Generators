import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.path,
    required this.fit,
    required this.imageType,
  });

  final String path;
  final BoxFit fit;
  final ImageType imageType;

  /// Builds a cached network image using the given [url]
  ///
  /// [fit] is optional and defaults to **BoxFit.contain**
  factory AppImage.network({
    required String url,
    BoxFit fit = BoxFit.contain,
  }) =>
      AppImage(
        path: url,
        fit: fit,
        imageType: ImageType.network,
      );

  /// Builds an asset image using the given [path]
  ///
  /// [fit] is optional and defaults to **BoxFit.contain**
  factory AppImage.asset({
    required String path,
    BoxFit fit = BoxFit.contain,
  }) =>
      AppImage(
        path: path,
        fit: fit,
        imageType: ImageType.asset,
      );

  /// Builds an file image using the given file [path]
  ///
  /// [fit] is optional and defaults to **BoxFit.contain**
  factory AppImage.file({
    required String path,
    BoxFit fit = BoxFit.contain,
  }) =>
      AppImage(
        path: path,
        fit: fit,
        imageType: ImageType.file,
      );

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (imageType) {
      case ImageType.network:
        widget = CachedNetworkImage(
          imageUrl: path,
          placeholder: _buildPlaceholder,
          errorWidget: _buildError,
          fit: fit,
        );
        break;
      case ImageType.asset:
        widget = Image.asset(
          path,
          fit: fit,
        );
        break;
      case ImageType.file:
        widget = Image.file(
          File.fromUri(Uri.file(path)),
          fit: fit,
        );
        break;
    }
    return widget;
  }

  Widget _buildPlaceholder(BuildContext context, String url) {
    return const CircularProgressIndicator();
  }

  Widget _buildError(BuildContext context, String url, Object error) {
    return const Icon(Icons.error);
  }
}

enum ImageType { asset, network, file }
