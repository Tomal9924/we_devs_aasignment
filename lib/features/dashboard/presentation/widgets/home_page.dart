import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:dokan/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dokan/features/login/login.dart';

import '../../../../core/shared/shared.dart';
import '../../domain/entities/product.dart';
import 'item.dart';
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
                return CustomScrollView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(child: SizedBox(height: 48)),
                    SliverToBoxAdapter(
                      child: SearchWidget(
                        onFilterTap: (filteredValue) {
                          if (filteredValue == "Price high > low") {
                            setState(() {
                              products
                                  .sort((b, a) => a.price.compareTo(b.price));
                            });
                            return products;
                          } else if (filteredValue == "Price low > high") {
                            setState(() {
                              products
                                  .sort((a, b) => a.price.compareTo(b.price));
                            });
                            return products;
                          } else {
                            return [];
                          }
                        },
                      ),
                    ),
                    SliverGrid.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.66,
                      ),
                      itemBuilder: (context, index) {
                        return Item(
                          item: products[index],
                        );
                      },
                    ),
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
