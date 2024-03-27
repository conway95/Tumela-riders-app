import 'package:flutter/material.dart';
import '../../global/global_instances.dart';
import '../widgets/custom_text_field.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/logo2.png",
                height: 270,
              ),
            ),
          ),

          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  textEditingController: emailTextEditingController,
                  iconData: Icons.email,
                  hintString: "email@gmail.com",
                  isObscure: false,
                  enabled: true,
                ),
                CustomTextField(
                  textEditingController: passwordTextEditingController,
                  iconData: Icons.password,
                  hintString: "Password",
                  isObscure: true,
                  enabled: true,
                ),

                ElevatedButton(
                    onPressed: ()
                    {
                      authViewModel.validateSignInForm(
                        emailTextEditingController.text.trim(),
                        passwordTextEditingController.text.trim(),
                        context,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10)
                    ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
