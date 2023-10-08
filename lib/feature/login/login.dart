import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/alert_message.dart';
import 'package:golimo_driver/common/app_logo.dart';
import 'package:golimo_driver/common/conditional_builder.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/email_text_field.dart';
import 'package:golimo_driver/common/loader/app_loader.dart';
import 'package:golimo_driver/common/password_input_field.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/login/cubit/login_cubit.dart';
import 'package:golimo_driver/helpers/di/di.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_routes.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessSendSmsState) {
            NamedNavigatorImpl.push(Routes.verifyCode, arguments: state.phoneNumber);
          } else if (state is ErrorLoginState) {
            PopUpHelper.showSnakeBar(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = LoginCubit.of(context);
          return Scaffold(
            backgroundColor: AppColors.kBlack,
            bottomNavigationBar: ConditionalBuilder(
              condition: state is LoadingLoginState,
              builder: (context) => const SizedBox(height: 100, child: AppLoader()),
              fallback: (context) => Padding(
                padding: const EdgeInsets.all(8),
                child: CustomButton(
                  buttonText: "Login",
                  onBtnTap: () {
                    if (formKey.currentState!.validate()) {
                      cubit.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } else {
                      return;
                    }
                  },
                  withMargin: true,
                ),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomLeft,
                colors: [
                  AppColors.kBlack,
                  AppColors.kBlack,
                  AppColors.kBlack,
                  AppColors.kBlack,
                  AppColors.kBlack,
                  // AppColors.kDarkGray.withOpacity(0.1),
                  AppColors.kPrimary.withOpacity(0.5),
                ],
              )),
              child: Form(
                key: formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    250.sbH,
                    AppLogo(
                      height: 50.h,
                      width: 50.h,
                    ),
                    32.sbH,
                    const AppText(
                      "Welcome Mohammed",
                      size: 22,
                      weight: FontWeight.w600,
                    ),
                    32.sbH,
                    const AppText(
                      "Glad To See You Again",
                      size: 16,
                    ),
                    16.sbH,
                    EmailTextField(
                      label: "Email Address",
                      controller: emailController,
                      isFirst: false,
                      focusNode: emailNode,
                    ),
                    16.sbH,
                    PasswordTextField(
                      controller: passwordController,
                      focusNode: passwordNode,
                      labelText: "Password",
                    ),
                    32.sbH,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
