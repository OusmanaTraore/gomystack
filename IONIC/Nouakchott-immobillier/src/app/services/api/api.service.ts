/* eslint-disable @typescript-eslint/no-shadow */
/* eslint-disable @typescript-eslint/prefer-for-of */
import { Injectable } from '@angular/core';
import { resolve } from 'dns';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  items = [
    {id:1, name:'p1', description: 'Lorem lorem', price:20},
    {id:2, name:'p2', description: 'Lorem lorem', price:15},
    {id:3, name:'p3', description: 'Lorem lorem', price:30}
  ];

  constructor() { }

  getItems(){
    // this.items = [
    //   {id:1, name:'p1', description: 'Lorem lorem', price:20},
    //   {id:2, name:'p2', description: 'Lorem lorem', price:15}
    // ];
    // return this.items;
    return new Promise((resolve, reject) => {
      const items: any[] = [];
      for(let i = 0; i < this.items.length; i++){
        if(this.items[i].price <= 25) {
          items.push(this.items[i]);
        }
      }
      if(items.length > 0){
        resolve(items);
      } else {
        reject('High price');
      }
    });
  }
  getItem(id){
    const item = this.items.find(x=> x.id === id);
    return item;
  }
}
