import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sun_shop/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  void loadScreen() {
    final user = FirebaseAuth.instance.currentUser;
    emit(HomeState.loaded(user?.displayName ?? ''));
  }
}
