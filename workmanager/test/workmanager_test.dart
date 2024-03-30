import 'package:flutter_test/flutter_test.dart';
import 'package:workmanager/workmanager.dart';
import 'package:workmanager/workmanager_platform_interface.dart';
import 'package:workmanager/workmanager_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWorkmanagerPlatform
    with MockPlatformInterfaceMixin
    implements WorkmanagerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WorkmanagerPlatform initialPlatform = WorkmanagerPlatform.instance;

  test('$MethodChannelWorkmanager is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWorkmanager>());
  });

  test('getPlatformVersion', () async {
    Workmanager workmanagerPlugin = Workmanager();
    MockWorkmanagerPlatform fakePlatform = MockWorkmanagerPlatform();
    WorkmanagerPlatform.instance = fakePlatform;

    expect(await workmanagerPlugin.getPlatformVersion(), '42');
  });
}
