import 'package:engage/controller/auth_controller.dart';
import 'package:engage/view/screens/auth/engageRegister.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageLogin extends StatefulWidget {
  const EngageLogin({super.key});

  @override
  State<EngageLogin> createState() => _EngageLoginState();
}

class _EngageLoginState extends State<EngageLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late bool passwordVisibility;
  final _formKey = GlobalKey<FormState>();

  moveToHome() {
    AuthController.instance.loginUser(_emailController.text, _passwordController.text);
  }

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    passwordVisibility = false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Get.theme.colorScheme.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 300,
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text('Welcome Idealaker,', style: Get.theme.textTheme.headline2),
                            const SizedBox(height: 20),
                            Text(
                              'Login to continue to your idealake engage account.',
                              textAlign: TextAlign.start,
                              style: Get.theme.textTheme.subtitle2,
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _emailController,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter your Email ID',
                                hintStyle: Get.theme.textTheme.bodyText1,
                                focusedBorder: Get.theme.inputDecorationTheme.focusedBorder,
                                errorBorder: Get.theme.inputDecorationTheme.focusedBorder,
                                focusedErrorBorder: Get.theme.inputDecorationTheme.focusedErrorBorder,
                                filled: true,
                                fillColor: const Color(0xFFECF8FF),
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                                prefixIcon: const Icon(
                                  Icons.person,
                                ),
                              ),
                              style: Get.theme.textTheme.bodyText1,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              autofocus: false,
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
                                hintStyle: Get.theme.textTheme.bodyText1,
                                errorBorder: Get.theme.inputDecorationTheme.focusedBorder,
                                focusedBorder: Get.theme.inputDecorationTheme.focusedBorder,
                                focusedErrorBorder: Get.theme.inputDecorationTheme.focusedErrorBorder,
                                filled: true,
                                fillColor: const Color(0xFFECF8FF),
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => passwordVisibility = !passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    passwordVisibility ? Icons.remove_red_eye_sharp : Icons.visibility_off,
                                    color: const Color(0xFF757575),
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: Get.theme.textTheme.bodyText1,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => moveToHome(),
                              style: TextButton.styleFrom(padding: const EdgeInsets.all(15.0), minimumSize: const Size.fromHeight(50), backgroundColor: const Color(0xFF0B4E82)),
                              child: const Text('Login'),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.offAll(() => const EngageRegister());
                                  },
                                  child: const Text("New to Idealake?"),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text("Forget Password?"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
