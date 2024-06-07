import 'package:dokan/core/shared/shared.dart';
import 'package:dokan/features/dashboard/domain/usecases/product.dart';

import '../../domain/entities/product.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ProductUseCase useCase;
  DashboardBloc({required this.useCase}) : super(DashboardInitial()) {
    on<FetchProduct>((event, emit) async {
      emit(const DashboardLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(DashboardError(failure)),
        (products) => emit(DashboardLoaded(products)),
      );
    });
    on<FilterByLowToHighProduct>((event, emit) async {
      emit(const DashboardLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(DashboardError(failure)),
        (products) => emit(DashboardLoaded(products)),
      );
    });
  }
}
