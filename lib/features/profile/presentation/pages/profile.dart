import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:expandable/expandable.dart';

import '../../../../core/shared/shared.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  "My account",
                  style: context.textStyle20Medium(
                    color: const Color(0xff222455),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                CircleAvatar(
                  minRadius: 48,
                  child: PhysicalModel(
                    color: theme.white,
                    shape: BoxShape.circle,
                    elevation: 4,
                    child: CachedNetworkImage(
                      width: context.photoWidth,
                      height: context.photoHeight,
                      imageUrl: "context.currentUser?.photo ?? " "",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Center(
                        child: Image.asset(
                          "icons/person.png",
                          color: theme.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  "John Smith",
                  style: context
                      .textStyle20Medium(
                        color: theme.textPrimary,
                      )
                      .copyWith(fontWeight: FontWeight.bold, height: 1.2),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "info@johnsmith.com",
                  style: context.textStyle12Medium(
                    color: theme.textSecondary,
                  ),
                ),
                const SizedBox(height: 40),
                PhysicalModel(
                  color: theme.white,
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        ExpandablePanel(
                          theme: ExpandableThemeData(
                            iconColor: theme.textPrimary,
                            expandIcon: Icons.arrow_forward_ios_outlined,
                            iconSize: 18,
                            collapseIcon: Icons.arrow_downward_outlined,
                          ),
                          collapsed: const Text(""),
                          expanded: ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                dense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                visualDensity: VisualDensity.compact,
                                leading: const Icon(
                                  Icons.person_outline_rounded,
                                  color: Color(0xFF7C8592),
                                  size: 24,
                                ),
                                title: Text(
                                  "Profile",
                                  style: context.textStyle17Medium(
                                    color: theme.textPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          header: Text(
                            "Account",
                            style: context.textStyle17Medium(
                              color: theme.textPrimary,
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          visualDensity: VisualDensity.compact,
                          leading: Image.asset(
                            "icons/person.png",
                            color: const Color(0xFF7C8592),
                            scale: 1.8,
                          ),
                          title: Text(
                            "Account",
                            style: context.textStyle17Medium(
                              color: theme.textPrimary,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: theme.iconColor,
                          ),
                          onTap: () {},
                        ),
                        const Divider(
                          color: Color(0xFF7C8592),
                          thickness: .5,
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          visualDensity: VisualDensity.compact,
                          leading: const Icon(
                            Icons.lock_outline_rounded,
                            color: Color(0xFF7C8592),
                            size: 24,
                          ),
                          title: Text(
                            "Password",
                            style: context.textStyle17Medium(
                              color: theme.textPrimary,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: theme.iconColor,
                          ),
                          onTap: () {},
                        ),
                        const Divider(
                          color: Color(0xFF7C8592),
                          thickness: .5,
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          visualDensity: VisualDensity.compact,
                          leading: const Icon(
                            Icons.notifications_outlined,
                            color: Color(0xFF7C8592),
                            size: 24,
                          ),
                          title: Text(
                            "Notification",
                            style: context.textStyle17Medium(
                              color: theme.textPrimary,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: theme.iconColor,
                          ),
                          onTap: () {},
                        ),
                        const Divider(
                          color: Color(0xFF7C8592),
                          thickness: .5,
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          visualDensity: VisualDensity.compact,
                          leading: const Icon(
                            Icons.favorite_border_outlined,
                            size: 24,
                            color: Color(0xFF7C8592),
                          ),
                          title: RichText(
                              text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Wishlist",
                                style: context.textStyle17Medium(
                                  color: theme.textPrimary,
                                ),
                              ),
                              TextSpan(
                                text: " (00)",
                                style: context.textStyle14Medium(
                                  color: theme.textSecondary,
                                ),
                              ),
                            ],
                          )),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: theme.iconColor,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
