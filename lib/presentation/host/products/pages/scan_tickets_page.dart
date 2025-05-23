import 'package:async_redux/async_redux.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullbooker/application/core/services/app_wrapper_base.dart';
import 'package:fullbooker/application/redux/actions/update_host_state_action.dart';
import 'package:fullbooker/application/redux/actions/validate_ticket_action.dart';
import 'package:fullbooker/domain/core/value_objects/app_strings.dart';
import 'package:fullbooker/presentation/host/products/widgets/ticket_scan_bottom_sheet.dart';
import 'package:fullbooker/shared/widgets/app_loading.dart';
import 'package:heroicons/heroicons.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@RoutePage()
class ScanTicketsPage extends StatefulWidget {
  const ScanTicketsPage({super.key});

  @override
  State<ScanTicketsPage> createState() => _ScanTicketsPageState();
}

class _ScanTicketsPageState extends State<ScanTicketsPage> {
  bool hasScanned = false;
  bool isValidating = false;
  final GlobalKey qrKey = GlobalKey();
  final MobileScannerController scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    detectionTimeoutMs: 3000,
  );

  void showValidationBottomSheet({
    required String code,
    required String msg,
    required bool isValid,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => TicketScanBottomSheet(
        isValid: isValid,
        code: code,
        onConfirm: () {
          Navigator.pop(context);
          setState(() {
            hasScanned = false;
            isValidating = false;
          });

          scannerController.start();
        },
      ),
    );
  }

  void onScanned(BarcodeCapture capture) {
    if (hasScanned || isValidating) return;

    scannerController.stop();

    final String? code = capture.barcodes.first.rawValue;
    if (code != null) {
      setState(() {
        hasScanned = true;
        isValidating = true;
      });

      context.dispatch(
        UpdateHostStateAction(currentScannedTicketID: code),
      );

      context.dispatch(
        ValidateTicketAction(
          client: AppWrapperBase.of(context)!.customClient,
          onResult: (bool isValid, String msg) {
            showValidationBottomSheet(
              code: code,
              isValid: isValid,
              msg: msg,
            );
          },
          onError: (String error) {
            setState(() {
              hasScanned = false;
              isValidating = false;
            });

            showValidationBottomSheet(
              code: code,
              isValid: false,
              msg: error,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          MobileScanner(
            controller: scannerController,
            onDetect: onScanned,
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
          if (isValidating)
            Container(
              color: Colors.black.withValues(alpha: 0.4),
              child: AppLoading(),
            ),
        ],
      ),
    );
  }
}
