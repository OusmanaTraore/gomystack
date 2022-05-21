import { Component, Input, OnInit } from '@angular/core';
import { ApiService } from 'src/app/services/api/api.service';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss'],
})
export class ProductComponent implements OnInit {

  // @Input()
  items: any[];
  constructor(
    public apiService: ApiService
  ) { }

  ngOnInit() {
    this.items = this.apiService.getItems();
  }

}
