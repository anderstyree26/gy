import 'package:evisa/app/sections/FAQs/FAQs.dart';
import 'package:evisa/app/sections/Form/Form.dart';
import 'package:evisa/app/sections/checkstatus/checkstatus.dart';
import 'package:evisa/app/sections/contact/contact.dart';
import 'package:evisa/app/sections/home/home.dart';
import 'package:flutter/material.dart';

class NavBarUtils {
  static const List<String> names = [
    'HOME',
    'APPLY ONLINE',
    'FAQS',
    'CHECK STATUS',
    'CONTACT US',
  ];

  static final List<Widget> pages = [
    HomePage(),
    FormSteps(),
    FAQs(),
    CheckStatus(),
    Contact(),
  ];

  static const List<IconData> icons = [
    Icons.home,
    Icons.paste,
    Icons.question_answer,
    Icons.verified,
    Icons.contact_page,
  ];
}
