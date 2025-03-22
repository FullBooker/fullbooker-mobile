import 'package:flutter/material.dart';

class DropDownOption {
  String name;
  String id;
  VoidCallback onClick;

  DropDownOption(this.name, this.id, this.onClick);
}

class TitledDropdown extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final List<DropDownOption> options;
  final Function(DropDownOption?)? onChanged;

  const TitledDropdown({
    super.key,
    this.width = 340,
    this.height = 55,
    this.title = '',
    this.options = const <DropDownOption>[],
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _TitledDropDownState();
}

class _TitledDropDownState extends State<TitledDropdown> {
  bool selected = false;
  final GlobalKey<State<StatefulWidget>> _dropdownKey = GlobalKey();
  final FocusNode focusNode = FocusNode();
  int focusChanged = 0;
  DropDownOption? setValue;

  Color getHighlightColor() =>
      selected ? const Color(0xf0F58C4A) : const Color(0xf0000000);

  void toggleSelected() {
    setState(() {
      selected = true;
      if (widget.options.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) => openDropdown());
      }
    });
  }

  void openDropdown() {
    GestureDetector? detector;
    void searchForGestureDetector(BuildContext element) {
      element.visitChildElements((Element element) {
        if (element.widget is GestureDetector) {
          detector = element.widget as GestureDetector;
        } else {
          searchForGestureDetector(element);
        }
      });
    }

    searchForGestureDetector(_dropdownKey.currentContext!);
    assert(detector != null);

    detector!.onTap!();
  }

  void functionCheckFocus() {
    setState(() {
      if (!selected) {
        focusChanged = 0;
      }
      if (selected) {
        focusChanged += 1;
        if (focusChanged > 2) {
          selected = false;
          focusChanged = 0;
        }
      }
    });
  }

  void onChanged(DropDownOption? option) {
    setState(() {
      setValue = option;
      selected = false;
    });
    if (widget.onChanged != null) widget.onChanged!(option);
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(functionCheckFocus);
  }

  @override
  void dispose() {
    focusNode.removeListener(functionCheckFocus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<DropDownOption>> items =
        widget.options.map((DropDownOption option) {
      return DropdownMenuItem<DropDownOption>(
        value: option,
        onTap: option.onClick,
        child: Text(option.name),
      );
    }).toList();
    items.insert(
      0,
      const DropdownMenuItem<DropDownOption>(child: Text('----')),
    );
    return GestureDetector(
      onTap: toggleSelected,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: DecoratedBox(
          decoration:
              BoxDecoration(border: Border.all(color: getHighlightColor())),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Center(
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              VerticalDivider(color: getHighlightColor(), width: 2),
              Offstage(
                child: DropdownButton<DropDownOption>(
                  key: _dropdownKey,
                  focusNode: focusNode,
                  onChanged: onChanged,
                  alignment: AlignmentDirectional.centerEnd,
                  items: items,
                ),
              ),
              if (setValue == null)
                const Expanded(child: SizedBox())
              else
                Expanded(child: Center(child: Text(setValue!.name))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  !selected
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
