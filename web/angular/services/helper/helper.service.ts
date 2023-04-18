/* eslint-disable @typescript-eslint/quotes */
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class HelperService {
  menuData$: Subject<{ sensorName: string; sensorType: number }[]> =
    new Subject();

  constructor() {}

  getDevicePlatform(): string {
    return 'web';
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
      obj !== '' &&
      (obj?.length > 0 || Object.keys(obj).length > 0)
    );
  }

  openMenu() {
    // Implement open menu
  }
}
