import 'package:evisa/app/utils/navbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:evisa/core/animations/entrance_fader.dart';
import 'package:evisa/core/color/colors.dart';
import 'package:evisa/core/configs/configs.dart';
import 'package:evisa/core/providers/scroll_provider.dart';
import 'package:provider/provider.dart';

class NavBarActionButton extends StatefulWidget {
  final String label;
  final List<Widget> pages;
  const NavBarActionButton({
    Key? key,
    required this.label,
    required this.pages,
  }) : super(key: key);

  @override
  State<NavBarActionButton> createState() => _NavBarActionButtonState();
}

class _NavBarActionButtonState extends State<NavBarActionButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    int index = NavBarUtils.names.indexOf(widget.label);
    // theme
    var theme = Theme.of(context);
    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple : null,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onHover: (value) {
            setState(() => isHover = value);
          },
          onTap: () {
            // scrollProvider.jumpTo(widget.index);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.pages[index]),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              widget.label,
              style: TextStyle(color: theme.textColor),
            ),
          ),
        ),
      ),
    );
  }
}
