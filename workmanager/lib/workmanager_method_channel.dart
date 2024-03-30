import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'workmanager_platform_interface.dart';

/// An implementation of [WorkmanagerPlatform] that uses method channels.
class MethodChannelWorkmanager extends WorkmanagerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('workmanager');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
