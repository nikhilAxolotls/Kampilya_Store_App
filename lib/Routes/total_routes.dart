import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:storeappnew/Controller_class/route_controller.dart';
import 'package:storeappnew/Modal_class/route_model.dart';
import 'package:storeappnew/Routes/route_details_screen.dart';
import 'package:storeappnew/utils/Colors.dart';
import 'package:storeappnew/utils/Custom_widget.dart';
import 'package:storeappnew/utils/Fontfamily.dart';

class TotalRoutes extends StatefulWidget {
  final bool isFromRiderScreen;
  const TotalRoutes({super.key, required this.isFromRiderScreen});

  @override
  State<TotalRoutes> createState() => _TotalRoutesState();
}

class _TotalRoutesState extends State<TotalRoutes> {
  bool isLoading = false;
  //PreScriptionControllre preScriptionControllre = Get.find();
  //RouteController routeController = Get.put(RouteController());
  RouteController routeController = Get.find();

  List<AssignedRoutes> allRoutes = [];
  @override
  void initState() {
    super.initState();
    // if (widget.isFromRiderScreen) {
    //   Timer(Duration(seconds: 2), () {
    //     routeController.routeList(riderId: Get.arguments['info'].id);
    //   });
    // } else {
    //   Timer(Duration(seconds: 2), () {
    //     routeController.routeList();
    //   });
    // }
    allRoutes = routeController.routeInfo?.assignedRoutes ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: WhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: BlackColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          widget.isFromRiderScreen ? 'Assigned Routes' : 'All Routes',
          style: TextStyle(
            color: BlackColor,
            fontFamily: FontFamily.gilroyBold,
            fontSize: 18,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add_circle_outline, color: greenColor),
        //     onPressed: () {
        //       // Navigate to create route screen
        //       // Navigator.push(context, MaterialPageRoute(builder: (_) => CreateEditRouteScreen()));
        //     },
        //   ),
        // ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Add API call to refresh routes
          await Future.delayed(Duration(seconds: 1));
          routeController.routeList();
          Timer(Duration(seconds: 3), () {
            allRoutes = routeController.routeInfo!.assignedRoutes!;
          });
        },
        color: greenColor,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Statistics
              _buildHeaderStatistics(),

              SizedBox(height: 20),

