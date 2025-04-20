import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/app/di.dart';

import 'package:zewail/core/common/presentation/locale/page/local_picker_page.dart';
import 'package:zewail/features/auth/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:zewail/features/auth/presentation/pages/forgot_password/otp_page.dart';
import 'package:zewail/features/auth/presentation/pages/forgot_password/password_change_success_page.dart';
import 'package:zewail/features/auth/presentation/pages/forgot_password/reset_password_page.dart';
import 'package:zewail/features/auth/presentation/pages/login_or_signup_page.dart';
import 'package:zewail/features/auth/presentation/pages/login_page.dart';
import 'package:zewail/features/auth/presentation/pages/signup_page.dart';
import 'package:zewail/features/course/presentation/categories/category_details_page.dart';
import 'package:zewail/features/course/presentation/categories/cubit/categories_cubit.dart';
import 'package:zewail/features/course/presentation/course_details/course_details_page.dart';
import 'package:zewail/features/course/presentation/course_details/cubit/course_details_cubit.dart';
import 'package:zewail/features/course/presentation/courses_list/pages/courses_list_page.dart';
import 'package:zewail/features/course/presentation/search/search_page.dart';
import 'package:zewail/main_layer/main_layer_page.dart';
import 'package:zewail/onboarding/pages/splash_page.dart';

import '../core/config/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: Routes.splashPage,
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: Routes.splashPage,
      name: Routes.splashPage,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(key: state.pageKey, child: const SplashPage()),
    ),
    GoRoute(
      path: Routes.languagePage,
      name: Routes.languagePage,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const LocalPickerPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: Routes.loginPage,
      name: Routes.loginPage,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Change the opacity of the Page using a Curve based on the the animation's
            // value
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: Routes.signupPage,
      name: Routes.signupPage,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const SignupPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Change the opacity of the Page using a Curve based on the the animation's
            // value
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: Routes.loginOrSignupPage,
      name: Routes.loginOrSignupPage,
      routes: [
        GoRoute(
          path: Routes.loginPage,
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: Routes.signupPage,
          builder: (context, state) => SignupPage(),
        ),
        GoRoute(
          path: Routes.passwordChangeSuccessPage,
          builder: (context, state) => PasswordChangeSuccessPage(),
        ),
      ],
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const LoginOrSignupPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Change the opacity of the Page using a Curve based on the the animation's
            // value
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: Routes.forgotPasswordPage,
      name: Routes.forgotPasswordPage,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(
              key: state.pageKey, child: const ForgotPasswordPage()),
    ),
    GoRoute(
      path: Routes.otpPage,
      name: Routes.otpPage,
      pageBuilder: (BuildContext context, GoRouterState state) {
        bool? verifyEmail = state.extra as bool?;
        return MaterialPage<void>(
            key: state.pageKey,
            child: OtpPage(
              verifyEmail: verifyEmail ?? false,
            ));
      },
    ),
    GoRoute(
      path: Routes.resetPasswordPage,
      name: Routes.resetPasswordPage,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(
              key: state.pageKey, child: const ResetPasswordPage()),
    ),
    ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => getIt<CourseDetailsCubit>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: Routes.courseDetailsPage,
            name: Routes.courseDetailsPage,
            pageBuilder: (BuildContext context, GoRouterState state) {
              String id = state.extra.toString();
              return MaterialPage<void>(
                  key: state.pageKey,
                  child: CourseDetailsPage(
                    id: id,
                  ));
            },
          ),
        ]),
    GoRoute(
      path: Routes.coursesListPage,
      name: Routes.coursesListPage,
      pageBuilder: (BuildContext context, GoRouterState state) {
        bool? mostPopular = state.extra as bool?;
        return MaterialPage<void>(
            key: state.pageKey,
            child: CoursesListPAge(
              mostPopular: mostPopular,
            ));
      },
    ),
    GoRoute(
      path: Routes.searchPage,
      name: Routes.searchPage,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(key: state.pageKey, child: const SearchPage()),
    ),
    GoRoute(
      path: Routes.passwordChangeSuccessPage,
      name: Routes.passwordChangeSuccessPage,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(
              key: state.pageKey, child: const PasswordChangeSuccessPage()),
    ),
    ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => getIt<CategoriesCubit>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: Routes.mainLayer,
            name: Routes.mainLayer,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                MaterialPage<void>(
              key: state.pageKey,
              child: const MainLayerPage(),
            ),
          ),
          GoRoute(
            path: Routes.categoryDetailsPage,
            name: Routes.categoryDetailsPage,
            pageBuilder: (BuildContext context, GoRouterState state) {
              var id = state.extra.toString();
              return MaterialPage<void>(
                key: state.pageKey,
                child: CategoryDetailsPage(
                  id: id,
                ),
              );
            },
          ),
        ])
  ],
);
