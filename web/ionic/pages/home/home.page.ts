import { Component, OnInit } from "@angular/core";
import { APP_VERSION } from "src/environments/environment";

@Component({
  selector: "app-home",
  templateUrl: "./home.page.html",
  styleUrls: ["./home.page.scss"],
})
export class HomePage implements OnInit {
  appVersion: string = APP_VERSION;

  loading = false;

  constructor() {}

  ngOnInit() {}
}
