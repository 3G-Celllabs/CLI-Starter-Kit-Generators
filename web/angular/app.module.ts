import { NgModule } from "@angular/core";
import { BrowserModule } from "@angular/platform-browser";
import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";
import { HttpClientModule } from "@angular/common/http";
import { HomeComponent } from "./pages/home/home.component";
import { SplashComponent } from "./pages/splash/splash.component";
import { LoginComponent } from "./pages/login/login.component";
import { AppbarModule } from "./modules/appbar/appbar.module";

@NgModule({
  declarations: [AppComponent, SplashComponent, LoginComponent, HomeComponent],
  imports: [BrowserModule, AppRoutingModule, HttpClientModule, AppbarModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
