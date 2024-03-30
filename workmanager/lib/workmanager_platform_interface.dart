import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'workmanager_method_channel.dart';

abstract class WorkmanagerPlatform extends PlatformInterface {
  /// Constructs a WorkmanagerPlatform.
  WorkmanagerPlatform() : super(token: _token);

  static final Object _token = Object();

  static WorkmanagerPlatform _instance = MethodChannelWorkmanager();

  /// The default instance of [WorkmanagerPlatform] to use.
  ///
  /// Defaults to [MethodChannelWorkmanager].
  static WorkmanagerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WorkmanagerPlatform] when
  /// they register themselves.
  static set instance(WorkmanagerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
