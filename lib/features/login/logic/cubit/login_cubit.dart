import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sun_shop/core/helpers/constants.dart';
import 'package:sun_shop/core/helpers/shared_prefrences.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  void login() async {
    emit(LoginState.loading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      SharedPrefHelper.setData(Constants.UserId, credential.user?.uid);
      emit(LoginState.success());
    } on FirebaseAuthException catch (e) {
      String message = e.code;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message ='Wrong password provided for that user.';
      }
    }
  }
}
