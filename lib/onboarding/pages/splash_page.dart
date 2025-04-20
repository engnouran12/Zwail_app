import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:zewail/onboarding/widgets/splash_thumbnail.dart';

import '../../../../core/config/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _animationDone = false;

  void _navigate(bool userLoged) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      {
        if (!userLoged) {
          context.go(Routes.loginOrSignupPage);
        } else {
          context.goNamed(Routes.mainLayer);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_animationDone &&
        (context.watch<AuthCubit>().state is GetUserSuccess ||
            context.watch<AuthCubit>().state is GetUserFailure)) {
      _navigate(context.watch<AuthCubit>().state is GetUserSuccess);
    }
    return Scaffold(
      body: Center(
        child: SplashThumbnail(
          onEnd: () {
            setState(() {
              _animationDone = true;
            });
          },
        ),
      ),
    );
  }
}
