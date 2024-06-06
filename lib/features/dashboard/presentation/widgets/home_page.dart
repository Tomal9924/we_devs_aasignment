import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:dokan/features/dashboard/presentation/bloc/dashboard_bloc.dart';

import '../../../../core/shared/shared.dart';
import '../../domain/entities/product.dart';
import 'search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(
          const FetchProduct(),
        );
  }

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
          body: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DashboardLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff222455),
                  ),
                );
              } else if (state is DashboardLoaded) {
                final List<Product> products = state.productList;
                return ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 48),
                    SearchWidget(
                      onTap: () {},
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        );
      },
    );
  }
}
