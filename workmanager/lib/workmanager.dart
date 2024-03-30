
import 'workmanager_platform_interface.dart';

class Workmanager {
  Future<String?> getPlatformVersion() {
    return WorkmanagerPlatform.instance.getPlatformVersion();
  }
}
