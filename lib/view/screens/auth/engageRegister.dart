import 'package:engage/controller/auth_controller.dart';
import 'package:engage/view/screens/auth/engageLogin.dart';
import 'package:engage/view/screens/auth/updateProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageRegister extends StatefulWidget {
  const EngageRegister({super.key});

  @override
  State<EngageRegister> createState() => _EngageRegisterState();
}

class _EngageRegisterState extends State<EngageRegister> {
  TextEditingController _username = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  late bool passwordVisibility;
  final _formKey = GlobalKey<FormState>();

  moveToHome() {
    AuthController.instance.registerUser(_username.text, _emailController.text, _passwordController.text, _confirmPasswordController.text);
  }

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    _username.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              width: Get.size.width,
              height: Get.size.height,
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
                      padding: const EdgeInsets.all(20),
                      width: Get.size.width,
                      height: Get.size.height - 160,
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text('New to Idealake,', style: Get.theme.textTheme.headline2),
                            const SizedBox(height: 20),
                            Text(
                              'Register to continue to your idealake engage account.',
                              textAlign: TextAlign.start,
                              style: Get.theme.textTheme.subtitle2,
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _username,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter your Username',
                                hintStyle: Get.theme.textTheme.bodyText1,
                                enabledBorder: Get.theme.inputDecorationTheme.enabledBorder,
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
                            TextFormField(
                              controller: _confirmPasswordController,
                              autofocus: false,
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: Get.theme.textTheme.bodyText1,
                                focusedErrorBorder: Get.theme.inputDecorationTheme.focusedErrorBorder,
                                focusedBorder: Get.theme.inputDecorationTheme.focusedBorder,
                                errorBorder: Get.theme.inputDecorationTheme.focusedBorder,
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
                              validator: (String? value) {
                                if (_confirmPasswordController.value != _passwordController.value) {
                                  return "entered password does not match";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => moveToHome(),
                              style: TextButton.styleFrom(padding: const EdgeInsets.all(15.0), minimumSize: const Size.fromHeight(50), backgroundColor: const Color(0xFF0B4E82)),
                              child: const Text('Register'),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.offAll(() => const EngageLogin());
                                  },
                                  child: const Text("Already Registered User?"),
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
