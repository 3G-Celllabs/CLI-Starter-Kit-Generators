// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:typed_data/typed_buffers.dart';

class MqttService {
  static final String _mqttUrl = dotenv.get('MQTT_URL');
  static final MqttServerClient _client = MqttServerClient(_mqttUrl, '');

  static void setCustomConnectionMessage(
      MqttConnectMessage? connectionMessage) {
    _client.connectionMessage = connectionMessage;
  }

  static void useWebSocket(int port) {
    _client.useWebSocket = true;
    _client.port = port;
  }

  static void setLogging({required bool on}) {
    return _client.logging(on: on);
  }

  static void setOnConnectedCallback(void Function()? onConnected) {
    _client.onConnected = onConnected;
  }

  static void setOnDisConnectedCallback(void Function()? onDisconnected) {
    _client.onDisconnected = onDisconnected;
  }

  static void setOnSubscribedCallback(void Function(String)? onSubscribed) {
    _client.onSubscribed = onSubscribed;
  }

  static void setOnSubscribeFailCallback(void Function(String)? onSubscribeFail) {
        _client.onSubscribeFail = onSubscribeFail;
  }

  static void setOnUnsubscribedCallback(void Function(String)? onUnsubscribed) {
    _client.onUnsubscribed = onUnsubscribed;
  }

  static MqttConnectionResult connect([String? username, String? password]) {
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

  static MqttClientConnectionStatus? getConnectionStatus() {
    return _client.connectionStatus;
  }

  static Uint8Buffer? buildMessageToPublish(var value) {
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

  static int publishMessage({
    required String topic,
    required Uint8Buffer data,
    MqttQos qualityOfService = MqttQos.exactlyOnce,
    bool retain = false,
  }) {
    return _client.publishMessage(topic, qualityOfService, data, retain: retain);
  }

  static Subscription? subscribeToTopic(
      {required String topic, MqttQos qosLevel = MqttQos.atMostOnce}) {
    return _client.subscribe(topic, qosLevel);
  }

  static Stream<List<MqttReceivedMessage<MqttMessage>>>? listenForMessages() {
    return _client.updates;
  }

  static void unsubscribe(
      {required String topic, dynamic expectAcknowledge = false}) {
    return _client.unsubscribe(topic, expectAcknowledge: expectAcknowledge);
  }

  static void disconnect() {
    return _client.disconnect();
  }
}

class MqttConnectionResult {
  final Future<MqttClientConnectionStatus?> mqttClientConnectionStatus;
  final Exception? exception;

  MqttConnectionResult(this.mqttClientConnectionStatus, this.exception);
}
