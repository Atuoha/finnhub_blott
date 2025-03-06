import 'package:finnhub_news/core/theme/font_manager.dart';
import 'package:finnhub_news/core/theme/styles_manager.dart';
import 'package:finnhub_news/core/theme/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import 'form_handler/login_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  bool isButtonDisabled = true;
  final LoginHandler loginHandler = LoginHandler();

  @override
  void initState() {
    super.initState();
    _firstName.addListener(_validateForm);
    _lastName.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      isButtonDisabled = _firstName.text.isEmpty || _lastName.text.isEmpty;
    });
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    super.dispose();
  }

  void submit() {
    loginHandler.submit(
      context: context,
      formKey: _formKey,
      firstName: _firstName,
      lastName: _lastName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: isButtonDisabled ? null : () => submit(),
        backgroundColor:
            isButtonDisabled ? AppColors.primaryLite : AppColors.primaryColor,
        child: Icon(
          Icons.chevron_right,
          color: Colors.white,
          size: AppSize.s30,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 18,
          right: 18,
          top: MediaQuery.of(context).padding.top,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your legal name",
                style: getBoldStyle(
                  color: Colors.black,
                  fontSize: FontSize.s25,
                ),
              ),
              Gap(20),
              Text(
                AppStrings.LOGIN_TEXT,
                style: getRegularStyle(color: AppColors.greyTextColor),
              ),
              Gap(30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _firstName,
                      decoration: InputDecoration(
                        labelText: "First name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "First name is required";
                        }
                        if (value.length < 3) {
                          return "First name is too short";
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                      ],
                    ),
                    Gap(15),
                    TextFormField(
                      controller: _lastName,
                      decoration: InputDecoration(
                        labelText: "Last name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Last name is required";
                        }
                        if (value.length < 3) {
                          return "Last name is too short";
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
