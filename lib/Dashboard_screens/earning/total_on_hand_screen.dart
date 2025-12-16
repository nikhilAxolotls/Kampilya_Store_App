import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storeappnew/Controller_class/Deshboard_controller.dart';
import 'package:storeappnew/utils/Colors.dart';
import 'package:storeappnew/utils/Custom_widget.dart';
import 'package:storeappnew/utils/Fontfamily.dart';

class OnHandEarningScreen extends StatefulWidget {
  const OnHandEarningScreen({super.key});

  @override
  State<OnHandEarningScreen> createState() => _OnHandEarningScreenState();
}

class _OnHandEarningScreenState extends State<OnHandEarningScreen> {
  DashboardController dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0,
        leading: BackButton(
          color: BlackColor,
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "On Hand Earning".tr,
          style: TextStyle(
            color: BlackColor,
            fontFamily: FontFamily.gilroyBold,
            fontSize: 17,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: greenColor,
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2), () {
            // payOutController.getPayOutList();
          });
        },
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.28,
                width: Get.size.width,
                margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 15),
                      child: Text(
                        "On Hand Earning".tr,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: FontFamily.gilroyBold,
                          color: WhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Get.height * 0.03,
                        left: 15,
                      ),
                      child: Text(
                        "${currency}${dashBoardController.onHandEarning}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 45,
                          fontFamily: FontFamily.gilroyBold,
                          color: WhiteColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 15),
                      child: Text(
                        "Your total on hand earning".tr,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: FontFamily.gilroyBold,
                          color: WhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Card.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
