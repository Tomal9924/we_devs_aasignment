part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

class DashboardLoaded extends DashboardState {
  final List<Product> productList;
  const DashboardLoaded(this.productList);

  @override
  List<Object> get props => [productList];
}

class DashboardError extends DashboardState {
  final Failure message;
  const DashboardError(this.message);
}
