import 'package:flutter/material.dart';

class TicketScanBottomSheet extends StatelessWidget {
  const TicketScanBottomSheet({
    super.key,
    this.isValid = false,
    required this.onDismiss,
  });
  final bool isValid;
  final Function() onDismiss;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Tick icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.shade50,
            ),
            child: Icon(
              Icons.verified,
              color: Theme.of(context).primaryColor,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),

          // Title
          Text(
            isValid ? 'Valid Ticket' : 'Invalid Ticket',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isValid ? Colors.orange : Colors.red,
                ),
          ),

          const SizedBox(height: 16),

          // Ticket info block
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: <Widget>[
                // Avatar initials
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange.shade50,
                  ),
                  child: Text(
                    'AO', // Replace with initials logic
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Ticket info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text('Abiud Orina', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),
                    Text(
                      'VVIP',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // CTA Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onDismiss,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'Scan Another Ticket',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
