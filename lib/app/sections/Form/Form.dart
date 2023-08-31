import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:evisa/app/sections/Form/account.dart';
import 'package:evisa/app/sections/Form/auth.dart';
import 'package:evisa/app/sections/Form/fileManager.dart';
import 'package:evisa/app/sections/Form/form_desktop.dart';
import 'package:evisa/app/sections/Form/form_mobile.dart';
import 'package:evisa/app/sections/Form/form_tab.dart';
import 'package:flutter/material.dart';
import 'package:evisa/core/res/responsive.dart';

class FormSteps extends StatefulWidget {
  const FormSteps({Key? key}) : super(key: key);
  @override
  State<FormSteps> createState() => _FormStepsState();
}

class _FormStepsState extends State<FormSteps> {

  @override
  Widget build(BuildContext context) {
    return  const Responsive(
      mobile: FormMobile(),
      tablet: FormTab(),
      desktop: FormDesktop(),
    );
  }
}
