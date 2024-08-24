import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sun_shop/features/customer_home/logic/cubit/home_state.dart';
import 'package:sun_shop/features/customer_home/screens/cart/data/firebase_service_wishlist.dart';
import 'package:sun_shop/features/customer_home/screens/customer_store/data/firebase_cloud_service_store_home.dart';
import 'package:sun_shop/features/customer_home/screens/profile/data/firebase_service_profile.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial()) {
    print('why its not starting');
  }
  FirebaseServiceWishlist firebaseServiceWishlist = FirebaseServiceWishlist();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void loadStoreScreen() async {
    try {
      List<Product> products =
          await FirebaseCloudServiceStoreHome.getRandomProducts();
      emit(HomeState.HomeScreenloaded(products));
    } catch (error) {
      emit(HomeState.HomeScreenerror(error.toString()));
    }
  }

  void addTheItemToWishlist(String productId) {
    FirebaseCloudServiceStoreHome.ifExistDecreasIfNotADD(productId);
  }

  void updateTheItem(String productId, int currentCount) async {
    FirebaseCloudServiceStoreHome.IncreaseTheDataOne(productId, currentCount);
    final response = await firebaseServiceWishlist.getAllProduct();
    final total = firebaseServiceWishlist.price;
    emit(HomeState.WishlistScreenloaded(response, total));
  }

  void loadWishlistScreen() async {
    emit(HomeState.WishlistScreenloading());
    final response = await firebaseServiceWishlist.getAllProduct();
    final total = firebaseServiceWishlist.price;
    print('its sending and the response lenght is $response');
    emit(HomeState.WishlistScreenloaded(response, total));
  }

  void loadProfileScreen() async {
    User? currentUser = firebaseAuth.currentUser;
    emit(profileScreenloaded(currentUser!));
  }

  void makeAccountSupplier() {
    User? currentUser = firebaseAuth.currentUser;
    FirebaseServiceProfile.makeTheUserSupplier(currentUser!.uid);
  }

  void deleteTheItemFromWishlist(String productId) {
    firebaseServiceWishlist.deleteTheItemFromWishlist(productId);
    loadWishlistScreen();
  }
}
