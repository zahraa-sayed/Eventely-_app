import 'package:evently_app/core/UI_Utils/UI_Utils.dart';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/resources/validator.dart';
import 'package:evently_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/firebase_service/firebase_service.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securePassword = true;
  bool secureRePassword = true;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _rePasswordController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController(text: "Zaa12345678@");
    _rePasswordController = TextEditingController(text: "Zaa12345678@");
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(appLocalizations.register)),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: MediaQuery.of(context).viewInsets.top,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(ImageAssets.logo, width: 131.w, height: 186.h),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  controller: _nameController,
                  validator: Validator.validateName,
                  label: appLocalizations.name,
                  prefixIcon: Icons.person_3_rounded,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _emailController,
                  validator: Validator.validateEmail,
                  label: appLocalizations.email,
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _passwordController,
                  validator: Validator.validatePassword,
                  isSecure: securePassword,
                  label: appLocalizations.password,
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
                CustomTextFormField(
                  controller: _rePasswordController,
                  validator: Validator.validateRePassword,
                  isSecure: secureRePassword,
                  label: appLocalizations.re_password,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                    onPressed: _onRePasswordIconClicked,
                    icon: Icon(
                      secureRePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 16.h),
                CustomElevatedButton(
                  title: appLocalizations.create_account,
                  onPressed: _createAccount,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${appLocalizations.already_have_account} ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomTextButton(
                      text: appLocalizations.login,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesManager.login,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPasswordIconClicked() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _onRePasswordIconClicked() {
    setState(() {
      secureRePassword = !secureRePassword;
    });
  }

  void _createAccount() async {
    if (_formKey.currentState?.validate() == false) return;
    try {
      UIUtils.showLoading(context);
      UserCredential userCredential = await FirebaseService.register(
        _emailController.text,
        _passwordController.text,
      );
      final newUser = UserModel(
        id: userCredential.user!.uid,
        name: _nameController.text,
        email: _emailController.text,
        favouriteEventsIds: [],
      );

      await FirebaseService.addUserToFireStore(newUser);
      UserModel.currentUser = newUser;
      UIUtils.hideDialog(context);
      UIUtils.showToastMessage(
        "User Registered Successfully",
        ColorsManager.green,
      );
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    } on FirebaseAuthException catch (exception) {
      UIUtils.hideDialog(context);
      UIUtils.showToastMessage(exception.code, ColorsManager.red);
    } catch (exception) {
      UIUtils.hideDialog(context);
      UIUtils.showToastMessage("Failed to register", ColorsManager.red);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }
}
