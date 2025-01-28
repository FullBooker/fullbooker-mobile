import 'package:flutter/material.dart';
import 'package:fullbooker/shared/widgets/divider.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String pageDescription;

  const PageHeader(this.title, this.pageDescription, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        const Image(image: AssetImage("assets/logo_splash.png")),
        Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 10),
            child: Text(pageDescription,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center)),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: const RoundedDivider(height: 2, color: Color(0xf0AE4808)))
      ]),
    );
  }
}
