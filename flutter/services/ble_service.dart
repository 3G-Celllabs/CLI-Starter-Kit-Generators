import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleService {
  static final _flutterReactiveBle = FlutterReactiveBle();

  static Stream<DiscoveredDevice> scanForDevices({
    List<Uuid>? withServices,
    scanMode = ScanMode.lowLatency,
  }) {
    return _flutterReactiveBle.scanForDevices(
      withServices: withServices ?? [],
      scanMode: scanMode,
    );
  }

  static Stream<ConnectionStateUpdate> connectToDevice({
    required String deviceId,
    Map<Uuid, List<Uuid>>? servicesWithCharacteristicsToDiscover,
    int timeOut = 2,
  }) {
    return _flutterReactiveBle.connectToDevice(
      id: deviceId,
      servicesWithCharacteristicsToDiscover:
          servicesWithCharacteristicsToDiscover ?? {},
      connectionTimeout: Duration(seconds: timeOut),
    );
  }

  static Future<List<DiscoveredService>> discoverServices(
      {required String deviceId}) async {
    return await _flutterReactiveBle.discoverServices(deviceId);
  }

  static QualifiedCharacteristic buildCharacteristic({
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
      Future<List<int>> readDataResponse =
          _flutterReactiveBle.readCharacteristic(characteristic);
      return BleReadResponse(readDataResponse, null);
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
        await _flutterReactiveBle.writeCharacteristicWithResponse(
          characteristic,
          value: data,
        );
      } else {
        await _flutterReactiveBle.writeCharacteristicWithoutResponse(
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
    return _flutterReactiveBle.subscribeToCharacteristic(characteristic);
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
      Future<int> requestMtuResponse = _flutterReactiveBle.requestMtu(
        deviceId: deviceId,
        mtu: requiredMtuSize,
      );
      return BleNegotiateMtuResponse(requestMtuResponse, null);
    } catch (e) {
      return BleNegotiateMtuResponse(null, e);
    }
  }
}

class BleReadResponse {
  final Future<List<int>>? result;
  final Object? exception;
  BleReadResponse(this.result, this.exception);
}

class BleWriteResponse {
  final bool success;
  final Object? exception;
  BleWriteResponse(this.success, this.exception);
}

class BleNegotiateMtuResponse {
  final Future<int>? result;
  final Object? exception;
  BleNegotiateMtuResponse(this.result, this.exception);
}
