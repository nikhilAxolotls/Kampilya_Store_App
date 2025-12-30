// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, file_names, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storeappnew/Controller_class/Addrider_controller.dart';
import 'package:storeappnew/Controller_class/Rider_controller.dart';
import 'package:storeappnew/Controller_class/route_controller.dart';
import 'package:storeappnew/Dashboard_screens/Rider_screen/Add_Rider_screen.dart';

import 'package:storeappnew/Routes/route_details_screen.dart';
import 'package:storeappnew/Routes/total_routes.dart';
import 'package:storeappnew/api_screens/confrigation.dart';
import 'package:storeappnew/utils/Colors.dart';
import 'package:storeappnew/utils/Custom_widget.dart';
import 'package:storeappnew/utils/Fontfamily.dart';

class RiderScreen extends StatefulWidget {
  const RiderScreen({super.key});

  @override
  State<RiderScreen> createState() => _RiderScreenState();
}

class _RiderScreenState extends State<RiderScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      riderlistController.riderlist();
    });
  }

  RiderlistController riderlistController = Get.put(RiderlistController());
  AddRiderController addRiderController = Get.put(AddRiderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WhiteColor,
      appBar: CustomAppbar(
        title: "Rider List",
        onTap: () {
          Get.to((() => AddRiderScreen(add: "Add")));
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GetBuilder<RiderlistController>(
          builder: (context) {
            return riderlistController.isLoading
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        // Header Statistics
                        //_buildHeaderStatistics(),
                        // Riders Section Header
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Riders',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: FontFamily.gilroyBold,
                                  color: BlackColor,
                                ),
                              ),
                              Text(
                                '${riderlistController.riderinfo?.riderdata.length} Riders',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),

                        SizedBox(
                          height: Get.height,
                          child: ListView.builder(
                            itemCount:
                                riderlistController.riderinfo?.riderdata.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                    // height: 150,
                                    width: Get.size.width,
                                    margin: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              margin: EdgeInsets.all(10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  "${AppUrl.imageurl}${riderlistController.riderinfo?.riderdata[index].img ?? ""}",
                                                  //height: 140,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 10,
                                                      ),
                                                      child: Text(
                                                        riderlistController
                                                                .riderinfo
                                                                ?.riderdata[
                                                                    index]
                                                                .title ??
                                                            "",
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: FontFamily
                                                              .gilroyBold,
                                                          color: BlackColor,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              GetBuilder<RiderlistController>(
                                                builder: (context) {
                                                  return Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "${riderlistController.riderinfo?.riderdata[index].ccode} ${riderlistController.riderinfo?.riderdata[index].mobile}",
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            color: greyColor,
                                                            fontFamily: FontFamily
                                                                .gilroyMedium,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                    ],
                                                  );
                                                },
                                              ),
                                              SizedBox(height: 5),
                                              InkWell(
                                                onTap: () async {
                                                  //new call
                                                  RouteController
                                                      routeController = Get.put(
                                                    RouteController(),
                                                  );

                                                  await routeController
                                                      .routeList(
                                                    riderId: riderlistController
                                                        .riderinfo!
                                                        .riderdata[index]
                                                        .id,
                                                  );

                                                  Get.to(
                                                    () => TotalRoutes(
                                                      isFromRiderScreen: true,
                                                    ),
                                                  );
                                                  //Get.to(
                                                  // () =>RouteDetailsScreen(),
                                                  // arguments: {
                                                  //   "info": riderlistController
                                                  //       .riderinfo!
                                                  //       .riderdata[index],
                                                  // },

                                                  // );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 16,
                                                  ),
                                                  margin: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: greenColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      6,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Assigned Routes",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: FontFamily
                                                          .gilroyMedium,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade400,
                                      ),
                                      color: WhiteColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        print(
                                          "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${riderlistController.riderinfo?.riderdata[index].id ?? ""}",
                                        );
                                        Get.to(
                                          () => AddRiderScreen(
                                            add: "edit",
                                            recordid: riderlistController
                                                    .riderinfo
                                                    ?.riderdata[index]
                                                    .id ??
                                                "",
                                          ),
                                        );
                                        addRiderController.getEditDetails(
                                          Editriderimage: riderlistController
                                              .riderinfo?.riderdata[index].img,
                                          EditRtitle: riderlistController
                                              .riderinfo
                                              ?.riderdata[index]
                                              .title,
                                          EditRideremail: riderlistController
                                              .riderinfo
                                              ?.riderdata[index]
                                              .email,
                                          EditRccode: riderlistController
                                              .riderinfo
                                              ?.riderdata[index]
                                              .ccode,
                                          EditRmobile: riderlistController
                                              .riderinfo
                                              ?.riderdata[index]
                                              .mobile
                                              .toString(),
                                          EditRpassword: riderlistController
                                              .riderinfo
                                              ?.riderdata[index]
                                              .password,
                                          estatus: riderlistController.riderinfo
                                              ?.riderdata[index].status,
                                        );
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        padding: EdgeInsets.all(9),
                                        alignment: Alignment.center,
                                        child: Image.asset("assets/Edit.png"),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: greenColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // : SizedBox(),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildHeaderStatistics() {
    int totalRiders = riderlistController.riderinfo?.riderdata.length ?? 0;
    // int activeRoutes = riderlistController.riderinfo!.riderdata.where((r) => r.status == 'Active').length;

    int totalCustomers = 0;

    return Container(
      height: 160,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [greenColor, Color(0xff006b8a)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: greenColor.withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Riders',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: FontFamily.gilroyMedium,
                      color: WhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: WhiteColor.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.people, color: WhiteColor, size: 40),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        '$totalRiders',
                        style: TextStyle(
                          fontSize: 42,
                          fontFamily: FontFamily.gilroyBold,
                          color: WhiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
