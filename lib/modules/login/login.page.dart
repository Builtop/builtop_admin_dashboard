import 'package:auto_route/auto_route.dart';
import 'package:builtop_admin_dashboard/constants/color.dart';
import 'package:builtop_admin_dashboard/constants/icons.dart';
import 'package:builtop_admin_dashboard/constants/images.dart';
import 'package:builtop_admin_dashboard/constants/string.dart';
import 'package:builtop_admin_dashboard/constants/theme.dart';
import 'package:builtop_admin_dashboard/modules/login/login.controller.dart';
import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:builtop_admin_dashboard/utils/hover.dart';
import 'package:builtop_admin_dashboard/utils/responsive.dart';
import 'package:builtop_admin_dashboard/widgets/custom_text_field_ex.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class LoginPage extends MahgStatefulWidget<LoginController> {
  const LoginPage({LoginController? controllerEx, Key? key})
      : super(controllerEx, key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends MahgState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              Images.authBG,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                FxBox.h20,
                Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 460,
                    ),
                    padding: Responsive.isMobile(context)
                        ? const EdgeInsets.all(32)
                        : const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: isDark ? ColorConst.black : ColorConst.white,
                      border: Border.all(
                        color: isDark ? ColorConst.black : ColorConst.white,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        _logoView(),
                        FxBox.h16,
                        headerView(
                            'signIn', 'Welcome To Builtop Dashboard', context),
                        _bottomView(),
                      ],
                    ),
                  ),
                ),
                FxBox.h20,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoView() {
    return Image.asset(Images.builtopSmLogo);
  }

  Widget _bottomView() {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.min,
        children: [
          FxBox.h28,
          labelView('phone'),
          FxBox.h8,
          _phoneTextBoxWidget(),
          FxBox.h16,
          labelView('password'),
          FxBox.h8,
          _passwordTextBoxWidget(),
          FxBox.h16,
          _loginButton(),
          FxBox.h20,
          _forgotPasswordButton(),
          FxBox.h20,
          _serviceText(),
        ],
      ),
    );
  }

  Widget _serviceText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomText(
          title: Strings.privacy,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
        CustomText(
          title: Strings.terms,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
        CustomText(
          title: Strings.sarvadhi2022,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
      ],
    );
  }

  Widget _phoneTextBoxWidget() {
    return CustomTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hintText: Strings.enterPhone,
      onChanged: (String value) {},
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.done,
      controller: controller.phoneController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter PhoneNumber';
        }
        return null;
      },
    );
  }

  Widget _passwordTextBoxWidget() {
    return CustomTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obsecureText: true,
      hintText: Strings.enterPassword,
      onChanged: (String value) {},
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.done,
      controller: controller.passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Password';
        }
        return null;
      },
    );
  }

  Widget labelView(String label) {
    return CustomText(
      title: label,
      fontSize: 15,
      fontWeight: FontWeight.w800,
      textColor: isDark ? ColorConst.white : ColorConst.lightFontColor,
    );
  }

  Widget headerView(String title, String subTitle, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          title: title,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
        FxBox.h6,
        CustomText(
          title: subTitle,
          fontSize: 16,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w400,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
      ],
    );
  }

  Widget _loginButton() {
    return FxButton(
      onPressed: () => controller.onLogin(),
      text: 'signIn',
      borderRadius: 8.0,
      height: 40,
      minWidth: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _forgotPasswordButton() {
    return InkWell(
      onTap: () {},
      child: FxHover(
        builder: (isHover) {
          Color color = isHover
              ? ColorConst.primaryDark
              : Theme.of(context).colorScheme.primary;
          return Row(
            children: [
              Icon(
                Icons.lock,
                size: 14,
                color: color,
              ),
              FxBox.w4,
              CustomText(
                title: 'forgotPassword',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                textColor: color,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  LoginController createController() {
    return LoginController();
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    @required this.title,
    this.fontSize,
    this.textAlign,
    this.textColor,
    this.fontWeight,
    this.maxLine,
    this.overflow,
    this.textDecoration,
  })  : assert(title != null),
        super(key: key);
  final String? title;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
      softWrap: true,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          decoration: textDecoration),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.margin,
      this.textInputAction,
      this.focusNode,
      this.onChanged,
      this.obsecureText = false,
      this.onTap,
      this.onSubmitted,
      this.keyBoardType,
      this.textCapitalization = TextCapitalization.none,
      this.errorText,
      this.changeColor,
      this.readOnly = false,
      this.onIconTap,
      this.suffixIcon,
      this.validator,
      this.maxLength,
      this.textColor,
      this.autovalidateMode})
      : assert(controller != null),
        super(key: key);
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final TextInputAction? textInputAction;
  final String? hintText;
  final FocusNode? focusNode;
  final bool? obsecureText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final TextInputType? keyBoardType;
  final TextCapitalization textCapitalization;
  final String? errorText;
  final bool? changeColor;
  final bool? readOnly;
  final void Function()? onIconTap;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Color? textColor;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        controller: controller,
        focusNode: focusNode,
        textInputAction: textInputAction,
        obscureText: obsecureText!,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        maxLines: 1,
        minLines: 1,
        onTap: onTap,
        keyboardType: keyBoardType,
        textCapitalization: textCapitalization,
        cursorColor: ColorConst.lightFontColor,
        style: TextStyle(fontSize: 15, color: textColor),
        decoration: InputDecoration(
          suffixIconConstraints: const BoxConstraints(minWidth: 30),
          filled: true,
          hintText: hintText,
          fillColor: isDark ? ColorConst.darkContainer : ColorConst.white,
          // fillColor: ColorConst.white,

          hintStyle: TextStyle(
            color: isDark ? ColorConst.white : ColorConst.lightFontColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          isDense: true,
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          suffixIcon: suffixIcon,
          errorText: errorText,
          errorStyle: const TextStyle(fontSize: 11, height: 0.7),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  isDark ? ColorConst.lightFontColor : ColorConst.appbarLightBG,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConst.lightFontColor),
            borderRadius: BorderRadius.circular(4),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConst.primary),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        validator: validator,
        maxLength: maxLength,
      ),
    );
  }
}
