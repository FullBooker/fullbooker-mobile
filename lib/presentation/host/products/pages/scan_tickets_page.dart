import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/host/products/widgets/ticket_scan_bottom_sheet.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@RoutePage()
class ScanTicketsPage extends StatefulWidget {
  const ScanTicketsPage({super.key});

  @override
  State<ScanTicketsPage> createState() => _ScanTicketsPageState();
}

class _ScanTicketsPageState extends State<ScanTicketsPage> {
  final GlobalKey qrKey = GlobalKey();
  bool hasScanned = false;

  void _showValidationBottomSheet(String code) {
    final bool isValid = code == 'VALID_TICKET_ID';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => TicketScanBottomSheet(
        isValid: isValid,
        onDismiss: () {
          Navigator.pop(context);
          setState(() => hasScanned = false);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          MobileScanner(
            onDetect: (BarcodeCapture capture) {
              if (hasScanned) return;
              final String? code = capture.barcodes.first.rawValue;
              if (code != null) {
                setState(() => hasScanned = true);
                _showValidationBottomSheet(code);
              }
            },
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
