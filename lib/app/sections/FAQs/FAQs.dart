import 'package:evisa/app/sections/FAQs/FAQs_mobile.dart';
import 'package:evisa/app/sections/FAQs/FAQs_tab.dart';
import 'package:evisa/app/sections/FAQs/FAQs_desktop.dart';
import 'package:evisa/core/res/responsive.dart';
import 'package:flutter/material.dart';

class FAQs extends StatelessWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: FAQsMobile(),
      tablet: FAQsTab(),
      desktop: FAQsDesktop(),
    );
  }
}
