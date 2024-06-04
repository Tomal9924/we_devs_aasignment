import 'package:dokan/core/shared/extensions/theme.dart';

import '../../../../core/shared/shared.dart';
import 'search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: theme.backgroundColor,
            centerTitle: true,
            title: Text(
              "Product List",
              style: context.textStyle17Medium(color: theme.textPrimary),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  Icons.search_outlined,
                  color: theme.textPrimary,
                  size: 24,
                ),
              )
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 48),
              SearchWidget(
                onTap: () {},
              )
            ],
          ),
        );
      },
    );
  }
}
