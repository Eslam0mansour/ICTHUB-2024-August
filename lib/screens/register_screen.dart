import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_8/data/auth/app_authentication.dart';
import 'package:new_8/screens/home_nav_bar.dart';
import 'package:new_8/screens/login_screen.dart';
import 'package:new_8/widgets/custom_elevated_button.dart';
import 'package:new_8/widgets/custom_text.dart';
import 'package:new_8/widgets/custom_text_form_field.dart';

import '../data/validator/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController? mailRegisterController = TextEditingController();
  TextEditingController? passwordRegisterController = TextEditingController();
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
                CustomText(text: 'Register'),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  controller: mailRegisterController,
                  validator: AppValidator.validateText,
                  prefixIcon: const Icon(Icons.mail),
                  hintText: 'Enter Mail',
                  label: 'Mail',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  controller: passwordRegisterController,
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
                    textButton: 'Register',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await AppAuthentication.register(
                          context: context,
                            mail: mailRegisterController!.text,
                            password: passwordRegisterController!.text);

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => LoginScreen(),
                        //     ));
                      }
                    },
                  ),
                ),
                Align(
                  child: TextButton(onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);
                  }, child: CustomText(text: 'Already have account',sizeText: 15,colorText: Colors.blue,)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
