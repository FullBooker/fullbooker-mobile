import 'package:flutter/material.dart';

class OldDropDownOption {
  OldDropDownOption(this.name, this.id, this.onClick);

  String id;
  String name;
  VoidCallback onClick;
}

class OldCustomDropdown extends StatefulWidget {
  const OldCustomDropdown({
    super.key,
    this.width = 340,
    this.height = 55,
    this.label = '',
    this.onClick,
    this.options = const <OldDropDownOption>[],
    this.withNullOption = true,
    this.onlyLabelContent = false,
    this.onChanged,
  });

  final Function(OldDropDownOption?)? onChanged;
  final double height;
  final String label;
  final Function? onClick;
  final bool onlyLabelContent;
  final List<OldDropDownOption> options;
  final double width;
  final bool withNullOption;

  @override
  State<StatefulWidget> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<OldCustomDropdown> {
  int focusChanged = 0;
  final FocusNode focusNode = FocusNode();
  bool selected = false;
  OldDropDownOption? setValue;

  final GlobalKey<State<StatefulWidget>> _dropdownKey = GlobalKey();

  @override
  void dispose() {
    focusNode.removeListener(functionCheckFocus);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(functionCheckFocus);
  }

  Color getHighLightColor() =>
      selected ? Theme.of(context).primaryColor : Colors.black;

  void toggleSelected() {
    setState(() {
      selected = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => openDropdown());
    });
    if (widget.onClick != null) widget.onClick!();
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

  void onChanged(OldDropDownOption? option) {
    setState(() {
      setValue = option;
      selected = false;
    });
    if (widget.onChanged != null) widget.onChanged!(option);
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<OldDropDownOption>> items =
        widget.options.map((OldDropDownOption option) {
      return DropdownMenuItem<OldDropDownOption>(
        value: option,
        onTap: option.onClick,
        child: Text(option.name),
      );
    }).toList();
    if (widget.withNullOption) {
      items.insert(
        0,
        const DropdownMenuItem<OldDropDownOption>(child: Text('----')),
      );
    }
    return GestureDetector(
      onTap: toggleSelected,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: getHighLightColor()),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 4, left: 4),
                  child: Text(widget.label),
                ),
              ),
              Offstage(
                child: DropdownButton<OldDropDownOption>(
                  key: _dropdownKey,
                  focusNode: focusNode,
                  onChanged: onChanged,
                  alignment: AlignmentDirectional.centerEnd,
                  items: items,
                ),
              ),
              if (widget.onlyLabelContent)
                const SizedBox()
              else
                setValue == null
                    ? const Expanded(child: SizedBox())
                    : Expanded(child: Center(child: Text(setValue!.name))),
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
