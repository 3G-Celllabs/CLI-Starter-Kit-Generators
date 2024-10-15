import 'dart:async';
import 'dart:typed_data';

import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

class SerialCommService {
  static final SerialCommService _singleton = SerialCommService._internal();

  factory SerialCommService() {
    return _singleton;
  }

  SerialCommService._internal();

  UsbDevice? _device;
  UsbPort? _port;
  StreamSubscription<String>? _subscription;
  Transaction<String>? _transaction;

  UsbDevice? get device => _device;

  void listenToUsbEvents(void Function(String) inputListener) {
    UsbSerial.usbEventStream!.listen((UsbEvent event) {
      if (event.event == UsbEvent.ACTION_USB_ATTACHED) {
        try {
          getActiveDevice();
          connect(inputListener);
        } catch (e) {
          rethrow;
        }
      } else {
        _resetValues();
      }
    });
  }

  Future<void> getActiveDevice() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    if (devices.isNotEmpty) {
      _device = devices[0];
      // _device = devices.firstWhereOrNull((device)=> device.vid == 0x1d50 && device.pid == 0x6020);
    } else {
      throw _buildException(SerialExceptionTypes.device);
    }
  }

  Future<void> connect(void Function(String) inputListener) async {
    _resetValues();
    if (_device == null) {
      throw _buildException(SerialExceptionTypes.device);
    }
    _port = await _device!.create();
    if (await (_port!.open()) != true) {
      throw _buildException(SerialExceptionTypes.connection);
    }
    _transaction = Transaction.stringTerminated(
        _port!.inputStream as Stream<Uint8List>, Uint8List.fromList([13, 10]));
    _subscription = _transaction!.stream.listen((data) => inputListener(data));
  }

  Future<void> write(String data) async {
    if (_port != null) {
      await _port!.write(Uint8List.fromList(data.codeUnits));
    } else {
      throw _buildException(SerialExceptionTypes.port);
    }
  }

  SerialException _buildException(SerialExceptionTypes exception) {
    SerialException result;
    switch (exception) {
      case SerialExceptionTypes.connection:
        result = SerialException('Unable to establish connection', exception);
        break;
      case SerialExceptionTypes.device:
        result = SerialException('Device not found', exception);
        break;
      case SerialExceptionTypes.port:
        result = SerialException('Port not setup', exception);
        break;
    }
    return result;
  }

  void _resetValues() {
    _subscription?.cancel();
    if (_port != null) {
      _port!.close();
      _port = null;
    }
  }
}

enum SerialExceptionTypes {
  connection,
  device,
  port,
}

class SerialException {
  final String msg;
  final SerialExceptionTypes type;
  SerialException(this.msg, this.type);
}
