import { Component } from '@angular/core';
import { NavbarComponent } from './navbar/navbar.component'; // Import the standalone component here

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  standalone: true,
  imports: [NavbarComponent] // Add the standalone component here
})
export class AppComponent {
  title = 'your-app';
}
