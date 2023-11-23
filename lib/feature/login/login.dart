import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/alert_message.dart';
import 'package:golimo_driver/common/conditional_builder.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/loader/app_loader.dart';
import 'package:golimo_driver/common/password_input_field.dart';
import 'package:golimo_driver/common/phone_input_field.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/feature/login/cubit/login_cubit.dart';
import 'package:golimo_driver/helpers/di/di.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';
import '../../helpers/navigator/nav_helper.dart';
import '../home_page/home_layout.dart';

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
  bool isFirst = true;

  @override
  void dispose() {
    phoneNode.dispose();
    passwordNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            Nav.replace(const HomePage(), context);
          }
          if (state is ErrorLoginState) {
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
                  55.sbH,
                  PhoneTextFormField(
                    isFirst: isFirst,
                    canChangeCountry: false,
                    focusNode: phoneNode,
                    controller: phoneController,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.go,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(passwordNode);
                    },
                    hintTitle: '',
                    required: true,
                  ),
                  32.sbH,
                  PasswordTextField(
                    isFirst: isFirst,
                    controller: passwordController,
                    focusNode: passwordNode,
                    labelText: "Password",
                    onSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        cubit.login(
                          phone: phoneController.text,
                          password: passwordController.text,
                        );
                      } else {
                        return;
                      }
                    },
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
                          FocusScope.of(context).unfocus();
                          if (isFirst) {
                            setState(() {
                              isFirst = false;
                            });
                          }
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
