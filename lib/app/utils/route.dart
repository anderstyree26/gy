// import 'package:evisa/app/sections/FAQs/FAQs.dart';
// import 'package:evisa/app/sections/Form/Form.dart';
// import 'package:evisa/app/sections/contact/contact.dart';
// import 'package:evisa/app/sections/home/home.dart';
// import 'package:evisa/app/widgets/navbar_logo.dart';
// // import 'package:evisa/app/utils/route_names.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// const String HomeRoute = 'Home';
// const String ApplyOnlineRoute = 'Apply Online';
// const String FAQsRoute = 'FAQs';
// const String CheckStatusRoute = 'Check Status';
// const String ContactUsRoute = 'Contact Us';
//
// GoRouter router = GoRouter(
//   routes: [
//     ShellRoute(routes: [
//       GoRoute(
//           path: '/home',
//           builder: (context, state) => const HomePage(),
//       ),
//       GoRoute(
//           path: '/applyOnline',
//           builder: (context, state) => const FormSteps(),
//       ),
//       GoRoute(
//           path: '/FAQs',
//           builder: (context, state) => const FAQs(),
//       ),
//       GoRoute(
//           path: '/checkStatus',
//           builder: (context, state) => const HomePage(),
//       ),
//       GoRoute(
//           path: '/contactUs',
//           builder: (context, state) => const Contact(),
//       ),
//     ],
//       builder: (context, state, child) {
//       return NavBarLogo();
//       }
//     ),
//   ],
// );