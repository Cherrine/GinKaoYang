import { Component } from '@angular/core';

@Component({
  selector: 'app-theme-toggle',
  templateUrl: './theme-toggle.component.html',
  styleUrls: ['./theme-toggle.component.css'],
})
export class ThemeToggleComponent {
  isSynthwave: boolean = false;

  toggleTheme() {
    this.isSynthwave = !this.isSynthwave;
    const theme = this.isSynthwave ? 'synthwave' : 'light';
    document.documentElement.setAttribute('data-theme', theme);
  }
}
