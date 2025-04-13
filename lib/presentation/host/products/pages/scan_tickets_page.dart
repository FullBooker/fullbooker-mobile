import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/core/components/custom_app_bar.dart';
import 'package:fullbooker/presentation/host/products/widgets/ticket_scan_bottom_sheet.dart';
import 'package:heroicons/heroicons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@RoutePage()
class ScanTicketsPage extends StatefulWidget {
  const ScanTicketsPage({super.key});

  @override
  State<ScanTicketsPage> createState() => _ScanTicketsPageState();
}

class _ScanTicketsPageState extends State<ScanTicketsPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool hasScanned = false;

  @override
  void reassemble() {
    super.reassemble();
    controller?.pauseCamera();
    controller?.resumeCamera();
  }

  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    qrController.scannedDataStream.listen((Barcode scanData) {
      if (!hasScanned) {
        setState(() => hasScanned = true);
        controller?.pauseCamera();
        _showValidationBottomSheet(scanData.code ?? '');
      }
    });
  }

  void _showValidationBottomSheet(String code) {
    final bool isValid = code == 'VALID_TICKET_ID';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => TicketScanBottomSheet(
        onDismiss: () {
          Navigator.pop(context);
          controller?.resumeCamera();
          setState(() => hasScanned = false);
        },
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Theme.of(context).primaryColor,
              borderRadius: 8,
              borderLength: 50,
              borderWidth: 4,
              cutOutSize: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    spacing: 16,
                    children: <Widget>[
                      InkWell(
                        onTap: () => context.router.maybePop(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .primaryColor
                                .withValues(alpha: .1),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: HeroIcon(
                            HeroIcons.xMark,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        scanTicket,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Text(
                  scanTicketCopy,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
