import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:divo_king/controller/cubitSearch/cubit.dart';
import 'package:divo_king/controller/cubitSearch/states.dart';
import 'package:divo_king/model/FilterModel/filter_model.dart';
import 'package:divo_king/model/SearchModel/search_model.dart';
import 'package:divo_king/share/components/components.dart';
import 'package:divo_king/share/contst/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Location{
  final String address;

  Location({required this.address});
}
List<Location> getLocation(){
  return [
    Location(address: 'Aqaba, Jordan'),
    Location(address: 'cairo,egypt'),
    Location(address: 'tanta,egypt'),
    Location(address: 'octpoer,egypt'),
    Location(address: 'ebben - Main street Near abu esha store'),
    Location(address: 'aqaba'),
    Location(address: 'Aqaba'),
  ];
}
class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}
class _SearchViewState extends State<SearchView> {
  RangeValues price = RangeValues(20.0, 80.0);
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int locationIndex = 0;
  int serviceIndex = 0;
  int minIndex = 10;
  int maxIndex = 1500;
  List<Location> locations = getLocation();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit()
        ..Search(status: 'recommend')
        ..Filters(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (BuildContext context, SearchStates state) {},
        builder: (BuildContext context, SearchStates state) {
          var cubit = SearchCubit.get(context);
          // var cubitColor = SearchCubit.get(context);
          return (SearchCubit.get(context).searchModel != null &&
                  state is! DataSearchLoadingStates)
              ? Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                isScrollControlled: true,
                                builder: (context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context, void Function(void Function()) setState) {
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
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                defultText(
                                                  text: 'Location',
                                                  fontSize: 20.0.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: kSecondColor,
                                                ),
                                                SizedBox(
                                                  height: 25.0.h,
                                                ),
                                                // SingleChildScrollView(
                                                //   scrollDirection: Axis.horizontal,
                                                //   child: Row(
                                                //     children: [
                                                //       // ElevatedButton(onPressed: (){
                                                //       //
                                                //       // },
                                                //       //     child: Text(cubit.filterModel!.data!.locations!.s0!,
                                                //       //     style: TextStyle(
                                                //       //       color: cubit.selectedOption == 0 ? Colors.white : Colors.grey.withOpacity(0.2),
                                                //       //     ),
                                                //       //     ),
                                                //       // style: ElevatedButton.styleFrom(
                                                //       //   backgroundColor: cubit.selectedOption == 0 ? kPrimaryColor : Colors.white,
                                                //       // ),
                                                //       // ),
                                                //       // SizedBox(
                                                //       //   width: 20.0.w,
                                                //       // ),
                                                //       ////////////////////////////////////////////////////
                                                //       // GestureDetector(child: defultText(text: cubit.filterModel!.data!.locations!.s0!, fontSize: 12.0.sp, fontWeight:FontWeight.normal,color: kPrimaryColor)),
                                                //       defaultButtonEmpty(
                                                //           onTap: () {
                                                //
                                                //           },
                                                //           text:cubit.filterModel!.data!.locations!.s0!,
                                                //           colorBackground:cubit.selectedOption == 0
                                                //               ? kPrimaryColor.withOpacity(0.6)
                                                //               : Colors.white,
                                                //           textColor: kPrimaryColor,
                                                //           width: 82.0.w,
                                                //           height: 39.0.h),
                                                //       SizedBox(
                                                //         width: 20.0.w,
                                                //       ),
                                                //       defaultButtonEmpty(
                                                //           text: cubit.filterModel!.data!.locations!.s2!,
                                                //           width: 82.0.w,
                                                //           height: 39.0.h),
                                                //       SizedBox(
                                                //         width: 20.0.w,
                                                //       ),
                                                //       defaultButtonEmpty(
                                                //           text: cubit.filterModel!.data!.locations!.s3!,
                                                //           width: 82.0.w,
                                                //           height: 39.0.h),
                                                //       SizedBox(
                                                //         width: 20.0.w,
                                                //       ),
                                                //       defaultButtonEmpty(
                                                //           text: cubit.filterModel!.data!.locations!.s4!,
                                                //           width: 82.0.w,
                                                //           height: 39.0.h),
                                                //       SizedBox(
                                                //         width: 20.0.w,
                                                //       ),
                                                //       defaultButtonEmpty(
                                                //           text: cubit.filterModel!.data!.locations!.s5!,
                                                //           width: 82.0.w,
                                                //           height: 39.0.h),
                                                //       SizedBox(
                                                //         width: 20.0.w,
                                                //       ),
                                                //       defaultButtonEmpty(
                                                //           text: cubit.filterModel!.data!.locations!.s6!,
                                                //           width: 82.0.w,
                                                //           height: 39.0.h),
                                                //       SizedBox(
                                                //         width: 20.0.w,
                                                //       ),
                                                //       defaultButtonEmpty(
                                                //           text: cubit.filterModel!.data!.locations!.s7!,
                                                //           width: 82.0.w,
                                                //           height: 39.0.h),
                                                //     ],
                                                //   ),
                                                // ),
                                                SizedBox(height: 35.0.h,
                                                  child: ListView.separated(
                                                      scrollDirection: Axis.horizontal,
                                                      itemBuilder: (context,index)=>defaultButtonEmpty(
                                                          onTap: () {
                                                            setState(() {
                                                              locationIndex = index;
                                                              print(locationIndex);
                                                            });
                                                          },
                                                          text:locations[index].address,
                                                          colorBackground:locationIndex == index
                                                              ? kPrimaryColor.withOpacity(0.6)
                                                              : Colors.white,
                                                          textColor: locationIndex == index
                                                              ? kPrimaryColor.withOpacity(0.6)
                                                              : Colors.black,
                                                          width: 82.0.w,
                                                          height: 39.0.h),
                                                      separatorBuilder: (context,index)=>SizedBox(
                                                        width: 10.0.w,
                                                      ), itemCount: locations.length),
                                                ),
                                                SizedBox(
                                                  height: 50.0.h,
                                                ),
                                                defultText(
                                                  text: 'Price Range',
                                                  fontSize: 20.0.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: kSecondColor,
                                                ),
                                                SizedBox(
                                                  height: 50.0.h,
                                                ),
                                                RangeSlider(
                                                    values: price,
                                                    min:0,
                                                    max:100.0,
                                                    onChanged:
                                                        (RangeValues values) {
                                                      print(price);
                                                      setState(() {
                                                        price = values;
                                                      });
                                                    }),
                                                defultText(
                                                  text: 'Service',
                                                  fontSize: 20.0.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: kSecondColor,
                                                ),
                                                SizedBox(
                                                  height: 25.0.h,
                                                ),
                                                SizedBox(
                                                  height: 50.0.h,
                                                  child: ListView.separated(
                                                      scrollDirection: Axis.horizontal,
                                                      shrinkWrap: true,
                                                      itemBuilder: (context,index)=>defaultButtonEmpty(
                                                          onTap: () {
                                                            setState(() {
                                                              serviceIndex = index;
                                                              print(serviceIndex);
                                                            });
                                                          },
                                                          text:cubit.filterModel!.data!.services![index].name!,
                                                          colorBackground:serviceIndex == index
                                                              ? kPrimaryColor.withOpacity(0.6)
                                                              : Colors.white,
                                                          textColor: serviceIndex == index
                                                              ? kPrimaryColor.withOpacity(0.6)
                                                              : Colors.black,
                                                          width: 82.0.w,
                                                          height: 39.0.h),
                                                      separatorBuilder: (context,index)=>SizedBox(
                                                        width: 10.0.w,
                                                      ),
                                                      itemCount: cubit.filterModel!.data!.services!.length!),
                                                ),
                                                // SingleChildScrollView(
                                                //   scrollDirection: Axis.horizontal,
                                                //   child: Row(
                                                //     children: [
                                                //       defaultButtonEmpty(
                                                //           text: cubit.filterModel!.data!.services![index].id!,
                                                //           width: 110.0.w,
                                                //           height: 39.0.h),
                                                //       SizedBox(
                                                //         width: 20.0.w,
                                                //       ),
                                                //       defaultButtonEmpty(
                                                //           text: 'Diving',
                                                //           width: 81.0.w,
                                                //           height: 39.0.h),
                                                //       SizedBox(
                                                //         width: 20.0.w,
                                                //       ),
                                                //       defaultButtonEmpty(
                                                //           text: 'Courses',
                                                //           width: 91.0.w,
                                                //           height: 39.0.h),
                                                //     ],
                                                //   ),
                                                // ),
                                                // SingleChildScrollView(
                                                //   scrollDirection: Axis.horizontal,
                                                //   child: Row(
                                                //     children: [
                                                //       defaultButtonEmpty(
                                                //           text: 'SearchCubit.get(context).filterModel!.data!.services![index].name!',
                                                //           width: 110.0.w,
                                                //           height: 39.0.h),
                                                //       SizedBox(
                                                //         width: 20.0.w,
                                                //       ),
                                                //       defaultButtonEmpty(
                                                //           text: 'SearchCubit.get(context).filterModel!.data!.services![index].name!',
                                                //           width: 81.0.w,
                                                //           height: 39.0.h),
                                                //       SizedBox(
                                                //         width: 20.0.w,
                                                //       ),
                                                //       defaultButtonEmpty(
                                                //           text: 'SearchCubit.get(context).filterModel!.data!.services![index].name!',
                                                //           width: 91.0.w,
                                                //           height: 39.0.h),
                                                //       defaultButtonEmpty(
                                                //           text:' SearchCubit.get(context).filterModel!.data!.services![index].name!',
                                                //           width: 91.0.w,
                                                //           height: 39.0.h),
                                                //     ],
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  height: 100.0.h,
                                                ),
                                                defaultButton(
                                                    onPressed: () {
                                                    cubit.DataSearch(
                                                    name: nameController.text,
                                                    location: locations[locationIndex].address,
                                                    service: cubit.filterModel!.data!.services![serviceIndex].id.toString(),
                                                    maxPrice: cubit.filterModel!.data!.maxPrice!,
                                                      minPrice: cubit.filterModel!.data!.minPrice!,
                                                  );
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SearchView()));
                                                    },
                                                    text: 'Apply Filter'),
                                                SizedBox(
                                                  height: 20.0.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ) ; 
                                    },

                                  );
                                });
                          },
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset('assets/icons/filter.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          defultTextFormFiled(
                            controller: searchController,
                            hintText: 'Find your Admire Place',
                            prefix: Icons.search,
                            onSubmitted: (String names) {
                              SearchCubit.get(context).Search(
                                status: 'recommend',
                                name: searchController.text,
                              );
                            },
                          ),
                          Container(
                            width: 300.0.w,
                            height: 54.0.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27.0.r),
                                color: Colors.white),
                            child: Row(
                              children: [
                                defultTextButton(
                                    onPressed: () {
                                      SearchCubit.get(context)
                                          .Search(status: 'recommend');
                                      SearchCubit.get(context)
                                          .setSelectedOption(0);
                                    },
                                    text: 'Recommend',
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w700,
                                    color: SearchCubit.get(context)
                                                .selectedOption == 0
                                        ? kPrimaryColor
                                        : Colors.grey.withOpacity(0.5)),
                                SizedBox(
                                  width: 4.0.w,
                                ),
                                defultTextButton(
                                    onPressed: () {
                                      SearchCubit.get(context)
                                          .Search(status: 'center');
                                      SearchCubit.get(context)
                                          .setSelectedOption(1);
                                    },
                                    text: 'Center',
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w700,
                                    color: SearchCubit.get(context)
                                                .selectedOption == 1
                                        ? kPrimaryColor
                                        : Colors.grey.withOpacity(0.5)),
                                defultTextButton(
                                    onPressed: () {
                                      SearchCubit.get(context)
                                          .Search(status: 'service');
                                      SearchCubit.get(context)
                                          .setSelectedOption(2);
                                    },
                                    text: 'Service',
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w700,
                                    color: SearchCubit.get(context)
                                                .selectedOption == 2
                                        ? kPrimaryColor
                                        : Colors.grey.withOpacity(0.5)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          Expanded(
                            child: ConditionalBuilder(
                              condition: state is! SearchLoadingStates,
                              builder: (context) => Container(
                                child: GridView.count(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 25.0.w,
                                  mainAxisSpacing: 25.0.h,
                                  childAspectRatio: 1 / 2.0,
                                  // padding: EdgeInsets.all(16.0),
                                  children: List.generate(
                                      SearchCubit.get(context)
                                          .searchModel!
                                          .data!
                                          .length,
                                      (index) => builderWidgetSearch(
                                          searchModel: SearchCubit.get(context)
                                              .searchModel,
                                          context: context,
                                          index: index)),
                                ),
                              ),
                              fallback: (context) => Scaffold(
                                backgroundColor: Colors.white,
                                body: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
        },
      ),
    );
  }
}

Widget builderWidgetSearch(
        {required SearchModel? searchModel, index, context}) =>
    Container(
// width: 150.0.w,
// height: 242.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://media.istockphoto.com/id/498283106/photo/underwater-scuba-diver-explore-and-enjoy-coral-reef-sea-life.webp?s=1024x1024&w=is&k=20&c=-y2BATetieJjRS6EwA8VQ_ojDUK-P19rqPdP4WWlHvY=', // use image in model from Bake end
                width: 125.0.w,
                height: 130.0.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            defultText(
                text:
                    '${SearchCubit.get(context).searchModel!.data![index].name}',
                fontSize: 12.0.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff3E3E3E)),
            SizedBox(
              height: 7.0.h,
            ),
            defultText(
                text:
                    '${SearchCubit.get(context).searchModel!.data![index].address}',
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Color(0xff3E3E3E)),
            SizedBox(
              height: 5.0.h,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/Star.svg'),
                defultText(
                    text: '4,6',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFD9942)),
                Spacer(),
                Container(
                  width: 35.0.w,
                  height: 35.0.h,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0.r),
                      bottomRight: Radius.circular(10.0.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 22.0.w,
                        height: 25.0.h,
                        child: Column(
                          children: [
                            defultText(
                                text:
                                    '${SearchCubit.get(context).searchModel!.data![index].price}',
                                fontSize: 8.0,
                                fontWeight: FontWeight.w700),
                            Align(
                              alignment: Alignment.centerRight,
                              child: defultText(
                                  text: 'JD',
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );


// Widget builderWidgetService(
//    FilterModel filterModel, index, context
// )=>Row(
//   children: [
//     defaultButtonEmpty(
//         text: SearchCubit.get(context).filterModel!.data!.services![index].name!,
//         width: 110.0.w,
//         height: 39.0.h),
//     SizedBox(
//       width: 20.0.w,
//     ),
//     defaultButtonEmpty(
//         text: SearchCubit.get(context).filterModel!.data!.services![index].name!,
//         width: 81.0.w,
//         height: 39.0.h),
//     SizedBox(
//       width: 20.0.w,
//     ),
//     defaultButtonEmpty(
//         text: SearchCubit.get(context).filterModel!.data!.services![index].name!,
//         width: 91.0.w,
//         height: 39.0.h),
//     defaultButtonEmpty(
//         text: SearchCubit.get(context).filterModel!.data!.services![index].name!,
//         width: 91.0.w,
//         height: 39.0.h),
//   ],
// );