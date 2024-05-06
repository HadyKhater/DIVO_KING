import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatefulWidget {
   ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
Uint8List? _image;

File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            showImagePickerOption(context);
          }, icon: Icon(Icons.notifications_none),),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  _image !=null?
                  CircleAvatar(
                    radius:60.0.r,
                    backgroundImage:MemoryImage(_image!),
                  ):CircleAvatar(
                    radius:60.0.r,
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3607/3607444.png'
                    ),
                  ),
                  Positioned(
                    bottom: -0.0.h,
                    left: 80.0.w,
                    child: CircleAvatar(
                      radius:20.0.r,
                     backgroundColor: kPrimaryColor,
                      child: IconButton(onPressed: (){
                        showImagePickerOption(context);
                      }, icon: Icon(Icons.camera_alt_outlined,
                      color: Colors.white,
                        size: 25.0,
                      ),),
                    ),
                  ),
                ],
              ),

            ),
            SizedBox(
              height: 10.0.h,
            ),
            Align(
              alignment: Alignment.center,
              child: defultText(
                  text: 'Hady Khater',
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.w700,
                  color: kSecondColor
              ),
            ),
            SizedBox(
              height: 9.0.h,
            ),
            Align(
              alignment: Alignment.center,
              child: defultText(
                  text: 'Jordan',
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.withOpacity(0.5 )
              ),
            ),
            SizedBox(
              height: 40.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    defultText(text: '12', fontSize: 28.0.sp, fontWeight: FontWeight.w700,color: kPrimaryColor),
                    defultText(text: 'Reviews', fontSize: 14.0.sp, fontWeight: FontWeight.w400,color:Colors.grey.withOpacity(0.5 )),
                  ],
                ),
                Column(
                  children: [
                    defultText(text: '20', fontSize: 28.0.sp, fontWeight: FontWeight.w700,color: kPrimaryColor),
                    defultText(text: 'Trip', fontSize: 14.0.sp, fontWeight: FontWeight.w400,color:Colors.grey.withOpacity(0.5 )),
                  ],
                ),
                Column(
                  children: [
                    defultText(text: '15', fontSize: 28.0.sp, fontWeight: FontWeight.w700,color: kPrimaryColor),
                    defultText(text: 'Bookings', fontSize: 14.0.sp, fontWeight: FontWeight.w400,color:Colors.grey.withOpacity(0.5 )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.0.h,
            ),
            defultText(
                text: 'Options',
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w700,
                color: kSecondColor
            ),
            SizedBox(
              height: 30.0.h,
            ),
            Container(
              width: double.infinity.w,
              height: 64.0.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0xffA9A9A9))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications_none,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20.0.w,
                    ),
                    defultText(
                        text: 'Notification',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    Spacer(),
                    Icon(Icons.radio_button_checked_outlined)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            Container(
              width: double.infinity.w,
              height: 64.0.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0xffA9A9A9))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/log-out.svg'),
                    SizedBox(
                      width: 20.0.w,
                    ),
                    defultText(
                        text: 'Logout',
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImagePickerOption(context){
    showModalBottomSheet(
      backgroundColor: kPrimaryColor,
        context: context,
        builder: (builder){
      return SizedBox(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/4,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(

            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    _pickImageFromGallery();
                  },
                  child: SizedBox(
                    child: Column(
                      children: [
                        Icon(Icons.image,
                          color: Colors.white,
                          size: 30.0,),
                        defultText(text: 'Gallery', fontSize: 20.0.sp, fontWeight: FontWeight.w700)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    _pickImageFromCamera();
                  },
                  child: SizedBox(
                    child: Column(
                      children: [
                        Icon(Icons.camera_alt_outlined,
                        color: Colors.white,
                          size: 30.0,
                        ),
                       defultText(text: 'Camera', fontSize: 20.0.sp, fontWeight: FontWeight.w700)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });

  }
//Gallery
  Future _pickImageFromGallery() async{
     final returnImage= await ImagePicker().pickImage(source: ImageSource.gallery);
     if(returnImage==null)return;
     setState((){
       selectedImage = File(returnImage.path);
       _image = File(returnImage.path).readAsBytesSync();
     });
     Navigator.pop(context);
   }
//camera
Future _pickImageFromCamera() async{
  final returnImage= await ImagePicker().pickImage(source: ImageSource.camera);
  if(returnImage==null)return;
  setState((){
    selectedImage = File(returnImage.path);
    _image = File(returnImage.path).readAsBytesSync();
  });
  Navigator.pop(context);
}
}


