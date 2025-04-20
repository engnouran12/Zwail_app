import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:zewail/features/auth/presentation/cubit/auth_cubit.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, this.verifyEmail = false});
  final bool verifyEmail;
  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start < 1) {
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  void resetTimer() {
    if (!_timer.isActive) {
      _start = 120;
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    _start = 0;
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(_start ~/ 60);
    final seconds = twoDigits(_start % 60);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is VerifyEmailSuccess) {
          if (state.code == '0000') {
            resetTimer();
          }
        }
      },
      child: _start < 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.localization.didNotReceiveCode,
                    style: CustomTextStyle.styleW500S14Black),
                TextButton(
                    onPressed: () {
                      if (!widget.verifyEmail) {
                        //context.read<AuthCubit>().forgotPasswordResendCode();
                      } else {
                        context.read<AuthCubit>().verifyEmail();
                      }
                    },
                    child: Text(
                      context.localization.resend,
                      style: CustomTextStyle.styleW500S14Black
                          .copyWith(color: Colors.red),
                    ))
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.localization.sendCodeAgainIn,
                    style: CustomTextStyle.styleW500S14Black),
                Text(
                  '$minutes:$seconds',
                  style: CustomTextStyle.styleW500S14Black
                      .copyWith(color: Colors.red),
                ),
              ],
            ),
    );
  }
}
