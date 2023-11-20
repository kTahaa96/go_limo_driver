import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/alert_message.dart';
import 'package:golimo_driver/common/conditional_builder.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/email_text_field.dart';
import 'package:golimo_driver/common/loader/app_loader.dart';
import 'package:golimo_driver/common/password_input_field.dart';
import 'package:golimo_driver/common/text_hepler.dart';
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
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode phoneNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            NamedNavigatorImpl.push(Routes.homePage,clean: true );
          } else if (state is ErrorLoginState) {
            PopUpHelper.showSnakeBar(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = LoginCubit.of(context);
          return Scaffold(
            body: Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  94.sbH,
                  SvgPicture.asset('assets/svg_icons/login_logo.svg'),
                  21.sbH,
                  const AppText(
                    "تسجيل الدخول",
                    centerText: true,
                    size: 21,
                    weight: FontWeight.w600,
                  ),
                  32.sbH,
                  EmailTextField(
                    controller: phoneController,
                    isFirst: false,
                    focusNode: phoneNode,
                  ),
                  16.sbH,
                  PasswordTextField(
                    controller: passwordController,
                    focusNode: passwordNode,
                    labelText: "Password",
                  ),
                  134.sbH,
                  ConditionalBuilder(
                    condition: state is LoadingLoginState,
                    builder: (context) => const SizedBox(height: 100, child: AppLoader()),
                    fallback: (context) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: CustomButton(
                        buttonText: 'تسجيل الدخول',
                        onBtnTap: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login(
                              phone: phoneController.text,
                              password: passwordController.text,
                            );
                          } else {
                            return;
                          }
                        },
                        withMargin: true,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
