import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:dokan/features/login/presentation/pages/signin_page.dart';
import 'package:expandable/expandable.dart';

import '../../../../core/shared/shared.dart';
import '../../../login/presentation/bloc/user/bloc/user_bloc.dart';
import '../bloc/local_profile_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/update_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ExpandableController _controller;

  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _streetController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _zipController = TextEditingController();

  bool isFirstNameValid = false;
  bool isLastNameValid = false;

  @override
  void initState() {
    super.initState();
    _controller = ExpandableController();
    final user = BlocProvider.of<UserBloc>(context).state.user;
    BlocProvider.of<ProfileBloc>(context).add(
      Fetch(token: user?.token ?? ""),
    );
  }

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
                SaveLocalProfile(profileModel: profile),
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff222455),
                ),
              );
            } else if (state is ProfileLoaded) {
              final localProfile = state.profile;
              return Scaffold(
                backgroundColor: theme.backgroundColor,
                appBar: AppBar(
                  backgroundColor: theme.backgroundColor,
                  centerTitle: true,
                  title: Text(
                    "My account",
                    textAlign: TextAlign.center,
                    style: context.textStyle20Medium(
                      color: const Color(0xff222455),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.logout_outlined),
                      color: theme.errorColor,
                      onPressed: () {
                        BlocProvider.of<UserBloc>(context).add(const Logout());
                        context.go(SignInPage.path);
                      },
                    ),
                  ],
                ),
                body: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  physics: const ScrollPhysics(),
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        width: context.photoWidth,
                        height: context.photoHeight,
                        imageUrl:
                            "https://s3-alpha-sig.figma.com/img/ef25/997e/d5125e183d6c4f0e7aaa20f9bfc538e0?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OCioEZifKe7mwt4ZXMzm3QrlE2stIuDTBRRfWbyr-4WDtoym4FPemM6~kFG0tVjamZClClfQmVdIx8lkApynxiiO8Ysx3xh97~rmTsE96Rvrlv2CjpkbZkL6VPAnJUeQ8XnDNgSyDTfO4~zedL~q9Ehc1K1mu3gt21xHKohFEClEb-02QnL9de2ssAKs0PjHP3y1K5~wAu0EjjyfkGPYPxL71WDjppg8Z92fmEmSqW2xc-qZqQcCRvuIv~I7BULwkOCMpcuevez2DP~~4DLkEVCa8g7Z9L3kPcP4ZmWhBUZb51pkeaCckdhbGKtj917-uIHstPZWarKObzStwgxeaA__",
                        fit: BoxFit.contain,
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
                      BlocProvider.of<UserBloc>(context).state.user?.email ??
                          "",
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
                            const SizedBox(
                              height: 8,
                            ),
                            ExpandablePanel(
                              controller: _controller,
                              theme: ExpandableThemeData(
                                iconColor: theme.iconColor,
                                expandIcon: Icons.arrow_forward_ios_outlined,
                                sizeCurve: Curves.fastOutSlowIn,
                                iconSize: 18,
                                collapseIcon:
                                    Icons.keyboard_arrow_down_outlined,
                              ),
                              collapsed: Container(),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style: context.textStyle14Medium(
                                        color: theme.iconColor),
                                  ),
                                  const SizedBox(height: 8),
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
                                              width: .5, color: theme.border),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: .5, color: theme.border),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      prefixIcon: Icon(Icons.person,
                                          color: theme.textSecondary),
                                      contentPadding: const EdgeInsets.all(16),
                                      hintText: "email",
                                      hintStyle: TextStyles.body(
                                        context: context,
                                        color: theme.textSecondary,
                                      ),
                                      helperStyle: TextStyles.caption(
                                        context: context,
                                        color: theme.errorColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "First name",
                                    style: context.textStyle14Medium(
                                        color: theme.iconColor),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _firstNameController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyles.body(
                                      context: context,
                                      color: theme.textPrimary,
                                    ),
                                    cursorColor: theme.textSecondary,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          isFirstNameValid = true;
                                        });
                                      } else {
                                        setState(() {
                                          isFirstNameValid = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      fillColor: theme.white,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: .5,
                                              color: isFirstNameValid
                                                  ? theme.successColor
                                                  : theme.errorColor),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: .5,
                                              color: isFirstNameValid
                                                  ? theme.iconColor
                                                  : theme.errorColor),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: .5,
                                              color: isFirstNameValid
                                                  ? theme.successColor
                                                  : theme.errorColor),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      prefixIcon: Icon(Icons.person,
                                          color: theme.textSecondary),
                                      contentPadding: const EdgeInsets.all(16),
                                      hintText: "first name",
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
                                    "Last name",
                                    style: context.textStyle14Medium(
                                        color: theme.iconColor),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _lastNameController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyles.body(
                                      context: context,
                                      color: theme.textPrimary,
                                    ),
                                    cursorColor: theme.textSecondary,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          isLastNameValid = true;
                                        });
                                      } else {
                                        setState(() {
                                          isLastNameValid = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      fillColor: theme.white,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: .5,
                                              color: isLastNameValid
                                                  ? theme.successColor
                                                  : theme.errorColor),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: .5,
                                              color: isLastNameValid
                                                  ? theme.iconColor
                                                  : theme.errorColor),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: .5,
                                              color: isLastNameValid
                                                  ? theme.successColor
                                                  : theme.errorColor),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: theme.textSecondary,
                                      ),
                                      contentPadding: const EdgeInsets.all(16),
                                      hintText: "last name",
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
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: .5, color: theme.border),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      prefixIcon: Icon(Icons.person,
                                          color: theme.textSecondary),
                                      contentPadding: const EdgeInsets.all(16),
                                      hintText: "street",
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
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: .5, color: theme.border),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      prefixIcon: Icon(Icons.person,
                                          color: theme.textSecondary),
                                      contentPadding: const EdgeInsets.all(16),
                                      hintText:
                                          "aprtment,suit,building (optional)",
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
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: _zipController,
                                          keyboardType:
                                              TextInputType.emailAddress,
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
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: .5,
                                                    color: theme.border),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            prefixIcon: Icon(Icons.person,
                                                color: theme.textSecondary),
                                            contentPadding:
                                                const EdgeInsets.all(16),
                                            hintText: "zip code",
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
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            minimumSize: const Size(0, 61),
                                            backgroundColor:
                                                theme.iconColor.withAlpha(50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: context.textStyle17Medium(
                                                color: theme.textPrimary),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: BlocConsumer<UpdateBloc,
                                            UpdateState>(
                                          listener: (context, state) {
                                            if (state is UpdateLoaded) {
                                              _controller.dispose();
                                            }
                                          },
                                          builder: (context, state) {
                                            if (state is UpdateLoading) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            } else if (state is UpdateLoaded) {
                                              return ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  backgroundColor:
                                                      const Color(0xFF1ABC9C),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 16),
                                                  minimumSize:
                                                      const Size(0, 48),
                                                ),
                                                onPressed: () {},
                                                child: Text(
                                                  "Updated",
                                                  style:
                                                      context.textStyle17Medium(
                                                          color: theme
                                                              .backgroundColor),
                                                ),
                                              );
                                            } else if (state is UpdateError) {
                                              return ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  backgroundColor:
                                                      const Color(0xFF1ABC9C),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 16),
                                                  minimumSize:
                                                      const Size(0, 48),
                                                ),
                                                onPressed: () {
                                                  if (isFirstNameValid &&
                                                      isLastNameValid) {
                                                    context
                                                        .read<UpdateBloc>()
                                                        .add(
                                                          Update(
                                                            id: localProfile.id
                                                                .toString(),
                                                            firstName:
                                                                _firstNameController
                                                                    .text,
                                                            lastName:
                                                                _lastNameController
                                                                    .text,
                                                            token: BlocProvider.of<
                                                                            UserBloc>(
                                                                        context)
                                                                    .state
                                                                    .user
                                                                    ?.token ??
                                                                "",
                                                          ),
                                                        );
                                                  }
                                                },
                                                child: Text(
                                                  "Try again!",
                                                  style:
                                                      context.textStyle17Medium(
                                                          color: theme
                                                              .backgroundColor),
                                                ),
                                              );
                                            } else {
                                              return ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  backgroundColor:
                                                      const Color(0xFF1ABC9C),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 16),
                                                  minimumSize:
                                                      const Size(0, 48),
                                                ),
                                                onPressed: () {
                                                  if (isFirstNameValid &&
                                                      isLastNameValid) {
                                                    context
                                                        .read<UpdateBloc>()
                                                        .add(
                                                          Update(
                                                            id: localProfile.id
                                                                .toString(),
                                                            firstName:
                                                                _firstNameController
                                                                    .text,
                                                            lastName:
                                                                _lastNameController
                                                                    .text,
                                                            token: BlocProvider.of<
                                                                            UserBloc>(
                                                                        context)
                                                                    .state
                                                                    .user
                                                                    ?.token ??
                                                                "",
                                                          ),
                                                        );
                                                  }
                                                },
                                                child: Text(
                                                  "Save",
                                                  style:
                                                      context.textStyle17Medium(
                                                          color: theme
                                                              .backgroundColor),
                                                ),
                                              );
                                            }
                                          },
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
                              height: 8,
                            ),
                            const Divider(
                              color: Color(0xFF7C8592),
                              thickness: .5,
                            ),
                            const SizedBox(
                              height: 8,
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
                            const SizedBox(
                              height: 8,
                            ),
                            const Divider(
                              color: Color(0xFF7C8592),
                              thickness: .5,
                            ),
                            const SizedBox(
                              height: 8,
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
                                  const Icon(Icons.lock_outline_rounded,
                                      color: Color(0xFF7C8592)),
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
                              height: 8,
                            ),
                            const Divider(
                              color: Color(0xFF7C8592),
                              thickness: .5,
                            ),
                            const SizedBox(
                              height: 8,
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
                                  const Icon(Icons.favorite_border_outlined,
                                      color: Color(0xFF7C8592)),
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
                                        style: context.textStyle14Medium(
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
