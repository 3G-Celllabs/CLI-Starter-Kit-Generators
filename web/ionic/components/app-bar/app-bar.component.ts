import { Component, Input, OnInit } from "@angular/core";
import { Location } from "@angular/common";
import { HelperService } from "src/app/services/helper/helper.service";

@Component({
  selector: "app-bar",
  templateUrl: "./app-bar.component.html",
  styleUrls: ["./app-bar.component.scss"],
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
