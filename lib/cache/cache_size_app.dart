import 'package:flutter/material.dart';

void initCacheImageNetworkMemory(int byte) {
  // Size max cache to app
  PaintingBinding.instance.imageCache.maximumSizeBytes = byte;
}
