import { CommonModule } from "@angular/common";
import { Component, OnInit } from "@angular/core";
import { AppBarComponent } from "src/app/components/app-bar/app-bar.component";
import { APP_VERSION } from "src/environments/environment";

@Component({
  selector: "app-home",
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.scss"],
  standalone: true,
  imports: [CommonModule, AppBarComponent],
})
export class HomeComponent implements OnInit {
  appVersion: string = APP_VERSION;

  loading = false;

  constructor() {}

  ngOnInit() {}
}
