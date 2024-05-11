import 'package:dishsapp/model/user.dart';
import 'package:dishsapp/providers/provider.dart';
import 'package:dishsapp/utils/colors.dart';
import 'package:dishsapp/local_notifications.dart';
import 'package:dishsapp/widgets/button_custom/buttom_custom.dart';
import 'package:dishsapp/widgets/input_custom/input_custom.dart';
import 'package:dishsapp/widgets/input_pass_custom/input_password_custom.dart';
import 'package:dishsapp/widgets/text_normal/text_normal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    super.dispose();
  }

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: 680,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InputCustom(
                controller: emailController,
                label: "Email",
                icon: CupertinoIcons.mail,
                focus: true,
              ),
              const SizedBox(
                height: 20,
              ),
              InputCustom(
                controller: nameController,
                label: "Name",
                icon: CupertinoIcons.person,
                focus: true,
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
              InputPasswordCustom(
                controller: repasswordController,
                label: "Re-Enter Password",
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (passwordController.text == repasswordController.text) {
                    User user = User(
                      email: emailController.text,
                      name: nameController.text,
                      password: passwordController.text,
                    );
                    await context
                        .read<DishProvider>()
                        .signup(user)
                        .then((value) {
                      if (value == "Success") {
                        LocalNotifications.showSimpleNotification(
                            title: "Đăng ký tài khoản người dùng",
                            body:
                                "Bạn đã đăng kí tài khoản thành công với tên đăng nhập là ${emailController.text}",
                            payload: "This is simple data");
                        context.goNamed("login");
                      } else {
                        Fluttertoast.showToast(
                            msg: "This is a Toast message",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text("Sai mật khẩu nhập lại"),
                        );
                      },
                    );
                  }
                },
                child: ButtonCustom(
                  text: "Sign up",
                  background: AppColors.mainColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => context.goNamed("login"),
                child: ButtonCustom(
                  text: "Login",
                  color: AppColors.mainColor,
                  textColor: AppColors.mainColor,
                  background: AppColors.brightColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
