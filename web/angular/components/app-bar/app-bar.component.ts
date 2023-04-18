import { Location } from '@angular/common';
import { Component } from '@angular/core';
import { HelperService } from 'src/app/services/helper/helper.service';

@Component({
  selector: 'app-bar',
  templateUrl: './app-bar.component.html',
  styleUrls: ['./app-bar.component.scss'],
})
export class AppBarComponent {
  constructor(private location: Location, private helper: HelperService) {}

  ngOnInit(): void {}

  handleBackButton() {
    this.location.back();
  }

  openMenu() {
    this.helper.openMenu();
  }
}
