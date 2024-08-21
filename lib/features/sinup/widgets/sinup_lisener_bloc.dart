import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_shop/core/helpers/extensions.dart';
import 'package:sun_shop/core/routes/routes.dart';
import 'package:sun_shop/core/theme/color_manager.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/sinup/logic/cubit/singup_cubit.dart';
import 'package:sun_shop/features/sinup/logic/cubit/singup_state.dart';

class SinupLisenerBloc extends StatelessWidget {
  const SinupLisenerBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SingupCubit, SingupState>(
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
  }}

  void setupLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (contextbuilder) => const Center(
                child: CircularProgressIndicator(
              color: colorManager.primary,
            )));
  }

  void setupError(BuildContext context, String error) {
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.error,
            size: 32,
            color: Colors.red,
          ),
          content: Text(
            error,
            style: textStyles.reqular14lightGray,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  'Got it',
                  style: textStyles.reqular16Black,
                ))
          ],
        );
      },
    );
              
  }

