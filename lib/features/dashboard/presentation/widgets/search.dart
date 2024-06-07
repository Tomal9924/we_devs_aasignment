import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:dokan/features/dashboard/domain/entities/product.dart';

import '../../../../core/shared/shared.dart';

class SearchWidget extends StatefulWidget {
  final List<Product> Function(String) onFilterTap;
  const SearchWidget({super.key, required this.onFilterTap});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String selected = "";
  List<String> texts = ["Price high > low", "Price low > high"];
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              color: theme.white, borderRadius: BorderRadius.circular(24)),
          child: ListTile(
            dense: false,
            visualDensity: VisualDensity.compact,
            horizontalTitleGap: 8,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            leading: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (modalContext) {
                    return Container(
                      margin: const EdgeInsets.all(16),
                      child: ListView.builder(
                        itemCount: texts.length,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (modalContext, int index) {
                          final String text = texts[index];
                          return CheckboxListTile(
                            dense: false,
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            activeColor: const Color(0xFFFF708A),
                            controlAffinity: ListTileControlAffinity.leading,
                            checkColor: theme.white,
                            title: Text(text,
                                style: TextStyles.caption(
                                    context: modalContext,
                                    color: theme.textPrimary)),
                            onChanged: (value) {
                              setState(() {
                                selected = text;
                              });
                              widget.onFilterTap(selected);
                              context.pop();
                            },
                            value: text == selected,
                          );
                        },
                      ),
                    );
                  },
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Image.asset(
                      "icons/filter.png",
                      scale: 3.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "Filter",
                      style: TextStyles.body(
                        context: context,
                        color: theme.iconColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            title: TextField(
              keyboardType: TextInputType.text,
              controller: searchController,
              decoration: InputDecoration(
                fillColor: theme.white,
                contentPadding: const EdgeInsets.all(8),
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
          ),
        );
      },
    );
  }
}
