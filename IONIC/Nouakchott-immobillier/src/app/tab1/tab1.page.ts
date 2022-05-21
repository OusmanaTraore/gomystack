import { Component, OnDestroy, OnInit } from '@angular/core';
import { NavigationExtras, Router } from '@angular/router';
import { NavController } from '@ionic/angular';

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page implements OnInit, OnDestroy {
  id = 1;

  constructor(
    public router: Router,
    public navCtrl: NavController
  ) {}

    ngOnInit() {
      console.log('Tab1Page ngOnInit');
    }

    ionViewWillEnter(){
      console.log('Tab1Page ionViewWillEnter');
    }

    ionViewDidEnter(){
      console.log('Tab1Page ionViewDidEnter');
    }
    ionViewWillLeave(){
      console.log('Tab1Page ionViewWillLeave');
    }
    ionViewDidLeave(){
      console.log('Tab1Page ionViewDidLeave');
    }

  redirect(){
    // this.router.navigateByUrl('/tabs', {replaceUrl: true});
    const data = { name: 'abc', id: this.id };
    const navData: NavigationExtras = {
      queryParams: {
        data: JSON.stringify(data)
      }
    };
     // this.router.navigate(['/', 'tabs', 'items' , this.id], navData);
    //  this.navCtrl.navigateForward('/tabs/items' + this.id, navData);
    this.router.navigate(['/', 'tabs','item' ,this.id],navData);
}
ngOnDestroy() {
  console.log('Tab1Page ngOnDestroy');
}

}
