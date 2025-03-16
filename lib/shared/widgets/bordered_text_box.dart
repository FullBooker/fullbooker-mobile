import 'package:flutter/material.dart';
import 'package:fullbooker/shared/widgets/page_title.dart';

class BorderedTextBox extends StatefulWidget {
  final String label;
  final bool isOptional;
  final double height;
  final int? maxLines;

  const BorderedTextBox(
    this.label, {
    super.key,
    this.isOptional = false,
    this.height = 10,
    this.maxLines = 1,
  });

  @override
  State<StatefulWidget> createState() => BorderedTextBoxState();
}

class BorderedTextBoxState extends State<BorderedTextBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: widget.height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: Column(
            children: <Widget>[
              PageHeader(
                '',
                widget.label,
                withLogo: false,
                pageDescriptionPadding: 0,
                pageTitleBottomPadding: 0,
                headerPadding: 0,
                headerTopPadding: 0,
                pageDescriptionTopPadding: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: widget.maxLines,
                  cursorHeight: 18,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
