import { Location } from "@angular/common";
import { Component, OnInit } from "@angular/core";
import { IonicModule, MenuController } from "@ionic/angular";

@Component({
  selector: "app-menu",
  templateUrl: "./menu.component.html",
  styleUrls: ["./menu.component.scss"],
  standalone: true,
  imports: [IonicModule],
})
export class MenuComponent implements OnInit {
  constructor(private menu: MenuController, private location: Location) {}

  ngOnInit() {}

  closeMenu() {
    this.menu.close("app-menu");
  }

  handleClick() {
    // Handle click on menu item
  }

  handleSignOut() {
    this.closeMenu();
    this.location.back();
  }
}
