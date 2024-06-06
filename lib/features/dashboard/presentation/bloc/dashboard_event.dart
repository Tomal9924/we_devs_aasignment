part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class FetchProduct extends DashboardEvent {
  const FetchProduct();
  @override
  List<Object> get props => [];
}
