

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super(message: "No Internet Connection!");
}

class InternalServerFailure extends Failure {
  const InternalServerFailure() : super(message: "Internal Server Error!");
}

class ServerRequestFailure extends Failure {
  const ServerRequestFailure({
    String? message,
  }) : super(message: message ?? "Something went wrong on the server-end!");
}

class InvalidRequestFailure extends Failure {
  const InvalidRequestFailure({
    String? message,
  }) : super(message: message ?? "Something went wrong while submitting network request!");
}

class InvalidPayloadFailure extends Failure {
  const InvalidPayloadFailure() : super(message: "Server response is corrupted!");
}

class FoodDoesNotExistFailure extends Failure {
  const FoodDoesNotExistFailure() : super(message: "Food does not exist!");
}

class DeliveryAddressDoesNotExistFailure extends Failure {
  const DeliveryAddressDoesNotExistFailure() : super(message: "Delivery address does not exist!");
}

class RestaurantDoesNotExistFailure extends Failure {
  const RestaurantDoesNotExistFailure() : super(message: "Restaurant does not exist!");
}

class OrderDoesNotExistFailure extends Failure {
  const OrderDoesNotExistFailure() : super(message: "Order does not exist!");
}

class GeoCodeFailure extends Failure {
  const GeoCodeFailure() : super(message: "Geo code failed for the provided location!");
}

class GeoCodeTimeoutFailure extends Failure {
  const GeoCodeTimeoutFailure() : super(message: "Geo code timeout failure!");
}

class NoGeoCodeAddressFoundFailure extends Failure {
  const NoGeoCodeAddressFoundFailure() : super(message: "No address found for this location");
}

class PaymentFailure extends Failure {
  const PaymentFailure({
    String? message,
  }) : super(
          message: message ?? "No address found for this location",
        );
}

class PayloadParseFailure extends Failure {
  final String module;
  @override
  // ignore: overridden_fields
  final String message;

  const PayloadParseFailure({
    required this.module,
    required this.message,
  }) : super(message: message);
}
