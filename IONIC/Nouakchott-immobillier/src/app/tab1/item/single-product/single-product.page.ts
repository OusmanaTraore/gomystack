import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApiService } from 'src/app/services/api/api.service';

@Component({
  selector: 'app-single-product',
  templateUrl: './single-product.page.html',
  styleUrls: ['./single-product.page.scss'],
})
export class SingleProductPage implements OnInit {
  item: any;

  constructor(
    private route: ActivatedRoute,
    public apiService: ApiService
  ) { }

  ngOnInit() {
    const id = this.route.snapshot.paramMap.get('id');
    this.item = this.apiService.getItem(id);
  }

}
