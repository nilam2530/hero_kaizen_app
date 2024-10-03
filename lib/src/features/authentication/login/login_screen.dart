import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import screen_utils
import '../../../app_configs/app_colors.dart';
import '../../../app_configs/app_images.dart';
import '../../../common_widgets/buttons/primary_button.dart';
import '../../../common_widgets/custom_fields/text/custom_text_field.dart';
import 'provider/login_screen_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // Default mobile design size
      minTextAdapt: true,
      splitScreenMode: true,
    );

    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true, // Add this line

      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile Layout
            return _buildMobileLayout(context, authProvider);
          } else if (constraints.maxWidth >= 600 &&
              constraints.maxWidth < 1200) {
            // Tablet Layout
            return _buildTabletWebLayout(context, authProvider);
          } else {
            // Desktop Layout
            return _buildDesktopLayout(context, authProvider);
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, AuthProvider authProvider) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w), // Use .w for width scaling
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLogo(),
          SizedBox(height: 20.h), // Use .h for height scaling
          _buildWelcomeText(),
          _buildForm(authProvider),
        ],
      ),
    );
  }

  Widget _buildTabletWebLayout(
      BuildContext context, AuthProvider authProvider) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.loginBackFullImg),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Container(
          width: 500.w, // Scaled width for tablet
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
          child: _buildLoginContainer(context, authProvider),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, AuthProvider authProvider) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.loginBackFullImg),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        // Add SingleChildScrollView here
        child: SizedBox(
          height: height,
          width: width,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 30), // Adjust padding
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLogo(),
                              const SizedBox(height: 20),
                              _buildWelcomeText(),
                              _buildForm(authProvider),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginContainer(BuildContext context, AuthProvider authProvider) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), // Scaled radius
            color: Colors.white,
          ),
        ),
        SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.w), // Use screen_utils for padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLogo(),
                  SizedBox(height: 20.h),
                  _buildWelcomeText(),
                  _buildForm(authProvider),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return SvgPicture.asset(
      AppImages.loginLogo,
      height: 42.93.h, // Adjust SVG height
      width: 130.16.w, // Adjust SVG width
    );
  }

  Widget _buildWelcomeText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to the",
          style: TextStyle(
            color: AppColors.dark5Grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Dashboard",
          style: TextStyle(
            color: AppColors.dark5Grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(AuthProvider authProvider) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        // Add SingleChildScrollView here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            const Text(
              "Username",
              style: TextStyle(
                color: AppColors.dark5Grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            CustomTextField(
              controller: _usernameController,
              labelText: 'Email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              onSaved: (String? value) {},
            ),
            SizedBox(height: 10.h),
            const Text(
              "Password",
              style: TextStyle(
                color: AppColors.dark5Grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              isPassword: true,
              isDarkThemed: false,
              passIconColor: Colors.grey,
              onSaved: (String? value) {},
            ),
            SizedBox(height: 20.h),
            _buildLoginButton(authProvider),
            SizedBox(height: 10.h),
            _buildDividerWithText(),
            SizedBox(height: 10.h),
            _buildGoogleLoginButton(authProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(AuthProvider authProvider) {
    return PrimaryButton(
      backgroundColor: AppColors.btnRedColor,
      text: authProvider.loading ? 'Loading' : 'Login',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          authProvider.login(
            _usernameController.text.trim(),
            _passwordController.text.trim(),
          );
          GoRouter.of(context).go('/mainScreen');
        }
      },
    );
  }

  Widget _buildGoogleLoginButton(AuthProvider authProvider) {
    return PrimaryButton(
      imageIcon: SvgPicture.asset(AppImages.googleLogo,
          height: 24.h, width: 24.w), // Responsive icon size
      backgroundColor: AppColors.whiteColor,
      text: authProvider.loading ? 'Loading' : 'Sign in with Google',
      foregroundColor: Colors.black,
      borderColor: AppColors.dark6Grey,
      onPressed: () {},
    );
  }

  Widget _buildDividerWithText() {
    return const Row(
      children: [
        Expanded(
          child: Divider(color: AppColors.dividerColor, thickness: 1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Or",
            style: TextStyle(
              color: AppColors.dividerColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: AppColors.dividerColor, thickness: 1),
        ),
      ],
    );
  }
}
