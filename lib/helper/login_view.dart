import 'package:api_integration/widgets/custom_button.dart';
import 'package:api_integration/widgets/custom_checkbox.dart';
import 'package:api_integration/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  //final LoginViewModel viewModel = Get.find<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 170, 212, 233),
      // appBar: AppBar(
      //   title: Center(
      //     child: Text("Login"),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/loginproject.jpg')),
            const SizedBox(height: 20),
            Custom_Textformfield(
              //controller: viewModel.emailcontroller,
              labelText: "Enter Email",
              // hintText: "Enter Email",
            ),
            const SizedBox(height: 20),
            Custom_Textformfield(
              obscureText: true,
              //controller: viewModel.passwordcontroller,
              //hintText: "password",
              labelText: "Enter Password",
              sufixIcon: const Icon(Icons.remove_red_eye),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => SimpleCheckBox(
                      title: "Remember Me",
                      //value: viewModel.rememberMe.value,
                      onChanged: (value) {
                        //viewModel.rememberMe.value = value;
                      },
                    ),
                  ),
                  const Text("Forgot Password"),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CustomButton(
              onPress: () {
                //viewModel.signup2();
              },
              text: "sign in",
              textColor: Colors.white,
              btnColor: Color(0xff0ffFF7D0D),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  Text("Don't have an account?"),
                  Text(
                    "Signup",
                    style: TextStyle(color: Color(0xff0ffFF7D0D)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
