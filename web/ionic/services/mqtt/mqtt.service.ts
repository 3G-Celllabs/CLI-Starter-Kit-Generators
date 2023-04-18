import { Injectable, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { IMqttMessage, MqttService } from 'ngx-mqtt';
import { HelperService } from 'src/app/services/helper/helper.service';

@Injectable({
  providedIn: 'root',
})
export class CMqttService implements OnDestroy {
  private subscription: Subscription | null = null;

  constructor(
    private mqttService: MqttService,
    private helper: HelperService
  ) {}

  ngOnDestroy(): void {
    this.unsubscribe();
  }

  subscribe(topic: string): void {
    this.helper.log(`Subscribing to ${topic}`);
    this.subscription = this.mqttService
      .observe(topic, { qos: 1 })
      .subscribe((message: IMqttMessage) => {
        const msgTopic = message.topic;
        const msgPayload = message.payload.toString();
        this.parseMessage(msgTopic, msgPayload);
      });
  }

  publish(topic: string, message: string): void {
    this.helper.log(`message sent ${topic}: ${message}`);
    this.mqttService.unsafePublish(topic, message, { qos: 0, retain: false });
  }

  unsubscribe() {
    this.helper.log('Mqtt Unsubscribed.');
    this.subscription?.unsubscribe();
  }

  private parseMessage(topic: string, payload: string) {
    this.helper.log(`message recieved: ${topic}: ${payload}`);
  }
}
