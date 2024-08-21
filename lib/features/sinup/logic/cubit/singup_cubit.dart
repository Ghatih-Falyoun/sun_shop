import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sun_shop/core/helpers/constants.dart';
import 'package:sun_shop/core/helpers/shared_prefrences.dart';
import 'package:sun_shop/features/sinup/logic/cubit/singup_state.dart';

class SingupCubit extends Cubit<SingupState> {
  SingupCubit() : super(SingupState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  Future<void> singup() async {
    emit(SingupState.loading());
    try {
      final response =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await response.user?.updateDisplayName(nameController.text);

      emit(SingupState.success());
      SharedPrefHelper.setData(Constants.UserId, response.user?.uid);
    } on FirebaseAuthException catch (e) {
      String massage = e.code;
      if (e.code == 'email-already-in-use') {
        massage = "This email is already exict Please try to log in";
      }
      print(e.toString());
      emit(SingupState.error(massage));
    }
  }
}
