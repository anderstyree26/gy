part of '../main_section.dart';

class _NavbarDesktop extends StatefulWidget {
  const _NavbarDesktop({Key? key}) : super(key: key);

  @override
  State<_NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<_NavbarDesktop> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // theme
    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
        color: theme.navBarColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavBarLogo(),
            Row(
              children: [
                Space.xm!,
                // ...NavBarUtils.names.map((name) {
                //   int index = NavBarUtils.names.indexOf(name);
                //   return NavBarActionButton(
                //     label: name,
                //     pages: NavBarUtils.pages,
                //   );
                // }).toList(),
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
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                ),
                // Space.x!,
                InkWell(
                    onTap: () {
                      context.read<ThemeCubit>().updateTheme(!state.isDarkThemeOn);
                    },
                    child: Image.network(
                      state.isDarkThemeOn ? IconUrls.darkIcon : IconUrls.lightIcon,
                      height: 30,
                      width: 30,
                      color: state.isDarkThemeOn ? Colors.black : Colors.white,
                    )),
              ],
            ),
            // Space.x!,
          ],
        ),
      );
    });
  }
}

class _NavBarTablet extends StatelessWidget {
  const _NavBarTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    var theme = Theme.of(context);
    return Container(
      color: theme.navBarColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
      child: Row(
        children: [
          IconButton(
            highlightColor: Colors.white54,
            onPressed: () {
              drawerProvider.key.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          Space.xm!,
          const NavBarLogo(),
          // Space.x1!,
        ],
      ),
    );
  }
}
