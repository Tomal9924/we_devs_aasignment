import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dokan/core/shared/extensions/context.dart';
import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/shared/shared.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
              child: CircleAvatar(
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
            ),
            Positioned(
              bottom: 28,
              right: 110,
              child: IconButton(
                onPressed: () async {
                  await showImageSourceBottomSheet(context).then(
                    (value) {
                      if (value != null) {
                        // context.read<UploadProfilePictureCubit>().uploadProfilePicture(value);
                      }
                    },
                  ).onError(
                    (error, stackTrace) {
                      log("Error $error");
                    },
                  );
                },
                padding: EdgeInsets.zero,
                splashRadius: 16,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 8),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFF2709C),
                        Color(0xFFFF9472),
                      ],
                    ),
                  ),
                  child: Icon(Icons.photo_camera_rounded,
                      color: theme.backgroundColor, size: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Future<String?> showImageSourceBottomSheet(BuildContext context) async {
  return await showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final theme = state.scheme;
          return CupertinoActionSheet(
            title: Text(
              'Select Image Source',
              style:
                  TextStyles.body(context: context, color: theme.textPrimary),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                onPressed: () async {
                  await getImageFromSource(context, ImageSource.camera)
                      .then((value) {
                    return Navigator.pop(context, value);
                  });
                },
                child: Text(
                  'Camera',
                  style: TextStyles.body(
                      context: context, color: theme.textPrimary),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  await getImageFromSource(context, ImageSource.gallery)
                      .then((value) {
                    return Navigator.pop(context, value);
                  });
                },
                child: Text(
                  'Gallery',
                  style: TextStyles.body(
                      context: context, color: theme.textPrimary),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context, null);
              },
              child: Text(
                'Cancel',
                style:
                    TextStyles.body(context: context, color: theme.textPrimary),
              ),
            ),
          );
        },
      );
    },
  );
}

Future<String?> getImageFromSource(
    BuildContext context, ImageSource source) async {
  final picker = ImagePicker();
  try {
    return await picker
        .pickImage(source: source)
        .then((value) => value?.path)
        .onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            source == ImageSource.camera
                ? "Failed To Capture Image"
                : "Failed To Collect Images From Gallery",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
      return null;
    });
  } catch (e) {
    // Handle errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          source == ImageSource.camera
              ? "Failed To Capture Image"
              : "Failed To Collect Images From Gallery",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
    return null;
  }
}
