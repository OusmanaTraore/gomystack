import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { AlertController, ToastController } from '@ionic/angular';


@Component({
  selector: 'app-cities',
  templateUrl: './cities.page.html',
  styleUrls: ['./cities.page.scss'],
})
export class CitiesPage implements OnInit {
  cities: any= [];
  constructor(
    private router: Router,
    private http: HttpClient,
    public toastController: ToastController,
    public alertController: AlertController
  ) { }

  ngOnInit() {
    this.getCities().subscribe( res => {
      console.log('Res', res);
      this.cities = res;
    });
  }
  getCities(){
    return this.http
    .get('assets/files/cities.json')
    .pipe(
      map((res: any) => res.data)
    );
  }

  async presentToast1(){
    const toast = await this.toastController.create({
      message: 'City selectionned',
      duration:2000,
      position: 'bottom'
    });
    toast.present();
  }
  async presentAlert1(){
    const alert = await this.alertController.create({
      header: 'Supprimer la ville?',
      message: 'Ville suppprimée correctement!',
      buttons: ['ok']
    });
    await alert.present();
    const result = await alert.onDidDismiss();
    console.log(result);
  }
  async presentAlert2(){
    const alert = await this.alertController.create({
      header: 'Suppression de la ville',
      message: 'Etes-vous sur de vouloir supprimer?',
      buttons: [
        {
          text:'Non',
          handler:()=>{
            console.log('Ville non supprimée!');
          }
        },
        {
          text:'Oui',
          handler:()=>{
            console.log('Ville supprimée!');
          }
        }
      ]
    });
    await alert.present();
    const result = await alert.onDidDismiss();
    console.log(result);
  }
}
