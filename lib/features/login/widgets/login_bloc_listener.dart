import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_shop/core/helpers/extensions.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/features/login/logic/cubit/login_cubit.dart';
import 'package:sun_shop/features/login/logic/cubit/login_state.dart';
import 'package:sun_shop/features/sinup/widgets/sinup_lisener_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Success || current is Error || current is Loading,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            setupLoading(context);
          },
          success: () {
            context.pop();
            context.pushNamed(Routes.HomeScreen);
          },
          error: (error) {
            setupError(context, error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}