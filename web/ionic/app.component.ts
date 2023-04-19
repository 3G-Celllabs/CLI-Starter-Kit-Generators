import { Component } from "@angular/core";
import { IonicModule } from "@ionic/angular";
import { MenuComponent } from "./components/menu/menu.component";
import { HttpClientModule } from "@angular/common/http";

@Component({
  selector: "app-root",
  templateUrl: "app.component.html",
  styleUrls: ["app.component.scss"],
  standalone: true,
  imports: [IonicModule, HttpClientModule, MenuComponent],
})
export class AppComponent {
  constructor() {}
}
