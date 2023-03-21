import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleService {
  static final flutterReactiveBle = FlutterReactiveBle();

  static Stream<DiscoveredDevice> scanForDevices({
    List<Uuid>? withServices,
    scanMode = ScanMode.lowLatency,
  }) {
    return flutterReactiveBle.scanForDevices(
      withServices: withServices ?? [],
      scanMode: scanMode,
    );
  }

  static Stream<ConnectionStateUpdate> connectToDevice({
    required String deviceId,
    Map<Uuid, List<Uuid>>? servicesWithCharacteristicsToDiscover,
    int timeOut = 2,
  }) {
    return flutterReactiveBle.connectToDevice(
      id: deviceId,
      servicesWithCharacteristicsToDiscover:
          servicesWithCharacteristicsToDiscover ?? {},
      connectionTimeout: Duration(seconds: timeOut),
    );
  }

  static Future<List<DiscoveredService>> discoverServices(
      {required String deviceId}) async {
    return await flutterReactiveBle.discoverServices(deviceId);
  }

  static buildCharacteristic({
    required Uuid characteristicId,
    required Uuid serviceId,
    required String deviceId,
  }) {
    return QualifiedCharacteristic(
      characteristicId: characteristicId,
      serviceId: serviceId,
      deviceId: deviceId,
    );
  }

  static Future<BleReadResponse> readDataFromDevice({
    required DiscoveredCharacteristic readChar,
    required String deviceId,
  }) async {
    final characteristic = buildCharacteristic(
      characteristicId: readChar.characteristicId,
      serviceId: readChar.serviceId,
      deviceId: deviceId,
    );
    try {
      return BleReadResponse(
          flutterReactiveBle.readCharacteristic(characteristic), null);
    } catch (e) {
      return BleReadResponse(null, e);
    }
  }

  static Future<BleWriteResponse> writeDataToDevice({
    required List<int> data,
    required DiscoveredCharacteristic writeChar,
    required String deviceId,
    bool withResponse = true,
  }) async {
    final characteristic = buildCharacteristic(
      characteristicId: writeChar.characteristicId,
      serviceId: writeChar.serviceId,
      deviceId: deviceId,
    );
    try {
      if (withResponse) {
        await flutterReactiveBle.writeCharacteristicWithResponse(
          characteristic,
          value: data,
        );
      } else {
        await flutterReactiveBle.writeCharacteristicWithoutResponse(
          characteristic,
          value: data,
        );
      }
      return BleWriteResponse(true, null);
    } catch (e) {
      return BleWriteResponse(false, e);
    }
  }

  static Stream<List<int>> subscribeToNotifyCharacteristic({
    required DiscoveredCharacteristic notifyChar,
    required String deviceId,
  }) {
    final characteristic = buildCharacteristic(
      characteristicId: notifyChar.characteristicId,
      serviceId: notifyChar.serviceId,
      deviceId: deviceId,
    );
    return flutterReactiveBle.subscribeToCharacteristic(characteristic);
  }

  // This function can be used if the data sent to device is larger in size
  // For Android the max size is 517 but 512 is optimal
  // This wouldn't work for IOS, MTU size supported in IOS is 185 bytes
  static Future<BleNegotiateMtuResponse> negotiateMtuSize({
    required String deviceId,
    required int requiredMtuSize,
  }) async {
    // There is no guarentee that the $requiredMtuSize will be set, but this operation will return the actual negotiated MTU size
    try {
      return BleNegotiateMtuResponse(
          flutterReactiveBle.requestMtu(
            deviceId: deviceId,
            mtu: requiredMtuSize,
          ),
          null);
    } catch (e) {
      return BleNegotiateMtuResponse(null, e);
    }
  }
}

class BleReadResponse {
  final Future<List<int>>? type1;
  final Object? type2;
  BleReadResponse(this.type1, this.type2);
}

class BleWriteResponse {
  final bool success;
  final Object? error;
  BleWriteResponse(this.success, this.error);
}

class BleNegotiateMtuResponse {
  final Future<int>? type1;
  final Object? type2;
  BleNegotiateMtuResponse(this.type1, this.type2);
}
