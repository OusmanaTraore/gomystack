import { Component, OnDestroy, OnInit } from '@angular/core';
import { ApiService } from 'src/app/services/api/api.service';

@Component({
  selector: 'app-item',
  templateUrl: './item.page.html',
  styleUrls: ['./item.page.scss'],
})
export class ItemPage implements OnInit,OnDestroy {

  items: any =[];

  constructor(
    public apiService: ApiService
  ) { }

  ngOnInit() {
    console.log('ngOnInit');
    this.items = this.apiService.getItems();
    //   {id:1, name:'p1', description: 'Lorem lorem', price:20},
    //   {id:2, name:'p2', description: 'Lorem lorem', price:15}
    // ];
  }

  ionViewWillEnter(){
    console.log(' ionViewWillEnter');
  }

  ionViewDidEnter(){
    console.log('ionViewDidEnter');
  }
  ionViewWillLeave(){
    console.log(' ionViewWillLeave');
  }
  ionViewDidLeave(){
    console.log(' ionViewDidLeave');
  }

  ngOnDestroy() {
    console.log(' ngOnDestroy');
  }
}

