import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<Map<String, dynamic>> get deviceInfo async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  // ignore: unnecessary_statements
  MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  final Size size =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  Map<String, dynamic> deviceData = <String, dynamic>{};

  deviceData['screen_size'] = {
    'height': size.height,
    'width': size.width,
  };
  try {
    deviceData['package_info'] = _readPackageInfo(packageInfo);
    if (kIsWeb) {
      deviceData['web_info'] =
          _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
    } else {
      deviceData['platform'] = Platform.operatingSystem;
      deviceData['os_version'] = Platform.operatingSystemVersion;
      deviceData['locale'] = Platform.localeName;

      if (Platform.isAndroid) {
        deviceData['android_info'] =
            _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData['ios_info'] =
            _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      } else if (Platform.isLinux) {
        deviceData['linux_info'] =
            _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
      } else if (Platform.isMacOS) {
        deviceData['mac_info'] =
            _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
      } else if (Platform.isWindows) {
        deviceData['windows_info'] =
            _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
      }
    }
  } on PlatformException {
    deviceData = <String, dynamic>{'Error:': 'Failed to get platform version.'};
  }

  return deviceData;
}

Map<String, dynamic> _readPackageInfo(final PackageInfo info) =>
    <String, dynamic>{
      'appName': info.appName,
      'buildNumber': info.buildNumber,
      'buildSignature': info.buildSignature,
      'packageName': info.packageName,
      'version': info.version,
    };

Map<String, dynamic> _readAndroidBuildData(final AndroidDeviceInfo build) =>
    <String, dynamic>{
      'id': build.id,
      'manufacturer': build.manufacturer,
      'brand': build.brand,
      'model': build.model,
      'device': build.device,
      'version': build.version.toString(),
      'isPhysicalDevice': build.isPhysicalDevice,
      'board': build.board,
      'bootloader': build.bootloader,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'systemFeatures': build.systemFeatures,
    };

Map<String, dynamic> _readIosDeviceInfo(final IosDeviceInfo data) =>
    <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname': {
        'sysname': data.utsname.sysname,
        'nodename': data.utsname.nodename,
        'release': data.utsname.release,
        'version': data.utsname.version,
        'machine': data.utsname.machine,
      },
    };

Map<String, dynamic> _readLinuxDeviceInfo(final LinuxDeviceInfo data) =>
    <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };

Map<String, dynamic> _readWebBrowserInfo(final WebBrowserInfo data) =>
    <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };

Map<String, dynamic> _readMacOsDeviceInfo(final MacOsDeviceInfo data) =>
    <String, dynamic>{
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };

Map<String, dynamic> _readWindowsDeviceInfo(final WindowsDeviceInfo data) =>
    <String, dynamic>{
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
    };

bool isBigMobileScreen(final Size size) => size.height > 680;
