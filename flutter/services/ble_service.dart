import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleService {
  static final BleService _singleton = BleService._internal();

  factory BleService() {
    return _singleton;
  }

  BleService._internal();

  final _flutterReactiveBle = FlutterReactiveBle();

  Stream<DiscoveredDevice> scanForDevices({
    List<Uuid>? withServices,
    scanMode = ScanMode.lowLatency,
  }) {
    return _flutterReactiveBle.scanForDevices(
      withServices: withServices ?? [],
      scanMode: scanMode,
    );
  }

  Stream<BleStatus> listenBleStatus() {
    return _flutterReactiveBle.statusStream;
  }

  Stream<ConnectionStateUpdate> connectedDeviceStream() {
    return _flutterReactiveBle.connectedDeviceStream;
  }

  Stream<ConnectionStateUpdate> connectToDevice({
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

//Will connect to advertising device and avoids issue of trying to connect to a device that is not is the range.
// ReadMore: https://pub.dev/packages/flutter_reactive_ble#establishing-connection
  Stream<ConnectionStateUpdate> connectToAdvertisingDevice({
    required String deviceId,
    Map<Uuid, List<Uuid>>? servicesWithCharacteristicsToDiscover,
    List<Uuid>? services,
    int prescanTimeout = 5,
    int connectionTimeout = 2,
  }) {
    return _flutterReactiveBle.connectToAdvertisingDevice(
      id: deviceId,
      withServices: services ?? [],
      prescanDuration: Duration(seconds: prescanTimeout),
      servicesWithCharacteristicsToDiscover:
          servicesWithCharacteristicsToDiscover ?? {},
      connectionTimeout: Duration(seconds: connectionTimeout),
    );
  }

  Future<List<Service>> discoverServices({required String deviceId}) async {
    try {
      await _flutterReactiveBle.discoverAllServices(deviceId);
      return await _flutterReactiveBle.getDiscoveredServices(deviceId);
    } catch (error) {
      rethrow;
    }
  }

  Future<BleReadResponse> readDataFromDevice({
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

  Future<BleWriteResponse> writeDataToDevice({
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

  Stream<List<int>> subscribeToCharacteristic({
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
  // This mostly wouldn't work for IOS. But, it would return the current MTU.
  Future<BleNegotiateMtuResponse> negotiateMtuSize({
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

  Future<void> clearAndroidGattCache({required String deviceId}) async {
    try {
      await _flutterReactiveBle.clearGattCache(deviceId);
    } catch (e) {
      rethrow;
    }
  }

  QualifiedCharacteristic buildCharacteristic({
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
