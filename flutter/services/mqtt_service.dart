// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:typed_data/typed_buffers.dart';

class MqttService {
  static final MqttService _singleton = MqttService._internal();

  factory MqttService() {
    return _singleton;
  }

  MqttService._internal();

  final MqttServerClient _client = MqttServerClient(dotenv.get('MQTT_URL'), '');

  void setCustomConnectionMessage(MqttConnectMessage? connectionMessage) {
    _client.connectionMessage = connectionMessage;
  }

  void useWebSocket(int port) {
    _client.useWebSocket = true;
    _client.port = port;
  }

  void setLogging({required bool on}) {
    return _client.logging(on: on);
  }

  void setOnConnectedCallback(void Function()? onConnected) {
    _client.onConnected = onConnected;
  }

  void setOnDisConnectedCallback(void Function()? onDisconnected) {
    _client.onDisconnected = onDisconnected;
  }

  void setOnSubscribedCallback(void Function(String)? onSubscribed) {
    _client.onSubscribed = onSubscribed;
  }

  void setOnSubscribeFailCallback(void Function(String)? onSubscribeFail) {
    _client.onSubscribeFail = onSubscribeFail;
  }

  void setOnUnsubscribedCallback(void Function(String?)? onUnsubscribed) {
    _client.onUnsubscribed = onUnsubscribed;
  }

  MqttConnectionResult connect([String? username, String? password]) {
    try {
      return MqttConnectionResult(_client.connect(username, password), null);
    } on NoConnectionException catch (e) {
      _client.disconnect();
      return MqttConnectionResult(Future.value(null), e);
    } on SocketException catch (e) {
      _client.disconnect();
      return MqttConnectionResult(Future.value(null), e);
    }
  }

  MqttClientConnectionStatus? getConnectionStatus() {
    return _client.connectionStatus;
  }

  Uint8Buffer? buildMessageToPublish(var value) {
    final builder = MqttClientPayloadBuilder();
    if (value.runtimeType == String) {
      builder.addString(value);
    } else if (value.runtimeType == int) {
      builder.addInt(value);
    } else if (value.runtimeType == double) {
      builder.addDouble(value);
    } else if (value.runtimeType == bool) {
      builder.addBool(val: value);
    }
    return builder.payload;
  }

  int publishMessage({
    required String topic,
    required Uint8Buffer data,
    MqttQos qualityOfService = MqttQos.exactlyOnce,
    bool retain = false,
  }) {
    return _client.publishMessage(topic, qualityOfService, data,
        retain: retain);
  }

  Subscription? subscribeToTopic(
      {required String topic, MqttQos qosLevel = MqttQos.atMostOnce}) {
    return _client.subscribe(topic, qosLevel);
  }

  Stream<List<MqttReceivedMessage<MqttMessage>>>? listenForMessages() {
    return _client.updates;
  }

  void unsubscribe({required String topic, dynamic expectAcknowledge = false}) {
    return _client.unsubscribe(topic, expectAcknowledge: expectAcknowledge);
  }

  void disconnect() {
    return _client.disconnect();
  }
}

class MqttConnectionResult {
  final Future<MqttClientConnectionStatus?> mqttClientConnectionStatus;
  final Exception? exception;

  MqttConnectionResult(this.mqttClientConnectionStatus, this.exception);
}
