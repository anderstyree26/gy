import 'package:evisa/app/sections/home/home.dart';
import 'package:evisa/core/providers/scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:evisa/core/configs/configs.dart';
import 'package:evisa/core/res/responsive.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final scrollProvider = Provider.of<ScrollProvider>(context);
    // theme
    var theme = Theme.of(context);
    //
    var textSty = TextStyle(
      color: theme.textColor,
      fontWeight: FontWeight.w100,
      fontSize: Responsive.isDesktop(context) ? 32 : 20,
    );

    // return Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Text("< ", style: textSty),
    //     Text("Sudesh", style: textSty),
    //     Text(
    //       Responsive.isDesktop(context) ? " />\t\t" : " />",
    //       style: textSty,
    //     )
    //   ],
    // );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: SizedBox(
            height: Responsive.isDesktop(context) ? 42 : 30,
              width: Responsive.isDesktop(context) ? 52 : 40,
              child: SvgPicture.asset('assets/icons/Coat_of_arms_of_Guyana.svg')),
        ),
        const SizedBox(width: 5),
        Text("Government of Guyana", style: textSty),
      ],
    );
  }
}
