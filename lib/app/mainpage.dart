// import 'package:evisa/app/sections/FAQs/FAQs.dart';
// import 'package:evisa/app/sections/Form/Form.dart';
// import 'package:evisa/app/sections/checkstatus/checkstatus.dart';
// import 'package:evisa/app/sections/contact/contact.dart';
// import 'package:evisa/app/sections/home/home.dart';
// import 'package:evisa/app/utils/navbar_utils.dart';
// import 'package:evisa/app/widgets/color_chage_btn.dart';
// import 'package:evisa/app/widgets/navbar_logo.dart';
// import 'package:evisa/core/configs/app.dart';
// import 'package:evisa/core/configs/others/space.dart';
// import 'package:evisa/core/providers/drawer_provider.dart';
// import 'package:evisa/core/res/responsive.dart';
// import 'package:evisa/core/theme/cubit/theme_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
//
// class MainPage extends StatefulWidget {
//   const MainPage ({Key? key}): super(key: key);
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int currentPageIndex = 0;
//   List<Widget> body = [
//     const HomePage(),
//     const FormSteps(),
//     const FAQs(),
//     const CheckStatus(),
//     const Contact(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     App.init(context);
//     final drawerProvider = Provider.of<DrawerProvider>(context);
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       // key: drawerProvider.key,
//       extendBodyBehindAppBar: true,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(120),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             NavigationBar(
//                 destinations: const [
//                   NavigationDestination(
//                     icon: Icon(Icons.home),
//                     label: 'HOME',
//                   ),
//                   NavigationDestination(
//                     icon: Icon(Icons.paste),
//                     label: 'APPLY ONLINE',
//                   ),
//                   NavigationDestination(
//                     icon: Icon(Icons.question_answer),
//                     label: 'FAQS',
//                   ),
//                   NavigationDestination(
//                     icon: Icon(Icons.verified),
//                     label: 'CHECK STATUS',
//                   ),
//                   NavigationDestination(
//                     icon: Icon(Icons.contact_page),
//                     label: 'CONTACT US',
//                   ),
//                 ],
//                 selectedIndex: currentPageIndex,
//                 onDestinationSelected: (int index) {
//                   setState(() {
//                     currentPageIndex = index;
//                   });
//                 },
//             ),
//           ],
//         ),
//       ),
//       drawer: !Responsive.isDesktop(context) ? const _MobileDrawer() : null,
//       body: body[currentPageIndex],
//     );
//   }
// }
//
// class _MobileDrawer extends StatelessWidget {
//   const _MobileDrawer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // final scrollProvider = Provider.of<ScrollProvider>(context);
//     // theme
//     var theme = Theme.of(context);
//     return Drawer(
//       child: BlocBuilder<ThemeCubit, ThemeState>(
//         builder: (context, state) {
//           return Material(
//             color: theme.scaffoldBackgroundColor,
//             child: Padding(
//               padding: EdgeInsets.only(top: 2.h),
//               child: Column(
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Center(child: NavBarLogo()),
//                   const Divider(),
//                   ListTile(
//                     leading: Icon(
//                       state.isDarkThemeOn
//                           ? Icons.dark_mode_outlined
//                           : Icons.light_mode,
//                       // color: theme.textColor,
//                     ),
//                     title:
//                     Text(state.isDarkThemeOn ? "Light Mode" : "Dark Mode"),
//                     trailing: Switch(
//                       value: state.isDarkThemeOn,
//                       activeColor: theme.primaryColor,
//                       inactiveTrackColor: Colors.grey,
//                       onChanged: (newValue) {
//                         context.read<ThemeCubit>().updateTheme(newValue);
//                       },
//                     ),
//                   ),
//                   const Divider(),
//                   // ...NavBarUtils.names.asMap().entries.map(
//                   //       (e) => Padding(
//                   //         padding: const EdgeInsets.all(8.0),
//                   //         child: MaterialButton(
//                   //           hoverColor: theme.primaryColor,
//                   //           onPressed: () {
//                   //             // scrollProvider.scrollMobile(e.key);
//                   //             scrollProvider.jumpTo(e.key);
//                   //             Navigator.pop(context);
//                   //           },
//                   //           child: ListTile(
//                   //             leading: Icon(
//                   //               NavBarUtils.icons[e.key],
//                   //               color: theme.primaryColor,
//                   //             ),
//                   //             title: Text(
//                   //               e.value,
//                   //               // style: AppText.l1,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   ...NavBarUtils.names.map((name) {
//                     int index = NavBarUtils.names.indexOf(name);
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: MaterialButton(
//                         hoverColor: theme.primaryColor,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => NavBarUtils.pages[index]),
//                           );
//                         },
//                         child: ListTile(
//                           leading: Icon(
//                             NavBarUtils.icons[index],
//                             color: theme.primaryColor,
//                           ),
//                           title: Text(
//                             name,
//                             // style: AppText.l1,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//
//                   Space.y(5.w)!,
//                   ColorChageButton(
//                     text: 'Apply Online',
//                     onTap: () {
//                       Navigator.pop(context);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const FormSteps()),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
