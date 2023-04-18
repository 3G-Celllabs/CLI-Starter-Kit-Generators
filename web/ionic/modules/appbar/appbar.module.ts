import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { IonicModule } from "@ionic/angular";
import { AppBarComponent } from "src/app/components/app-bar/app-bar.component";

@NgModule({
  declarations: [AppBarComponent],
  imports: [CommonModule, IonicModule],
  exports: [AppBarComponent],
})
export class AppbarModule {}
