import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sun_shop/features/sinup/logic/cubit/singup_state.dart';


class SingupCubit extends Cubit<SingupState> {
  SingupCubit() : super(SingupState.initial());
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final key = GlobalKey<FormState>();

    
}
