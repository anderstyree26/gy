part of '../main_section.dart';

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final scrollProvider = Provider.of<ScrollProvider>(context);
    final navigationModel = Provider.of<NavigationModel>(context);
    // theme
    var theme = Theme.of(context);
    int currentPageIndex = 0;

    return Drawer(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Material(
            color: theme.scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: NavBarLogo()),
                  const Divider(),
                  ListTile(
                    leading: Icon(
                      state.isDarkThemeOn
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode,
                      // color: theme.textColor,
                    ),
                    title:
                        Text(state.isDarkThemeOn ? "Light Mode" : "Dark Mode"),
                    trailing: Switch(
                      value: state.isDarkThemeOn,
                      activeColor: theme.primaryColor,
                      inactiveTrackColor: Colors.grey,
                      onChanged: (newValue) {
                        context.read<ThemeCubit>().updateTheme(newValue);
                      },
                    ),
                  ),
                  const Divider(),
                  // ...NavBarUtils.names.asMap().entries.map(
                  //       (e) => Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: MaterialButton(
                  //           hoverColor: theme.primaryColor,
                  //           onPressed: () {
                  //             // scrollProvider.scrollMobile(e.key);
                  //             scrollProvider.jumpTo(e.key);
                  //             Navigator.pop(context);
                  //           },
                  //           child: ListTile(
                  //             leading: Icon(
                  //               NavBarUtils.icons[e.key],
                  //               color: theme.primaryColor,
                  //             ),
                  //             title: Text(
                  //               e.value,
                  //               // style: AppText.l1,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  Column(
                    children: [
                      NavigationBar(
                        destinations: const [
                          NavigationDestination(
                            icon: Icon(Icons.home),
                            label: 'HOME',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.paste),
                            label: 'APPLY ONLINE',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.question_answer),
                            label: 'FAQS',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.verified),
                            label: 'CHECK STATUS',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.contact_page),
                            label: 'CONTACT US',
                          ),
                        ],
                        selectedIndex: currentPageIndex,
                        onDestinationSelected: (int index) {
                          navigationModel.updateCurrentPageIndex(index);
                        },
                      ),
                    ],
                  ),
                  // ...NavBarUtils.names.map((name) {
                  //   int index = NavBarUtils.names.indexOf(name);
                  //   return Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: MaterialButton(
                  //       hoverColor: theme.primaryColor,
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(builder: (context) => NavBarUtils.pages[index]),
                  //         );
                  //       },
                  //       child: ListTile(
                  //         leading: Icon(
                  //           NavBarUtils.icons[index],
                  //           color: theme.primaryColor,
                  //         ),
                  //         title: Text(
                  //           name,
                  //           // style: AppText.l1,
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  // }).toList(),

                  Space.y(5.w)!,
                  ColorChageButton(
                    text: 'Apply Online',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FormSteps()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
