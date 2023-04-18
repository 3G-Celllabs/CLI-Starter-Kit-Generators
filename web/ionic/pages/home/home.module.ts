import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { FormsModule } from "@angular/forms";

import { IonicModule } from "@ionic/angular";

import { HomePageRoutingModule } from "./home-routing.module";

import { HomePage } from "./home.page";
import { LoaderModule } from "src/app/modules/loader/loader.module";
import { AppbarModule } from "src/app/modules/appbar/appbar.module";

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    LoaderModule,
    HomePageRoutingModule,
    AppbarModule,
  ],
  declarations: [HomePage],
})
export class HomePageModule {}
