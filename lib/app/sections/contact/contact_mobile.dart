import 'package:evisa/app/sections/Form/Form.dart';
import 'package:flutter/material.dart';
// import 'package:evisa/app/utils/contact_utils.dart';
// import 'package:evisa/app/widgets/custom_text_heading.dart';
// import 'package:evisa/changes/links.dart';
// import 'package:evisa/changes/strings.dart';
// import 'package:evisa/core/color/colors.dart';
// import 'package:evisa/core/configs/configs.dart';
// import 'package:evisa/core/util/constants.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_text_heading.dart';
import '../../utils/contact_utils.dart';
import '../../../changes/links.dart';
import '../../../changes/strings.dart';
import '../../../core/color/colors.dart';
import '../../../core/configs/configs.dart';
import '../../../core/util/constants.dart';

class ContactMobileTab extends StatelessWidget {
  const ContactMobileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Space.y(10.w)!,
        CustomSectionHeading(text: contactHeadding),
        Space.y(3.w)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomSectionSubHeading(text: contactSubHeadding),
        ),
        Space.y(5.w)!,
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FormSteps()),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
                gradient: buttonGradi, borderRadius: BorderRadius.circular(10)),
            child: const Text(
              'Apply Online',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
          ),
        ),
        // Space.y(10.w)!,
        // Wrap(
        //     alignment: WrapAlignment.center,
        //     runSpacing: 50,
        //     children: contactUtils
        //         .asMap()
        //         .entries
        //         .map((e) => IconButton(
        //               icon: Image.network(
        //                 e.value.icon,
        //                 color: theme.textColor,
        //               ),
        //               onPressed: () => openURL(e.value.url),
        //               highlightColor: Colors.white54,
        //               iconSize: 21,
        //             ))
        //         .toList()),
        Space.y(5.w)!,
        Container(color: Colors.white.withOpacity(0.2), height: 1),
      ],
    );
  }
}
