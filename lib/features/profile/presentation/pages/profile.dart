import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:expandable/expandable.dart';

import '../../../../core/shared/shared.dart';
import '../../../login/presentation/bloc/user/bloc/user_bloc.dart';
import '../bloc/bloc/local_profile_bloc.dart';
import '../bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    final user = BlocProvider.of<UserBloc>(context).state.user;
    BlocProvider.of<ProfileBloc>(context).add(
      Fetch(token: user?.token ?? ""),
    );
  }

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _streetController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _zipController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLoaded) {
              final profile = state.profile;
              BlocProvider.of<LocalProfileBloc>(context).add(
                SaveLocalProfile(
                  profileModel: profile,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileLoaded) {
              final localProfile = state.profile;
              return Scaffold(
                backgroundColor: theme.backgroundColor,
                appBar: AppBar(
                  backgroundColor: theme.backgroundColor,
                ),
                body: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  physics: const ScrollPhysics(),
                  children: [
                    Text(
                      "My account",
                      textAlign: TextAlign.center,
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
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
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
                      localProfile.name,
                      textAlign: TextAlign.center,
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
                      BlocProvider.of<UserBloc>(context).state.user?.email ?? "",
                      textAlign: TextAlign.center,
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
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ExpandablePanel(
                              theme: ExpandableThemeData(
                                iconColor: theme.iconColor,
                                expandIcon: Icons.arrow_forward_ios_outlined,
                                sizeCurve: Curves.fastOutSlowIn,
                                iconSize: 18,
                                collapseIcon: Icons.keyboard_arrow_down_outlined,
                              ),
                              collapsed: Container(),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style: context.textStyle14Medium(color: theme.iconColor),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                          borderSide: BorderSide(width: .5, color: theme.iconColor),
                                          borderRadius: BorderRadius.circular(16)),
                                      prefixIcon: Icon(Icons.person, color: theme.textSecondary),
                                      contentPadding: const EdgeInsets.all(16),
                                      hintText: "email",
                                      hintStyle: TextStyles.body(context: context, color: theme.textSecondary),
                                      helperStyle: TextStyles.caption(context: context, color: theme.errorColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Full name",
                                    style: context.textStyle14Medium(color: theme.iconColor),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: _nameController,
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
                                          borderSide: BorderSide(width: .5, color: theme.iconColor),
                                          borderRadius: BorderRadius.circular(16)),
                                      prefixIcon: Icon(Icons.person, color: theme.textSecondary),
                                      contentPadding: const EdgeInsets.all(16),
                                      hintText: "full name",
                                      hintStyle: TextStyles.body(context: context, color: theme.textSecondary),
                                      helperStyle: TextStyles.caption(context: context, color: theme.errorColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Street address",
                                    style: context.textStyle14Medium(color: theme.iconColor),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: _streetController,
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
                                          borderSide: BorderSide(width: .5, color: theme.iconColor),
                                          borderRadius: BorderRadius.circular(16)),
                                      prefixIcon: Icon(Icons.person, color: theme.textSecondary),
                                      contentPadding: const EdgeInsets.all(16),
                                      hintText: "street",
                                      hintStyle: TextStyles.body(context: context, color: theme.textSecondary),
                                      helperStyle: TextStyles.caption(context: context, color: theme.errorColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Apt,Suit,bldg (Optional)",
                                    style: context.textStyle14Medium(color: theme.iconColor),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: _apartmentController,
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
                                          borderSide: BorderSide(width: .5, color: theme.iconColor),
                                          borderRadius: BorderRadius.circular(16)),
                                      prefixIcon: Icon(Icons.person, color: theme.textSecondary),
                                      contentPadding: const EdgeInsets.all(16),
                                      hintText: "aprtment,suit,building (optional)",
                                      hintStyle: TextStyles.body(context: context, color: theme.textSecondary),
                                      helperStyle: TextStyles.caption(context: context, color: theme.errorColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Zip code",
                                    style: context.textStyle14Medium(color: theme.iconColor),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          controller: _zipController,
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
                                                borderSide: BorderSide(width: .5, color: theme.iconColor),
                                                borderRadius: BorderRadius.circular(16)),
                                            prefixIcon: Icon(Icons.person, color: theme.textSecondary),
                                            contentPadding: const EdgeInsets.all(16),
                                            hintText: "zip code",
                                            hintStyle: TextStyles.body(context: context, color: theme.textSecondary),
                                            helperStyle: TextStyles.caption(context: context, color: theme.errorColor),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: theme.iconColor, width: 1),
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(),
                                            onPressed: () {},
                                            child: Text(
                                              "Cancel",
                                              style: context.textStyle17Medium(color: theme.textPrimary),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            backgroundColor: const Color(0xFF1ABC9C),
                                            padding: const EdgeInsets.symmetric(vertical: 16),
                                            minimumSize: const Size(0, 48),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            "Save",
                                            style: context.textStyle17Medium(color: theme.backgroundColor),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
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
                            const SizedBox(
                              height: 16,
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
                              expanded: Container(),
                              header: Row(
                                children: [
                                  const Icon(Icons.notifications_on_outlined, color: Color(0xFF7C8592)),
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
                            const SizedBox(
                              height: 16,
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
                              expanded: Container(),
                              header: Row(
                                children: [
                                  const Icon(Icons.lock_outline_rounded, color: Color(0xFF7C8592)),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Password",
                                    style: context.textStyle17Medium(
                                      color: theme.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
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
                              expanded: Container(),
                              header: Row(
                                children: [
                                  const Icon(Icons.lock_outline_rounded, color: Color(0xFF7C8592)),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "Wishlist",
                                        style: context.textStyle17Medium(
                                          color: theme.textPrimary,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " (00)",
                                        style: context.textStyle17Medium(
                                          color: theme.iconColor,
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
