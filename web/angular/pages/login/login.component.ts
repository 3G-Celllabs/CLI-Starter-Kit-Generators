import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormGroup, Validators } from "@angular/forms";
import { Router } from "@angular/router";
import { homeRoute } from "src/app/app.routes";
import { AuthService } from "src/app/services/auth/auth.service";
import { APP_VERSION, environment } from "src/environments/environment";

@Component({
  selector: "app-login",
  templateUrl: "./login.component.html",
  styleUrls: ["./login.component.scss"],
  standalone: true,
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  appVersion: string = APP_VERSION;

  constructor(
    private authService: AuthService,
    private formBuilder: FormBuilder,
    private router: Router
  ) {
    if (this.authService.userData) {
      // this.router.navigateByUrl(homeRoute);
    }
    this.loginForm = this.formBuilder.group({
      userId: ["", [Validators.required]],
      password: ["", Validators.required],
    });
  }

  ngOnInit() {
    this.loginForm?.reset();
    if (!environment.production) {
    }
  }

  handleLogin() {
    this.router.navigateByUrl(homeRoute);
    //  Implement logic
  }
}
