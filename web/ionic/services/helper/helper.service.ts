/* eslint-disable @typescript-eslint/quotes */
import { Injectable } from "@angular/core";
import { MenuController, Platform } from "@ionic/angular";
import { Subject } from "rxjs";
import { environment } from "src/environments/environment";

@Injectable({
  providedIn: "root",
})
export class HelperService {
  menuData$: Subject<{ sensorName: string; sensorType: number }[]> =
    new Subject();

  constructor(
    private platform: Platform,
    private menuController: MenuController
  ) {}

  getDeviceWidth() {
    return this.platform.width();
  }

  getDeviceHeight() {
    return this.platform.height();
  }

  getDevicePlatform(): string {
    if (this.platform.is("android")) {
      return "android";
    } else if (this.platform.is("ios")) {
      return "ios";
    } else {
      return "others";
    }
  }

  log(msg: any, isError = false) {
    if (environment.production) {
      return;
    }
    if (isError) {
      console.error(msg);
      return;
    }
    console.log(msg);
  }

  isWeb(): boolean {
    return !(this.platform.is("ios") || this.platform.is("android"));
  }

  isAndroid(): boolean {
    return this.platform.is("android");
  }

  isIos(): boolean {
    return this.platform.is("ios");
  }

  updateMenuData(data: { sensorName: string; sensorType: number }[]): void {
    this.menuData$.next(data);
  }

  capitalize(value: string): string {
    return value?.charAt(0).toUpperCase() + value?.slice(1);
  }

  isValidObject(obj: any): boolean {
    return (
      obj !== undefined &&
      obj !== null &&
      obj !== "" &&
      (obj?.length > 0 || Object.keys(obj).length > 0)
    );
  }

  openMenu() {
    this.menuController.enable(true, "app-menu");
    this.menuController.open("app-menu");
  }

  disableMenu() {
    this.menuController.enable(false, "app-menu");
  }
}
