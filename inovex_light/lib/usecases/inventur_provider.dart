import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class InventurProvider extends ChangeNotifier {

  String _barcode = 'n/a bar-code';
  String _qrcode  = 'n/a qr-code';

  Future scanBar() async {
    try {
      _barcode = await FlutterBarcodeScanner.scanBarcode(
          "#EB003B", "Cancel", true, ScanMode.BARCODE);

      // setState(() {});

    } on MissingPluginException {
      print("Cannot scan bar-code due to missing plugin implementation");
    }

    print(_barcode);
  }

  Future scanQR() async {
    try {
      _qrcode = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);

      // setState(() {});

      notifyListeners();

    } on MissingPluginException {
      print("Cannot scan qr-code due to missing plugin implementation");
    }
    print(_qrcode);
  }
}