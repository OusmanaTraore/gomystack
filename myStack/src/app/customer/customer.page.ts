import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-customer',
  templateUrl: './customer.page.html',
  styleUrls: ['./customer.page.scss'],
})
export class CustomerPage implements OnInit {
  users: any= [];
  permission: boolean;
  searchedUser: any;

  constructor(
    private router: Router,
    private http: HttpClient
    ) { }

  ngOnInit() {
    this.permission = true;
    this.getUsers().subscribe( res => {
      console.log('Res', res);
      this.users = res;
      this.searchedUser = this.users;
    });

  }

   gotoHome(){
     this.router.navigate(['/home']);
   }
   getUsers(){
     return this.http
     .get('assets/files/customers.json')
     .pipe(
       map((res: any) => res.data)
     );
   }
   serachCustomer(event){
     const text= event.target.value;
     this.searchedUser = this.users;
     if(text && text.trim() !== ''){
       this.searchedUser = this.searchedUser
       .filter((user: any) =>(user.name.toLowerCase().indexOf(text.toLowerCase()) > -1));
     }

   }

  doRefresh(event) {
    this.getUsers();
    console.log('Begin async operation');

    setTimeout(() => {
      console.log('Async operation has ended');
      event.target.complete();
    }, 2000);
  }

  }
