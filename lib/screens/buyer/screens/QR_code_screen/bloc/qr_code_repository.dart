import 'package:cashback_app/screens/buyer/screens/QR_code_screen/bloc/qr_code_provider.dart';

class QrCodeRepository {
  getQrCode({
     String? email,
     String? username,
     int? phoneNumber,
     String? password,
     String? qrCode,
     bool? isSeller,
     double? cashbackAll,
     bool? isActive,
    
  }) {
    QrCodeProvider provider = QrCodeProvider();
    provider.getQrCode(
  
    );
    return "";
  }
}
