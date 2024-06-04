import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dokan/core/shared/extensions/theme.dart';

import '../../../../core/shared/shared.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../profile/presentation/pages/profile.dart';
import '../widgets/home_page.dart';

class DashboardPage extends StatefulWidget {
  static const String path = '/dashboard';
  static const String name = 'Dashboard';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final List<Widget> fragments;

  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.grid_view_outlined,
    Icons.shopping_cart_checkout_outlined,
    Icons.person_3_outlined,
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fragments = [
      const HomePage(),
      Container(),
      Container(),
      BlocProvider(
        create: (context) => sl<ProfileBloc>(),
        child: const ProfilePage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundColor,
          body: fragments.elementAt(currentIndex),
          floatingActionButton: CircleAvatar(
            backgroundColor: theme.buttonColor,
            radius: 24,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              elevation: 0,
              backgroundColor: theme.buttonColor,
              child: Icon(
                Icons.search_rounded,
                size: 24,
                color: theme.backgroundColor,
              ),
              onPressed: () {},
              //params
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: iconList,
            activeIndex: currentIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            leftCornerRadius: 16,
            rightCornerRadius: 16,
            onTap: (index) => setState(() => currentIndex = index),

            //other params
          ),
        );
      },
    );
  }
}
