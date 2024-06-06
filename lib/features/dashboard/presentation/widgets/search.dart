import 'package:dokan/core/shared/extensions/theme.dart';

import '../../../../core/shared/shared.dart';

class SearchWidget extends StatelessWidget {
  final Function onTap;
  SearchWidget({super.key, required this.onTap});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: theme.white, borderRadius: BorderRadius.circular(24)),
          child: ListTile(
            dense: false,
            visualDensity: VisualDensity.compact,
            horizontalTitleGap: 8,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Image.asset(
                "icons/filter.png",
                scale: 3.5,
              ),
            ),
            title: TextField(
              keyboardType: TextInputType.text,
              controller: searchController,
              decoration: InputDecoration(
                fillColor: theme.white,
                contentPadding: const EdgeInsets.all(8),
                hintText: "Filter",
                hintStyle:
                    context.textStyle12Medium(color: theme.textSecondary),
                border: InputBorder.none,
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Sort by",
                    style: TextStyles.body(
                        context: context, color: theme.iconColor),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: theme.iconColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.list,
                    color: theme.iconColor,
                  ),
                ],
              ),
            ),
            onTap: () {
              onTap();
            },
          ),
        );
      },
    );
  }
}
