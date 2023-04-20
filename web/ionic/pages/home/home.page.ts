import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { IonicModule } from '@ionic/angular';
import { AppBarComponent } from 'src/app/components/app-bar/app-bar.component';
import { LoaderComponent } from 'src/app/components/loader/loader.component';
import { APP_VERSION } from 'src/environments/environment';

@Component({
  selector: 'app-home',
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
  standalone: true,
  imports: [IonicModule, CommonModule, AppBarComponent, LoaderComponent],
})
export class HomePage implements OnInit {
  appVersion: string = APP_VERSION;

  loading = false;

  constructor() {}

  ngOnInit() {}
}
