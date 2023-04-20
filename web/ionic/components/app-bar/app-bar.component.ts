import { Component, Input, OnInit } from "@angular/core";
import { CommonModule, Location } from "@angular/common";
import { HelperService } from "src/app/services/helper/helper.service";
import { IonicModule } from "@ionic/angular";

@Component({
  selector: "app-bar",
  templateUrl: "./app-bar.component.html",
  styleUrls: ["./app-bar.component.scss"],
  standalone: true,
  imports: [IonicModule, CommonModule],
})
export class AppBarComponent implements OnInit {
  @Input() removeBorder = false;

  constructor(private location: Location, private helper: HelperService) {}

  ngOnInit() {}

  handleBackButton() {
    this.location.back();
  }

  openMenu() {
    this.helper.openMenu();
  }
}
