import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:divo_king/controller/cubitAuth/cubit.dart';
import 'package:divo_king/controller/cubitAuth/states.dart';
import 'package:divo_king/controller/cubitLogin/cubit.dart';
import 'package:divo_king/controller/cubitLogin/states.dart';
import 'package:divo_king/model/LoginModel/login_model.dart';
import 'package:divo_king/share/cache/cache.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:divo_king/view/Zoom%20Drawer%20Home/zoom_drawer_home.dart';
import 'package:divo_king/view/auth/SingUp/sing_up.dart';
import 'package:divo_king/view/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ForgetPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthSuccessStates) {
            CashHelper.setData(key: 'token', value: AuthCubit.get(context).loginModel!.data!.token);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ZoomeDrawerHome()));
          }else if(state is AuthErrorStates){
            Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: SvgPicture.asset('assets/icons/logo.svg')),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              defultText(
                                text: 'Log In',
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.w700,
                                color: kSecondColor,
                              ),
                              SizedBox(
                                height: 10.0.h,
                              ),
                              Container(
                                width: 120.0.w,
                                height: 3.0.h,
                                color: kPrimaryColor,
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SingUpView()));
                            },
                            child: Column(
                              children: [
                                defultText(
                                  text: 'Sing Up',
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                Container(
                                  width: 120.0.w,
                                  height: 3.0.h,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45.0.h,
                      ),
                      defultText(
                          text: 'E-mail',
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor),
                      SizedBox(
                        height: 22.0.h,
                      ),
                      defultTextFormFiled(
                          controller: emailController,
                          hintText: 'Enter your username or E-mail',
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email is must by is empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 35.0.h,
                      ),
                      defultText(
                          text: 'Password',
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor),
                      SizedBox(
                        height: 22.0.h,
                      ),
                      defultTextFormFiled(
                          controller: passwordController,
                          hintText: 'Enter your password',
                          suffix: AuthCubit.get(context).suffix,
                          colorIconSuffix: Colors.grey.withOpacity(0.5),
                          isPassword: AuthCubit.get(context).isPassword,
                          suffixPressed: () {
                            AuthCubit.get(context).changePasswordVisibility();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is too short';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 25.0.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: defultTextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          void Function(void Function())
                                              setState) {
                                        return Container(
                                          width: 375.0.w,
                                          height: 492.0.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.circular(25.0.r),
                                                topRight:
                                                    Radius.circular(25.0.r)),
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 50.0.h,
                                              right: 25.0.w,
                                              left: 25.0.w,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                defultText(
                                                    text: 'Forgot password',
                                                    fontSize: 24.0.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: kSecondColor),
                                                SizedBox(
                                                  height: 20.0.h,
                                                ),
                                                defultText(
                                                    text:
                                                        'Enter your email for the verification proccess, we will send 4 digits code to your email.',
                                                    fontSize: 16.0.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff616161)),
                                                SizedBox(
                                                  height: 12.0.h,
                                                ),
                                                defultText(
                                                    text: 'E-mail',
                                                    fontSize: 20.0.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: kPrimaryColor),
                                                SizedBox(
                                                  height: 22.0.h,
                                                ),
                                                defultTextFormFiled(
                                                    hintText:
                                                        'Enter your username or E-mail',
                                                    type: TextInputType
                                                        .emailAddress,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'email is must by is empty';
                                                      }
                                                      return null;
                                                    }),
                                                SizedBox(
                                                  height: 130.0.h,
                                                ),
                                                defaultButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      showModalBottomSheet(
                                                        context: context,
                                                        backgroundColor:
                                                            Colors.white,
                                                        builder: (BuildContext
                                                            context) {
                                                          return allStatFulBuilder();
                                                        },
                                                      );
                                                    },
                                                    text: 'Continue')
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  });
                            },
                            text: 'Forgot Password?',
                            color: kPrimaryColor),
                      ),
                      SizedBox(
                        height: 29.0.h,
                      ),
                      ConditionalBuilder(
                        condition: state is! AuthLoadingStates ,
                        builder: (context) => defaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('Hady');
                              AuthCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);
                            }
                          },
                          text: 'Login',
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      defaultButtonEmpty(
                          text: 'Guest Mode',
                          width: double.infinity,
                          height: 57.0.h,
                          radius: 28.0.r,
                          color: kPrimaryColor,
                          textColor: kPrimaryColor),
                      SizedBox(
                        height: 60.0.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  allStatFulBuilder() => StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Container(
            width: 375.0.w,
            height: 592.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0.r),
                  topRight: Radius.circular(25.0.r)),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.0.h,
                right: 25.0.w,
                left: 25.0.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defultText(
                        text: 'Enter 4 Digits Code ',
                        fontSize: 24.0.sp,
                        fontWeight: FontWeight.w700,
                        color: kSecondColor),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    defultText(
                        text:
                            'Enter the 4 digits code that you received on your email.',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff616161)),
                    SizedBox(
                      height: 35.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 61.0.h,
                          width: 50.0.w,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 61.0.h,
                          width: 50.0.w,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 61.0.h,
                          width: 50.0.w,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 61.0.h,
                          width: 50.0.w,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0.r),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 57.0.h,
                    ),
                    defaultButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showModalBottomSheetResetPassword(context);
                        },
                        text: 'Continue'),
                  ],
                ),
              ),
            ),
          );
        },
      );

  showModalBottomSheetResetPassword(context) => showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Container(
              width: 375.0.w,
              height: 592.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0.r),
                    topRight: Radius.circular(25.0.r)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 50.0.h,
                  right: 25.0.w,
                  left: 25.0.w,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defultText(
                          text: 'Reset Password',
                          fontSize: 24.0.sp,
                          fontWeight: FontWeight.w700,
                          color: kSecondColor),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      defultText(
                          text:
                              'Set the new password for your account so you can login and access all the features.',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff616161)),
                      SizedBox(
                        height: 35.0.h,
                      ),
                      defultText(
                          text: 'Password',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w500,
                          color: kSecondColor),
                      SizedBox(
                        height: 22.0.h,
                      ),
                      defultTextFormFiled(
                        hintText: 'Create your new password',
                        suffix: Icons.visibility_outlined,
                      ),
                      SizedBox(
                        height: 35.0.h,
                      ),
                      defultText(
                          text: 'Confirm Password',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w500,
                          color: kSecondColor),
                      SizedBox(
                        height: 22.0.h,
                      ),
                      defultTextFormFiled(
                        hintText: 'Confirm your password',
                        suffix: Icons.visibility_outlined,
                      ),
                      SizedBox(
                        height: 43.0.h,
                      ),
                      defaultButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showModalBottomSheetResetPasswordSuccess(context);
                          },
                          text: 'Reset Password'),
                      SizedBox(
                        height: 20.0.h,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });

  showModalBottomSheetResetPasswordSuccess(context) => showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Container(
              width: 375.0.w,
              height: 592.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0.r),
                    topRight: Radius.circular(25.0.r)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 50.0.h,
                  right: 25.0.w,
                  left: 25.0.w,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: SvgPicture.asset('assets/icons/success.svg')),
                      SizedBox(
                        height: 43.0.h,
                      ),
                      defultText(
                          text: 'Reset Password Success',
                          fontSize: 24.0.sp,
                          fontWeight: FontWeight.w700,
                          color: kSecondColor),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      defultText(
                          text:
                              'Now you can login with your new password and enjoy your next level experience!',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff616161)),
                      SizedBox(
                        height: 12.0.h,
                      ),
                      defaultButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Login Now')
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
 }
