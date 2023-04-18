import { Injectable } from '@angular/core';
import { ToastController } from '@ionic/angular';
import { HelperService } from 'src/app/services/helper/helper.service';

@Injectable({
  providedIn: 'root',
})
export class ToastService {
  toast!: HTMLIonToastElement;
  constructor(
    private toastController: ToastController,
    private helper: HelperService
  ) {}

  async presentToast({
    message,
    position = 'bottom',
    duration = 2000,
    cssClass = 'toast-danger',
  }: ToastParams) {
    message = this.retrieveMessage(cssClass, message);
    try {
      this.toast.dismiss();
    } catch (e) {
      this.helper.log(e, true);
    }
    this.toast = await this.toastController.create({
      message,
      duration,
      cssClass,
      keyboardClose: true,
      position,
    });
    this.toast.present();
  }

  retrieveMessage(cssClass: string, msg: string): string {
    if (cssClass === 'toast-success') {
      return `<ion-icon name="checkmark-done-circle"></ion-icon> ${msg}`;
    } else if (cssClass === 'toast-warning') {
      return `<ion-icon name="warning"></ion-icon> ${msg}`;
    } else if (cssClass === 'toast-info') {
      return `<ion-icon name="information-circle"></ion-icon> ${msg}`;
    }
    return `<ion-icon name="alert-circle"></ion-icon> ${msg}`;
  }

  async closeToast(): Promise<void> {
    try {
      const currentToast = await this.toastController.getTop();
      if (currentToast) {
        this.toastController.dismiss();
      }
    } catch (e) {
      this.helper.log(e);
    }
  }
}

interface ToastParams {
  message: string;
  position?: 'bottom' | 'middle' | 'top';
  duration?: number;
  cssClass?: 'toast-success' | 'toast-danger' | 'toast-warning' | 'toast-info';
}
