// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// class EngageRes extends StatefulWidget {
//   const EngageRes({Key? key}) : super(key: key);

//   @override
//   EngageResState createState() => EngageResState();
// }

// class EngageResState extends State<EngageRes> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   late bool passwordVisibility;
//   final _formKey = GlobalKey<FormState>();
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   moveToHome(BuildContext context) {
//     if (_formKey.currentState!.validate()) {}
//   }

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//     passwordVisibility = false;
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: const Color(0xFF0B4E82),
//       body: SingleChildScrollView(
//         child: Wrap(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 160,
//               decoration: const BoxDecoration(
//                 color: Colors.transparent,
//               ),
//             ),
//             Material(
//               color: Colors.transparent,
//               elevation: 10,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16),
//                   topRight: Radius.circular(16),
//                 ),
//               ),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height - 160,
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 4,
//                       color: Get.theme.colorScheme.onSurface,
//                       offset: const Offset(0, 2),
//                     )
//                   ],
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     const SizedBox(height: 10),
//                     Text('New to Idealake,', style: Get.theme.textTheme.headline2),
//                     const SizedBox(height: 20),
//                     Text(
//                       'Register to continue to your idealake engage account.',
//                       textAlign: TextAlign.start,
//                       style: Get.theme.textTheme.subtitle2,
//                     ),
//                     const SizedBox(height: 30),
//                     Form(
//                       key: _formKey,
//                       autovalidateMode: AutovalidateMode.disabled,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           TextFormField(
//                             controller: _emailController,
//                             autofocus: false,
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               hintText: 'Enter Username',
//                               hintStyle: Get.theme.textTheme.bodyText1,
//                               enabledBorder: Get.theme.inputDecorationTheme.enabledBorder,
//                               focusedBorder: Get.theme.inputDecorationTheme.focusedBorder,
//                               errorBorder: Get.theme.inputDecorationTheme.focusedBorder,
//                               focusedErrorBorder: Get.theme.inputDecorationTheme.focusedErrorBorder,
//                               filled: true,
//                               fillColor: const Color(0xFFECF8FF),
//                               contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
//                               prefixIcon: const Icon(
//                                 Icons.email,
//                               ),
//                             ),
//                             validator: (String? value) {
//                               if (value != null) {
//                                 return "This is Required Field";
//                               }
//                               return null;
//                             },
//                             style: Get.theme.textTheme.bodyText1,
//                           ),
//                           const SizedBox(height: 20),
//                           TextFormField(
//                             controller: _emailController,
//                             autofocus: false,
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               hintText: 'Enter your Email ID',
//                               hintStyle: Get.theme.textTheme.bodyText1,
//                               enabledBorder: Get.theme.inputDecorationTheme.enabledBorder,
//                               focusedBorder: Get.theme.inputDecorationTheme.focusedBorder,
//                               errorBorder: Get.theme.inputDecorationTheme.focusedBorder,
//                               focusedErrorBorder: Get.theme.inputDecorationTheme.focusedErrorBorder,
//                               filled: true,
//                               fillColor: const Color(0xFFECF8FF),
//                               contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
//                               prefixIcon: const Icon(
//                                 Icons.email,
//                               ),
//                             ),
//                             validator: (String? value) {
//                               if (value != null) {
//                                 return "This is Required Field";
//                               }
//                               return null;
//                             },
//                             style: Get.theme.textTheme.bodyText1,
//                           ),
//                           const SizedBox(height: 20),
//                           TextFormField(
//                             controller: _passwordController,
//                             autofocus: false,
//                             obscureText: !passwordVisibility,
//                             decoration: InputDecoration(
//                               hintText: 'Enter Password',
//                               hintStyle: Get.theme.textTheme.bodyText1,
//                               enabledBorder: Get.theme.inputDecorationTheme.enabledBorder,
//                               focusedBorder: Get.theme.inputDecorationTheme.focusedBorder,
//                               errorBorder: Get.theme.inputDecorationTheme.focusedBorder,
//                               focusedErrorBorder: Get.theme.inputDecorationTheme.focusedErrorBorder,
//                               filled: true,
//                               fillColor: const Color(0xFFECF8FF),
//                               contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
//                               suffixIcon: InkWell(
//                                 onTap: () => setState(
//                                   () => passwordVisibility = !passwordVisibility,
//                                 ),
//                                 focusNode: FocusNode(skipTraversal: true),
//                                 child: Icon(
//                                   passwordVisibility ? Icons.remove_red_eye_sharp : Icons.visibility_off,
//                                   color: const Color(0xFF757575),
//                                   size: 22,
//                                 ),
//                               ),
//                             ),
//                             validator: (String? value) {
//                               if (value != null) {
//                                 return "This is Required Field";
//                               }
//                               return null;
//                             },
//                             style: Get.theme.textTheme.bodyText1,
//                             textAlign: TextAlign.start,
//                           ),
//                           const SizedBox(height: 20),
//                           TextFormField(
//                             controller: _passwordController,
//                             autofocus: false,
//                             obscureText: !passwordVisibility,
//                             decoration: InputDecoration(
//                               hintText: 'Enter Password',
//                               hintStyle: Get.theme.textTheme.bodyText1,
//                               enabledBorder: Get.theme.inputDecorationTheme.enabledBorder,
//                               focusedBorder: Get.theme.inputDecorationTheme.focusedBorder,
//                               errorBorder: Get.theme.inputDecorationTheme.focusedBorder,
//                               focusedErrorBorder: Get.theme.inputDecorationTheme.focusedErrorBorder,
//                               filled: true,
//                               fillColor: const Color(0xFFECF8FF),
//                               contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
//                               suffixIcon: InkWell(
//                                 onTap: () => setState(
//                                   () => passwordVisibility = !passwordVisibility,
//                                 ),
//                                 focusNode: FocusNode(skipTraversal: true),
//                                 child: Icon(
//                                   passwordVisibility ? Icons.remove_red_eye_sharp : Icons.visibility_off,
//                                   color: const Color(0xFF757575),
//                                   size: 22,
//                                 ),
//                               ),
//                             ),
//                             validator: (String? value) {
//                               if (value != null) {
//                                 return "This is Required Field";
//                               }
//                               return null;
//                             },
//                             style: Get.theme.textTheme.bodyText1,
//                             textAlign: TextAlign.start,
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                     ElevatedButton(
//                       // onPressed: () => AuthController.instance.login(_emailController.text, _passwordController.text),
//                       onPressed: (() {}),
//                       style: TextButton.styleFrom(padding: const EdgeInsets.all(15.0), minimumSize: const Size.fromHeight(50), backgroundColor: const Color(0xFF0B4E82)),
//                       child: const Text('Register'),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             // Get.offAll(() => const EngageRes());
//                           },
//                           child: const Text("Already Registered User?"),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text("Forget Password?"),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
