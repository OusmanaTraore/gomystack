import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-stack',
  templateUrl: './stack.page.html',
  styleUrls: ['./stack.page.scss'],
})
export class StackPage implements OnInit {
  stacks: any= [];
  names: any= [];

  constructor(
    private router: Router,
    private http: HttpClient
  ) { }

  ngOnInit() {
    this.getStack().subscribe( res => {
      console.log('Res', res);
      this.stacks = res;
    });
  }
 getStack(){
    return this.http
    .get('assets/files/stack.json')
    .pipe(
      map((res: any) => res.data)
    );
  }

}
