import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { BarcodeScanner, BarcodeScannerOptions  } from '@ionic-native/barcode-scanner/ngx';

@Component({
  selector: 'app-home',
  templateUrl: './home.page.html',
  styleUrls: ['./home.page.scss'],
})
export class HomePage implements OnInit {
  scannedData: any;
  code: any;
  encodedData: '';
  encodeData: any;
  inputData: any;
  constructor(
    private router: Router,
    private barcodeScanner: BarcodeScanner
    ) { }

  ngOnInit() {
  }

  scanBarcode() {
    const options: BarcodeScannerOptions = {
      preferFrontCamera: false,
      showFlipCameraButton: true,
      showTorchButton: true,
      torchOn: false,
      prompt: 'Place a barcode inside the scan area',
      resultDisplayDuration: 500,
      formats: 'EAN_13,EAN_8,QR_CODE,PDF_417 ',
      orientation: 'portrait',
    };

    this.barcodeScanner.scan(options).then(barcodeData => {
      this.scannedData = barcodeData;
      this.code= barcodeData.text;
      console.log('Barcode data', barcodeData);
      console.log('Code text', this.code );

    }).catch(err => {
      console.log('Error', err);
    });
  }
  createBarcode() {
    this.barcodeScanner.encode(this.barcodeScanner.Encode.TEXT_TYPE, this.inputData).then((encodedData) => {
      this.encodedData = encodedData;
      console.log(encodedData);
    }, (err) => {
      console.log('Error occured : ' + err);
    });
  }
}
