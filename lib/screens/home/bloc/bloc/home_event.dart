part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedproductDataModel;

  HomeProductWishlistButtonClickedEvent(this.clickedproductDataModel);
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedproductDataModel;

  HomeProductCartButtonClickedEvent(this.clickedproductDataModel);
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
