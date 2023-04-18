import { UserDetails } from 'src/app/models/user-details';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Routes } from 'src/app/helpers/api-routes';
import { HttpService } from 'src/app/services/http/http.service';
import { EncryptionService } from 'src/app/services/encryption/encryption.service';
import { ToastService } from 'src/app/services/toast/toast.service';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  public user: Observable<UserDetails | null>;
  private user$: BehaviorSubject<UserDetails | null>;

  constructor(
    private httpService: HttpService,
    private router: Router,
    private encryptionService: EncryptionService,
    private toastService: ToastService
  ) {
    this.user$ = new BehaviorSubject<UserDetails | null>(null);

    this.user = this.user$.asObservable();
  }

  public get userData(): UserDetails | null {
    return this.user$?.value;
  }

  updateUserData(email: string | null = null, username: string | null = null) {
    const user = this.userData!;

    const userData: UserDetails = {
      username: username ?? user.username,
      authToken: user.authToken,
      email: email ?? user.email,
      role: user.role,
    };

    this.user$.next(userData as UserDetails);
  }

  login(username: string, password: string) {
    const body = {
      username,
      password: this.encryptionService.getEncryptedValue(password),
    };
    return this.httpService.postData({ route: Routes.routes.login, body }).pipe(
      map((userDetails) => {
        this.user$.next(userDetails as UserDetails);
        return userDetails as UserDetails;
      })
    );
  }

  logout(userDetails: UserDetails) {
    this.httpService.logout(userDetails).subscribe(
      (_: any) => {
        localStorage.clear();
        this.router.navigateByUrl('login');
        this.user$.next(null);
      },
      (error: any) => {
        if (error.status === 401) {
          localStorage.clear();
          this.router.navigateByUrl('login');
        } else {
          this.toastService.presentToast({
            message:
              error?.error?.detailedErrorMessage ??
              'Something went wrong. Please, try again.',
          });
        }
      }
    );
  }
}
