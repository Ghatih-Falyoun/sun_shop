import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sun_shop/core/theme/text_styles.dart';
import 'package:sun_shop/features/home/logic/cubit/home_cubit.dart';
import 'package:sun_shop/features/home/logic/cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (name) {
                return Text(
                  'Your Welcom Sir.$name',
                  style: textStyles.medium32Black,
                );
              },
              orElse: () {
                return SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
