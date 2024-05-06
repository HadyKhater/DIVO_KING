import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:divo_king/controller/cubitAuth/cubit.dart';
import 'package:divo_king/controller/cubitAuth/states.dart';
import 'package:divo_king/controller/cubitSignUp/cubit/cubit.dart';
import 'package:divo_king/controller/cubitSignUp/cubit/states.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:divo_king/view/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingUpView extends StatefulWidget {
  SingUpView({super.key});

  @override
  State<SingUpView> createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController password_confirmationController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AuthCubit(),
      child: BlocConsumer<AuthCubit,AuthStates>(
        listener: (context,state){
          if(state is AuthSuccessStates){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
          }
        },
        builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.white,
            ),
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SvgPicture.asset('assets/icons/logo.svg'),
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: defultText(
                                    text: 'Log In',
                                    fontSize: 20.0.sp,
                                    color: Colors.grey.withOpacity(0.5),
                                    fontWeight: FontWeight.w700
                                ),
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
                          Spacer(),
                          Column(
                            children: [
                              defultText(
                                text: 'Sign Up',
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
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
                        ],
                      ),
                      SizedBox(
                        height: 45.0.h,
                      ),
                      defultText(
                          text: 'Name User', fontSize: 16.0.sp, fontWeight: FontWeight.w500,color: kSecondColor),
                      SizedBox(
                        height: 22.0.h,
                      ),
                      defultTextFormFiled(
                          controller: userNameController,
                          hintText: 'Enter your username',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'User Name Is Empty';
                            }
                            return null;
                          }
                      ),
                      defultText(
                          text: 'Phone', fontSize: 16.0.sp, fontWeight: FontWeight.w500,color: kSecondColor),
                      SizedBox(
                        height: 22.0.h,
                      ),
                      defultTextFormFiled(
                          controller: phoneController,
                          hintText: 'Enter your Phone',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please Enter Phone';
                            }
                            return null;
                          }),
                      defultText(
                          text: 'E-mail', fontSize: 16.0.sp, fontWeight: FontWeight.w500,color: kSecondColor),
                      SizedBox(
                        height: 22.0.h,
                      ),
                      defultTextFormFiled(
                          controller: emailController,
                          hintText: 'Enter your username or E-mail',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please Enter E-mail';
                            }
                            return null;
                          }),
                      defultText(
                          text: 'Password', fontSize: 16.0.sp, fontWeight: FontWeight.w500,color: kSecondColor),
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
                          validator: (value){
                            if(value!.isEmpty){
                              return 'This password is to short';
                            }
                            return null;
                          }),
                      defultText(
                          text: 'password confirmation', fontSize: 16.0.sp, fontWeight: FontWeight.w500,color: kSecondColor),
                      SizedBox(
                        height: 22.0.h,
                      ),
                      defultTextFormFiled(
                          controller: password_confirmationController,
                          hintText: 'Enter your password confirmation',
                          suffix: AuthCubit.get(context).suffix,
                          colorIconSuffix: Colors.grey.withOpacity(0.5),
                          isPassword: AuthCubit.get(context).isPassword,
                          suffixPressed: () {
                            AuthCubit.get(context).changePasswordVisibility();
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return 'This password is to short';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 29.0.h,
                      ),
                      ConditionalBuilder(condition:state is! AuthLoadingStates ,
                          builder: (context)=>defaultButton(
                            text: 'Sign Up',
                            onPressed: () {
                              if(formKey.currentState!.validate()){
                                AuthCubit.get(context).UserSingUp(
                                  name: userNameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  password_confirmation:password_confirmationController.text,
                                );
                              }
                            },
                          ),
                          fallback: (context)=>Center(child: CircularProgressIndicator())),
                      SizedBox(
                        height: 20.0.h,
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
}
