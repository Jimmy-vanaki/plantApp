import 'package:flutter/material.dart';
import 'package:plantapp/const/constants.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            // app bar
            Positioned(
              top: 40,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Constants.themeColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    // X Button
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Constants.themeColor,
                      ),
                    ),
                  ),
                  // Share button
                  Container(
                    decoration: BoxDecoration(
                      color: Constants.themeColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    // X Button
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.share,
                        color: Constants.themeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: SizedBox(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        debugPrint("Working11 !!!");
                        MobileScanner(
                          controller: cameraController,
                          onDetect: (barcodes) {
                            debugPrint("Working !!!");
                          },
                        );
                      },
                      child: Image.asset(
                        './Assets/images/code-scan.png',
                        height: 150,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      "برای اسکن گیاه کلیک کنید.",
                      style: TextStyle(
                        color: Constants.themeColor,
                        fontFamily: 'iransans',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
