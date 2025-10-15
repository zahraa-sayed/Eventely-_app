import 'package:evently_app/core/UI_Utils/UI_Utils.dart';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/resources/validator.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/firebase_service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes_manager/routes_manager.dart';
import '../../../l10n/app_localizations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool securePassword = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(ImageAssets.logo, width: 136.w, height: 186.h),
              SizedBox(height: 24.h),
              CustomTextFormField(
                label: appLocalizations.email,
                validator: Validator.validateEmail,
                controller: _emailController,
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                isSecure: securePassword,
                label: appLocalizations.password,
                validator: Validator.validatePassword,
                controller: _passwordController,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                  onPressed: _onPasswordIconClicked,
                  icon: Icon(
                    securePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16.h),
              CustomTextButton(
                text: appLocalizations.forget_password,
                textAlign: TextAlign.right,
                onTap: () {},
              ),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                title: appLocalizations.login,
                onPressed: _login,
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${appLocalizations.dont_have_account} ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  CustomTextButton(
                    text: appLocalizations.create_account,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.register,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: ColorsManager.blue,
                      indent: 14,
                      endIndent: 14,
                    ),
                  ),
                  Text(
                    appLocalizations.or,
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.blue,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: ColorsManager.blue,
                      indent: 14,
                      endIndent: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: REdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: ColorsManager.blue, width: 2.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageAssets.google),
                    SizedBox(width: 10.w),
                    Text(
                      appLocalizations.login_with_google,
                      style: GoogleFonts.inter(
                        color: ColorsManager.blue,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onPasswordIconClicked() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _login() async {
    if (_formKey.currentState?.validate() == false) return;
    try {
      UIUtils.showLoading(context);
      UserCredential userCredential = await FirebaseService.login(
        _emailController.text,
        _passwordController.text,
      );
      UIUtils.hideDialog(context);
      UIUtils.showToastMessage("Logged-In Successfully", ColorsManager.green);
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    } on FirebaseAuthException catch (exception) {
      UIUtils.hideDialog(context);
      UIUtils.showToastMessage("Wrong email or password", ColorsManager.red);
    } catch (exception) {
      UIUtils.hideDialog(context);
      UIUtils.showToastMessage("Filed to login-in", ColorsManager.red);
    }
  }
}
