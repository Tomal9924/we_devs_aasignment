import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:expandable/expandable.dart';

import '../../../../core/shared/shared.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _emailController = TextEditingController();
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
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    children: [
                      ExpandablePanel(
                        theme: ExpandableThemeData(
                          hasIcon: true,
                          iconColor: theme.iconColor,
                          expandIcon: Icons.arrow_forward_ios_outlined,
                          iconSize: 18,
                          collapseIcon: Icons.keyboard_arrow_down_sharp,
                        ),
                        collapsed: const Text(""),
                        expanded: SizedBox(
                          height: 300,
                          child: ListView(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            children: [
                              Text(
                                "Email",
                                style: context.textStyle14Medium(
                                    color: theme.iconColor),
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyles.body(
                                  context: context,
                                  color: theme.textPrimary,
                                ),
                                cursorColor: theme.textSecondary,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  fillColor: theme.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: .5, color: theme.iconColor),
                                      borderRadius: BorderRadius.circular(16)),
                                  prefixIcon: Icon(Icons.person,
                                      color: theme.textSecondary),
                                  contentPadding: const EdgeInsets.all(16),
                                  hintText: "email",
                                  hintStyle: TextStyles.body(
                                      context: context,
                                      color: theme.textSecondary),
                                  helperStyle: TextStyles.caption(
                                      context: context,
                                      color: theme.errorColor),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Full name",
                                style: context.textStyle14Medium(
                                    color: theme.iconColor),
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyles.body(
                                  context: context,
                                  color: theme.textPrimary,
                                ),
                                cursorColor: theme.textSecondary,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  fillColor: theme.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: .5, color: theme.iconColor),
                                      borderRadius: BorderRadius.circular(16)),
                                  prefixIcon: Icon(Icons.person,
                                      color: theme.textSecondary),
                                  contentPadding: const EdgeInsets.all(16),
                                  hintText: "email",
                                  hintStyle: TextStyles.body(
                                      context: context,
                                      color: theme.textSecondary),
                                  helperStyle: TextStyles.caption(
                                      context: context,
                                      color: theme.errorColor),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Street address",
                                style: context.textStyle14Medium(
                                    color: theme.iconColor),
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyles.body(
                                  context: context,
                                  color: theme.textPrimary,
                                ),
                                cursorColor: theme.textSecondary,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  fillColor: theme.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: .5, color: theme.iconColor),
                                      borderRadius: BorderRadius.circular(16)),
                                  prefixIcon: Icon(Icons.person,
                                      color: theme.textSecondary),
                                  contentPadding: const EdgeInsets.all(16),
                                  hintText: "email",
                                  hintStyle: TextStyles.body(
                                      context: context,
                                      color: theme.textSecondary),
                                  helperStyle: TextStyles.caption(
                                      context: context,
                                      color: theme.errorColor),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Apt,Suit,bldg (Optional)",
                                style: context.textStyle14Medium(
                                    color: theme.iconColor),
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyles.body(
                                  context: context,
                                  color: theme.textPrimary,
                                ),
                                cursorColor: theme.textSecondary,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  fillColor: theme.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: .5, color: theme.iconColor),
                                      borderRadius: BorderRadius.circular(16)),
                                  prefixIcon: Icon(Icons.person,
                                      color: theme.textSecondary),
                                  contentPadding: const EdgeInsets.all(16),
                                  hintText: "email",
                                  hintStyle: TextStyles.body(
                                      context: context,
                                      color: theme.textSecondary),
                                  helperStyle: TextStyles.caption(
                                      context: context,
                                      color: theme.errorColor),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Zip code",
                                style: context.textStyle14Medium(
                                    color: theme.iconColor),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyles.body(
                                        context: context,
                                        color: theme.textPrimary,
                                      ),
                                      cursorColor: theme.textSecondary,
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        fillColor: theme.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: .5,
                                                color: theme.iconColor),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        prefixIcon: Icon(Icons.person,
                                            color: theme.textSecondary),
                                        contentPadding:
                                            const EdgeInsets.all(16),
                                        hintText: "email",
                                        hintStyle: TextStyles.body(
                                            context: context,
                                            color: theme.textSecondary),
                                        helperStyle: TextStyles.caption(
                                            context: context,
                                            color: theme.errorColor),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        header: Row(
                          children: [
                            Image.asset(
                              "icons/person.png",
                              color: const Color(0xFF7C8592),
                              scale: 1.8,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Account",
                              style: context.textStyle17Medium(
                                color: theme.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Color(0xFF7C8592),
                        thickness: .5,
                      ),
                      ExpandablePanel(
                        theme: ExpandableThemeData(
                          hasIcon: true,
                          iconColor: theme.iconColor,
                          expandIcon: Icons.arrow_forward_ios_outlined,
                          iconSize: 16,
                          collapseIcon: Icons.keyboard_arrow_down_sharp,
                        ),
                        collapsed: Container(),
                        expanded: ListView(
                          shrinkWrap: true,
                          children: [],
                        ),
                        header: Row(
                          children: [
                            const Icon(Icons.notifications_on_outlined,
                                color: Color(0xFF7C8592)),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Notification",
                              style: context.textStyle17Medium(
                                color: theme.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
