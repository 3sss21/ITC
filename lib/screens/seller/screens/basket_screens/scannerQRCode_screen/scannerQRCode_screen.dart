import 'package:cashback_app/screens/seller/screens/basket_screens/scannerQRCode_screen/local_widgets/qrScannerOverlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerQRCodeScreen extends StatelessWidget {
  ScannerQRCodeScreen({Key? key}) : super(key: key);
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
              final String? result = barcode.rawValue!;
              debugPrint('Barcode found!' + barcode.rawValue!);
            },
          ),
          QRScannerOverlayWidget(
            overlayColour: Colors.black.withOpacity(0.5),
          ),
          Positioned(
            bottom: 30.h,
            left: 15.w,
            right: 15.w,
            child: SizedBox(
              width: 0.9.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color: Colors.white,
                    icon: ValueListenableBuilder(
                      valueListenable: cameraController.torchState,
                      builder: (context, state, child) {
                        switch (state as TorchState) {
                          case TorchState.off:
                            return const Icon(Icons.flash_off_rounded,
                                color: Colors.grey);
                          case TorchState.on:
                            return const Icon(Icons.flash_on_rounded,
                                color: Colors.yellow);
                        }
                      },
                    ),
                    iconSize: 32.0,
                    onPressed: () => cameraController.toggleTorch(),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 150.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'Отмена',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 4,
                            color: Colors.cyan[900],
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: ValueListenableBuilder(
                      valueListenable: cameraController.cameraFacingState,
                      builder: (context, state, child) {
                        switch (state as CameraFacing) {
                          case CameraFacing.front:
                            return const Icon(Icons.autorenew_rounded);
                          case CameraFacing.back:
                            return const Icon(Icons.loop_rounded);
                        }
                      },
                    ),
                    iconSize: 32.0,
                    onPressed: () => cameraController.switchCamera(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
