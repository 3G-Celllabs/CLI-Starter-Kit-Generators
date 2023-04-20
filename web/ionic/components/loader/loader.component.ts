import { Component, OnInit } from "@angular/core";
import { IonicModule } from "@ionic/angular";

@Component({
  selector: "app-loader",
  templateUrl: "./loader.component.html",
  styleUrls: ["./loader.component.scss"],
  standalone: true,
  imports: [IonicModule],
})
export class LoaderComponent implements OnInit {
  constructor() {}

  ngOnInit() {}
}
