import { CommonModule, Location } from "@angular/common";
import { Component } from "@angular/core";

@Component({
  selector: "app-bar",
  templateUrl: "./app-bar.component.html",
  styleUrls: ["./app-bar.component.scss"],
  standalone: true,
  imports: [CommonModule],
})
export class AppBarComponent {
  constructor(private location: Location) {}

  ngOnInit(): void {}

  handleLogOut() {
    this.location.back();
  }
}
