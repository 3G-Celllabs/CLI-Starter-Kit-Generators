import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { IonicModule } from "@ionic/angular";
import { LoaderComponent } from "src/app/components/loader/loader.component";

@NgModule({
  declarations: [LoaderComponent],
  imports: [CommonModule, IonicModule],
  exports: [LoaderComponent],
})
export class LoaderModule {}
