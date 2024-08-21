import 'package:flutter/material.dart';
import 'package:new_8/data/auth/app_authentication.dart';
import 'package:new_8/data/validator/validator.dart';
import 'package:new_8/screens/home_nav_bar.dart';
import 'package:new_8/screens/register_screen.dart';
import 'package:new_8/widgets/custom_elevated_button.dart';
import 'package:new_8/widgets/custom_text.dart';
import 'package:new_8/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? mailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isVisbilty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Willcome to Login'),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  controller: mailController,
                  validator: AppValidator.validateText,
                  prefixIcon: const Icon(Icons.mail),
                  hintText: 'Enter Mail',
                  label: 'Mail',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  validator: AppValidator.validateText,
                  hintText: "Enter Password",
                  label: 'Password',
                  obscureText: isVisbilty,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                      onTap: () {
                        isVisbilty = !isVisbilty;
                        setState(() {});
                      },
                      child: isVisbilty
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  child: CustomElevatedButton(
                    textButton: 'Login',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        AppAuthentication.login(
                            context: context,
                            mail: mailController!.text,
                            password: passwordController!.text);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeNavBar(),
                            ));
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HomeNavBar(),
                        //   ),
                        //   (route) => false,
                        // );
                      }
                    },
                  ),
                ),
                Align(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                      },
                      child: CustomText(
                        text: 'not have account, regisert',
                        sizeText: 15,
                        colorText: Colors.blue,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
