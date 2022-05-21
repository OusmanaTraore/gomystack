import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { SingleProductPageRoutingModule } from './single-product-routing.module';

import { SingleProductPage } from './single-product.page';
import { ComponentsModule } from 'src/app/components/components.module';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    SingleProductPageRoutingModule,
    ComponentsModule
  ],
  declarations: [SingleProductPage]
})
export class SingleProductPageModule {}
