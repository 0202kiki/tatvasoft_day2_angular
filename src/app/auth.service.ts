import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private isAuthenticated: boolean = false;

  constructor() { }

  login(username: string, password: string): Observable<boolean> {
    // Mock authentication logic
    if (username === 'admin' && password === 'admin') {
      this.isAuthenticated = true;
      return of(true);
    } else {
      return of(false);
    }
  }

  logout() {
    this.isAuthenticated = false;
  }

  isLoggedIn(): boolean {
    return this.isAuthenticated;
  }
}
