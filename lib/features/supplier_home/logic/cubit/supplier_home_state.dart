import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sun_shop/features/supplier_home/screens/proudct_upload/data/model/product.dart';

part 'supplier_home_state.freezed.dart';

@freezed
class SupplierHomeState with _$SupplierHomeState {
  const factory SupplierHomeState.initial() = _Initial;
  const factory SupplierHomeState.uploadLoading() = UploadLoading;
  const factory SupplierHomeState.UploadSuccess() = UploadSuccess;
  const factory SupplierHomeState.MyStoreLoaded(List<Product>products) = myStoreLoaded ;
  const factory SupplierHomeState.ProfileLoaded(User user) = profileloaded;
  const factory SupplierHomeState.uploadError(String error) = ErrorSuccess;
}
