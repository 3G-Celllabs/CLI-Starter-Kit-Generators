import { Component, OnInit } from '@angular/core';
import { APP_VERSION } from 'src/environments/environment';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent implements OnInit {
  appVersion: string = APP_VERSION;

  loading = false;

  constructor() {}

  ngOnInit() {}
}
