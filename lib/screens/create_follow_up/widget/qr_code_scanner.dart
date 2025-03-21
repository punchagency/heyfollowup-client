import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../util/color_scheme.dart';

class QrCodeScanner extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _QRCodeScannerState();

}

class _QRCodeScannerState extends State<QrCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          // Column(
          //   children: <Widget>[
          //     Expanded(
          //       flex: 5,
          //       child: QRView(
          //         key: qrKey,
          //         onQRViewCreated: _onQRViewCreated,
          //       ),
          //     ),
          //     Expanded(
          //       flex: 1,
          //       child: Center(
          //         child: (result != null)
          //             ? Text(
          //             '${result!.code}')
          //             // 'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //             : Text('Scan a code'),
          //       ),
          //     )
          //   ],
          // ),
          Positioned(
            right: 20.0,
            top: 50.0,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Card(
                shape: CircleBorder(),
                color: AppColor.kWhiteColor.withOpacity(0.7),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.close,
                    color: AppColor.kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int count = 0;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    print('created');
    controller.scannedDataStream.listen((scanData) {
      if(count == 0) {
        setState(() {
          result = scanData;
          if (result?.code != null) {
            count = 1;
            Navigator.of(context).pop('${result?.code}');
          }
        });
      }
    });
  }
}