              // Routes Section Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Routes',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: FontFamily.gilroyBold,
                        color: BlackColor,
                      ),
                    ),
                    Text(
                      '${allRoutes.length} total routes',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: FontFamily.gilroyMedium,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12),

              // Routes List
              allRoutes.isEmpty ? _buildEmptyState() : _buildRoutesList(),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderStatistics() {
    int totalRoutes = allRoutes.length;
    int activeRoutes = allRoutes.where((r) => r.status == 'Active').length;
    int completedRoutes =
        allRoutes.where((r) => r.status == 'Completed').length;
    int totalCustomers = 0;
    for (var route in allRoutes) {
      totalCustomers += route.customers!.length;
    }

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 53, 204, 221),
            const Color.fromARGB(255, 30, 186, 204),
            const Color.fromARGB(255, 31, 168, 184),

            //gradient.defoultColor,
            //greenColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.route, color: WhiteColor, size: 32),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Routes Overview',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: FontFamily.gilroyBold,
                    color: WhiteColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  icon: Icons.route,
                  //icon: Icons.apartment,
                  label: 'Total Routes',
                  value: '$totalRoutes',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.people,
                  label: 'Total Customers',
                  value: '$totalCustomers',
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Row(
          //   children: [
          //     Expanded(
          //       child: _buildStatItem(
          //         icon: Icons.check_circle,
          //         label: 'Active Routes',
          //         value: '$activeRoutes',
          //       ),
          //     ),
          //     SizedBox(width: 16),
          //     Expanded(
          //       child: _buildStatItem(
          //         icon: Icons.task_alt,
          //         label: 'Completed',
          //         value: '$completedRoutes',
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: WhiteColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: WhiteColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: WhiteColor, size: 24),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: FontFamily.gilroyBold,
                    color: WhiteColor,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: FontFamily.gilroyMedium,
                    color: WhiteColor.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoutesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: allRoutes.length,
      itemBuilder: (context, i) => _buildRouteCard(allRoutes[i]),
    );
  }

  Widget _buildRouteCard(AssignedRoutes route) {
    Color statusColor = _getStatusColor(route.status ?? "Pending");
    IconData statusIcon = _getStatusIcon(route.status ?? "Pending");
    double totalAmount = 0;

    int cow_halp_ltr_qty = 0;
    int cow_one_ltr_qty = 0;
    int cow_two_ltr_qty = 0;
    int cow_total_qty = 0;
    int buffalo_halp_ltr_qty = 0;
    int buffalo_one_ltr_qty = 0;
    int buffalo_two_ltr_qty = 0;
    int buffalo_total_qty = 0;
    for (var customer in route.customers!) {
      for (var item in customer.orderDetails ?? []) {
        cow_halp_ltr_qty += int.tryParse(item.cowHalpLtrQty ?? "0") ?? 0;
        cow_one_ltr_qty += int.tryParse(item.cowOneLtrQty ?? "0") ?? 0;
        cow_two_ltr_qty += int.tryParse(item.cowTwoLtrQty ?? "0") ?? 0;
        buffalo_halp_ltr_qty +=
            int.tryParse(item.buffaloHalpLtrQty ?? "0") ?? 0;
        buffalo_one_ltr_qty += int.tryParse(item.buffaloOneLtrQty ?? "0") ?? 0;
        buffalo_two_ltr_qty += int.tryParse(item.buffaloTwoLtrQty ?? "0") ?? 0;

        totalAmount +=
            double.tryParse(item.total?.replaceAll("₹", "") ?? "0") ?? 0;
      }
    }
    cow_total_qty = cow_halp_ltr_qty + cow_one_ltr_qty + cow_two_ltr_qty;
    buffalo_total_qty =
        buffalo_halp_ltr_qty + buffalo_one_ltr_qty + buffalo_two_ltr_qty;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xff006b8a), width: 0.2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Get.to(RouteDetailsScreen(), arguments: route),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header Row
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xff006b8a).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // child: Image.asset(
                    //   "assets/routeIcon.png",

                    //   //  color: Color(0xff006b8a),
                    //   height: 50,
                    //   width: 50,
                    //   fit: BoxFit.cover,
                    // ),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      //Icons.alt_route,
                      //color: Color(0xff006b8a),
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        route.routeName!,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: FontFamily.gilroyBold,
                          color: BlackColor,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${route.customers![0].society!}, ${route.customers![0].zone!} ",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: FontFamily.gilroyMedium,
                              color: blueColor,
                            ),
                          ),

                          /*
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: statusColor.withOpacity(0.3),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  statusIcon,
                                  color: statusColor,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  route.status ?? 'Unknown',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: FontFamily.gilroyBold,
                                    color: statusColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        */
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              //SizedBox(height: 14),
              Divider(color: Color(0xff006b8a), height: 10, thickness: 0.1),
              // SizedBox(height: 14),

              /// Customers and Societies Count
              Row(
                children: [
                  Icon(Icons.people, color: blueColor, size: 18),
                  SizedBox(width: 6),
                  Text(
                    "${route.customers!.length} Customers",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: BlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(width: 20),
                  Spacer(),
                  Icon(Icons.apartment, color: gradientColor, size: 18),
                  SizedBox(width: 6),
                  Text(
                    "${route.societies} Societies",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: BlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              //Rider
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.delivery_dining, color: blueColor, size: 18),
                  SizedBox(width: 6),
                  Text(
                    "${route.riderName}",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: BlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Quantity
              SizedBox(height: 10),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.inventory_2, color: Color(0xff006b8a), size: 18),
                  SizedBox(width: 6),
                  Text(
                    "Milk Quantity (Ltr) :",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: BlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              //table
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                },
                border: TableBorder.all(
                  color: Color(0xff006b8a).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  width: 1,
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      //padding: EdgeInsets.symmetric(horizontal: 10),
                      color: Color(0xff006b8a).withOpacity(0.2),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          "Milk Type/Liter",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          "0.5 Ltr",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          "1 Ltr",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          "Cow Milk",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          " ${cow_halp_ltr_qty}",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          " ${cow_one_ltr_qty}",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          " ${cow_total_qty}",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //3
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          "Buffalo Milk",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          " ${buffalo_halp_ltr_qty}",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          " ${buffalo_one_ltr_qty}",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Text(
                          " ${buffalo_total_qty}",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontFamily.gilroyMedium,
                            color: BlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              /*
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon(Icons.inventory_2, color: Color(0xff006b8a), size: 18),
                  // SizedBox(width: 6),
                  // Text(
                  //   "Quantity (Ltr) :",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     fontFamily: FontFamily.gilroyMedium,
                  //     color: BlackColor,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),

                  //SizedBox(width: 6),
                  Container(
                    height: 80,
                    width: 269,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff006b8a).withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 88,
                              alignment: Alignment.center,

                              //padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: blueColor.withOpacity(0.1),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff006b8a).withOpacity(0.5),
                                  ),
                                ),
                              ),

                              child: Text(
                                "0.5 Ltr",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: BlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Divider(
                              color: Color(0xff006b8a).withOpacity(0.5),
                              height: 6,
                              thickness: 1.5,
                            ),
                            Container(
                              height: 30,
                              width: 75,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "${halp_ltr_qty}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: BlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Color(0xff006b8a).withOpacity(0.5),
                          // margin: EdgeInsets.symmetric(horizontal: 12),
                          height: 80,
                          width: 1.5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 88,
                              alignment: Alignment.center,
                              //padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: blueColor.withOpacity(0.1),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff006b8a).withOpacity(0.5),
                                  ),
                                ),
                              ),
                              child: Text(
                                "1 Ltr",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: BlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Divider(
                              color: Color(0xff006b8a).withOpacity(0.5),
                              height: 6,
                            ),
                            Container(
                              height: 30,
                              width: 75,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "${one_ltr_qty}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: BlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Color(0xff006b8a).withOpacity(0.5),
                          // margin: EdgeInsets.symmetric(horizontal: 12),
                          height: 80,
                          width: 1.5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 88,
                              alignment: Alignment.center,
                              //padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: blueColor.withOpacity(0.1),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff006b8a).withOpacity(0.5),
                                  ),
                                ),
                              ),
                              child: Text(
                                "2 Ltr",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: BlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Divider(
                              color: Color(0xff006b8a).withOpacity(0.5),
                              height: 6,
                            ),
                            Container(
                              height: 30,
                              width: 75,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "${two_ltr_qty}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: BlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
*/
              /// Date and Time Row
              Divider(color: Color(0xff006b8a), height: 15, thickness: 0.1),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.calendar_today, color: greyColor, size: 16),
                  SizedBox(width: 6),
                  Text(
                    route.delivery_date ?? "",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: FontFamily.gilroyMedium,
                      color: greyColor,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.access_time, color: orangeColor, size: 16),
                  SizedBox(width: 6),
                  Text(
                    route.deliveryTime ?? "",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: FontFamily.gilroyMedium,
                      color: greyColor,
                    ),
                  ),
                ],
              ),

              Divider(color: Color(0xff006b8a), height: 10, thickness: 0.1),

              //Total Amount Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: greyColor,
                    ),
                  ),
                  Text(
                    "₹${totalAmount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: FontFamily.gilroyBold,
                      color: gradientColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(color: bgcolor, shape: BoxShape.circle),
              child: Icon(Icons.route_outlined, size: 80, color: greyColor),
            ),
            SizedBox(height: 24),
            Text(
              "No Routes Found",
              style: TextStyle(
                fontSize: 20,
                fontFamily: FontFamily.gilroyBold,
                color: BlackColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Create a new route to get started',
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontFamily.gilroyMedium,
                color: greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Get Status Color
  Color _getStatusColor(String? status) {
    switch (status) {
      case 'Completed':
        return gradientColor;
      case 'In Progress':
        return blueColor;
      case 'Pending':
        return orangeColor;
      case 'Cancelled':
        return RedColor;
      case 'Active':
        return gradientColor;
      default:
        return greyColor;
    }
  }

  // Get Status Icon
  IconData _getStatusIcon(String? status) {
    switch (status) {
      case 'Completed':
        return Icons.check_circle;
      case 'In Progress':
        return Icons.local_shipping;
      case 'Pending':
        return Icons.pending;
      case 'Cancelled':
        return Icons.cancel;
      case 'Active':
        return Icons.check_circle_outline;
      default:
        return Icons.info;
    }
  }
}
