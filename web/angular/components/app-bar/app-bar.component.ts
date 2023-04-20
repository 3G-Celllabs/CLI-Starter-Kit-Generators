import { Location } from "@angular/common";
import { Component } from "@angular/core";
import { Router } from "@angular/router";
import { loginRoute } from "src/app/app-routing.module";
import { HelperService } from "src/app/services/helper/helper.service";

@Component({
  selector: "app-bar",
  templateUrl: "./app-bar.component.html",
  styleUrls: ["./app-bar.component.scss"],
})
export class AppBarComponent {
  constructor(private router: Router) {}

  ngOnInit(): void {}

  handleLogOut() {
    this.router.navigateByUrl(loginRoute);
  }
}
