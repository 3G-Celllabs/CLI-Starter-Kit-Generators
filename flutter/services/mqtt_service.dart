// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:typed_data/typed_buffers.dart';

class MqttService {
  static String mqttUrl = dotenv.get('MQTT_URL');
  static final MqttServerClient client = MqttServerClient(mqttUrl, '');

  static void setCustomConnectionMessage(
      MqttConnectMessage? connectionMessage) {
    client.connectionMessage = connectionMessage;
  }

  static void useWebSocket(int port) {
    client.useWebSocket = true;
    client.port = port;
  }

  static void setLogging({required bool on}) {
    return client.logging(on: on);
  }

  static void setOnConnectedCallback(void Function()? onConnected) {
    client.onConnected = onConnected;
  }

  static void setOnDisConnectedCallback(void Function()? onDisconnected) {
    client.onSubscribeFail;
    client.onUnsubscribed;

    client.onDisconnected = onDisconnected;
  }

  static void setOnSubscribedCallback(void Function(String)? onSubscribed) {
    client.onSubscribed = onSubscribed;
  }

  static MqttConnectionResult connect([String? username, String? password]) {
    try {
      return MqttConnectionResult(client.connect(username, password), null);
    } on NoConnectionException catch (e) {
      client.disconnect();
      return MqttConnectionResult(Future.value(null), e);
    } on SocketException catch (e) {
      client.disconnect();
      return MqttConnectionResult(Future.value(null), e);
    }
  }

  static MqttClientConnectionStatus? getConnectionStatus() {
    return client.connectionStatus;
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
    return client.publishMessage(topic, qualityOfService, data, retain: retain);
  }

  static Subscription? subscribeToTopic(
      {required String topic, MqttQos qosLevel = MqttQos.atMostOnce}) {
    return client.subscribe(topic, qosLevel);
  }

  static Stream<List<MqttReceivedMessage<MqttMessage>>>? listenForMessages() {
    return client.updates;
  }

  static void unsubscribe(
      {required String topic, dynamic expectAcknowledge = false}) {
    return client.unsubscribe(topic, expectAcknowledge: expectAcknowledge);
  }

  static void disconnect() {
    return client.disconnect();
  }
}

class MqttConnectionResult {
  final Future<MqttClientConnectionStatus?> mqttClientConnectionStatus;
  final Exception? exception;

  MqttConnectionResult(this.mqttClientConnectionStatus, this.exception);
}
