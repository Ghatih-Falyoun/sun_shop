
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sun_shop/features/customer_home/screens/cart/data/model/response_product.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';
part 'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.HomeScreenloading() = homeScreenLoading;
  const factory HomeState.HomeScreenloaded(List<Product> name) = homeScreenloaded;
  const factory HomeState.HomeScreenerror(String error) = homeScreenError;

  const factory HomeState.WishlistScreenloading() = wishlistScreenLoading;
  const factory HomeState.WishlistScreenloaded(List<ResponseProduct> products,double total) = wishlistScreenloaded;
  const factory HomeState.WishlistScreenerror(String error) = wishlistScreenError;

  const factory HomeState.ProfileScreenloaded(User user) = profileScreenloaded;

}
