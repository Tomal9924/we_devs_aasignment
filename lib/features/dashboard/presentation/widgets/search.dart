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
            leading: Image.asset(
              "icons/filter.png",
              scale: 3.5,
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
            trailing: Icon(
              Icons.list,
              color: theme.textPrimary,
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
