import 'package:dishsapp/model/userlogin.dart';
import 'package:dishsapp/providers/provider.dart';
import 'package:dishsapp/utils/colors.dart';
import 'package:dishsapp/widgets/button_custom/buttom_custom.dart';
import 'package:dishsapp/widgets/input_custom/input_custom.dart';
import 'package:dishsapp/widgets/input_pass_custom/input_password_custom.dart';
import 'package:dishsapp/widgets/text_normal/text_normal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: 620,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InputCustom(
              controller: emailController,
              label: "Email",
              icon: CupertinoIcons.mail,
              focus: false,
            ),
            const SizedBox(
              height: 20,
            ),
            InputPasswordCustom(
              controller: passwordController,
              label: "Password",
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                UserLogin user = UserLogin(
                  email: emailController.text,
                  password: passwordController.text,
                );
                await context.read<DishProvider>().login(user);
                context.goNamed("home");
                // showDialog(
                //   context: context,
                //   builder: (context) => AlertDialog(
                //     content: SizedBox(
                //       height: 150,
                //       child: Column(
                //         children: [
                //           TextNormal(
                //             text: "Sign in with email",
                //             color: AppColors.textGrayColor,
                //           ),
                //           Text(
                //             emailController.text,
                //             overflow: TextOverflow.ellipsis,
                //             style: const TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.bold,
                //               color: AppColors.textColor,
                //             ),
                //           ),
                //           const SizedBox(
                //             height: 20,
                //           ),
                //           TextNormal(
                //             text: "Chúng tôi sẽ gửi mã OTP đến",
                //             color: AppColors.textGrayColor,
                //             textSize: 14,
                //           ),
                //           TextNormal(
                //             text: "email của bạn. Vui lòng chọn Next",
                //             color: AppColors.textGrayColor,
                //             textSize: 14,
                //           ),
                //           TextNormal(
                //             text: "để tiếp tục quá trình đăng nhập",
                //             color: AppColors.textGrayColor,
                //             textSize: 14,
                //           ),
                //         ],
                //       ),
                //     ),
                //     actions: <Widget>[
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               Navigator.of(context).pop();
                //             },
                //             child: SizedBox(
                //               width: 100,
                //               child: ButtonCustom(
                //                 text: "Cancel",
                //                 color: AppColors.mainColor,
                //                 background: AppColors.brightColor,
                //                 textColor: AppColors.mainColor,
                //               ),
                //             ),
                //           ),
                //           GestureDetector(
                //             onTap: () async {
                //               UserLogin user = UserLogin(
                //                 email: emailController.text,
                //                 password: passwordController.text,
                //               );
                //               await context.read<DishProvider>().login(user);
                //               context.goNamed("home");
                //             },
                //             child: SizedBox(
                //               width: 100,
                //               child: ButtonCustom(
                //                 text: "Next",
                //               ),
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              child: ButtonCustom(
                text: "Sign in",
                background: AppColors.mainColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => context.goNamed("signup"),
              child: ButtonCustom(
                text: "Sign up",
                color: AppColors.mainColor,
                textColor: AppColors.mainColor,
                background: AppColors.brightColor,
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
