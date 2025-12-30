// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:storeappnew/Controller_class/milk_man_controller.dart';
import 'package:storeappnew/Controller_class/milk_man_history_controller.dart';
import 'package:storeappnew/Dashboard_screens/milk_collection/milk_man_details_screen.dart';
import 'package:storeappnew/Modal_class/milk_man_history.dart';
import 'package:storeappnew/Modal_class/milk_man_model.dart';
import 'package:storeappnew/api_screens/confrigation.dart';
import 'package:storeappnew/utils/Colors.dart';
import 'package:storeappnew/utils/Fontfamily.dart';

class MilkManScreen extends StatefulWidget {
  const MilkManScreen({super.key});

  @override
  State<MilkManScreen> createState() => _MilkManScreenState();
}

class _MilkManScreenState extends State<MilkManScreen> {
  MilkManController milkManController = Get.find();
  MilkManHistoryController milkManHistoryController = Get.put(
    MilkManHistoryController(),
  );

  List<Data> milkMen = [];
  @override
  void initState() {
    super.initState();

    milkMen = milkManController.milkManModel?.data ?? [];
  }

  String selectedFilter = 'All';
  String searchQuery = '';

  List<Data> getFilteredMilkMen() {
    List<Data> filtered = milkMen;

    // Apply status filter
    if (selectedFilter != 'All') {
      filtered = filtered.where((m) => m.status == selectedFilter).toList();
    }

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((m) {
        return m.name!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            m.phone!.contains(searchQuery) ||
            m.address!.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final filteredMilkMen = getFilteredMilkMen();
    final activeMilkMen = milkMen.where((m) => m.status == 'Active').length;

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: WhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: BlackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Milk Collection',
          style: TextStyle(
            color: BlackColor,
            fontFamily: FontFamily.gilroyBold,
            fontSize: 18,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          setState(() {});
        },
        color: greenColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statistics Header
            _buildStatisticsHeader(activeMilkMen),

            SizedBox(height: 2),

            // Search Bar
            _buildSearchBar(),

            SizedBox(height: 10),

            // Filter Chips
            _buildFilterChips(),

            SizedBox(height: 8),

            // Milkmen Section Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Milk Suppliers',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: FontFamily.gilroyBold,
                      color: BlackColor,
                    ),
                  ),
                  Text(
                    '${filteredMilkMen.length} suppliers',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 6),

            // Milkmen List
            Expanded(
              child: filteredMilkMen.isEmpty
                  ? _buildEmptyState()
                  : _buildMilkMenList(filteredMilkMen),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Statistics Header with gradient cards
  Widget _buildStatisticsHeader(int activeMilkMen) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              // alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
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
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: WhiteColor.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.people, color: WhiteColor, size: 24),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '$activeMilkMen',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: FontFamily.gilroyBold,
                          color: WhiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Active Suppliers',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: WhiteColor.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [buttonColor, Color(0xff8e5cff)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: buttonColor.withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: WhiteColor.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.water_drop,
                          color: WhiteColor,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${milkManController.milkManModel?.todaysCollection!.toStringAsFixed(1)}',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: FontFamily.gilroyBold,
                          color: WhiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Today\'s Collection (L)',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: WhiteColor.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Search Bar
  Widget _buildSearchBar() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        clipBehavior: Clip.antiAlias,
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search by name, phone, or location...',
          hintStyle: TextStyle(
            color: greyColor,
            fontFamily: FontFamily.gilroyMedium,
            fontSize: 12,
          ),
          prefixIcon: Icon(Icons.search, color: greyColor, size: 18),
          suffixIcon: searchQuery.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: greyColor, size: 18),
                  onPressed: () {
                    setState(() {
                      searchQuery = '';
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  // Filter Chips
  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildFilterChip('All'),
          SizedBox(width: 8),
          _buildFilterChip('Active'),
          SizedBox(width: 8),
          _buildFilterChip('Inactive'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? greenColor : WhiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? greenColor : lightgrey),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: greenColor.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.gilroyBold,
            color: isSelected ? WhiteColor : greyColor,
          ),
        ),
      ),
    );
  }

  // Milkmen List
  Widget _buildMilkMenList(List<Data> filteredMilkMen) {
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: filteredMilkMen.length,
      itemBuilder: (context, index) {
        return _buildMilkManCard(filteredMilkMen[index]);
      },
    );
  }

  // Individual Milkman Card
  Widget _buildMilkManCard(Data milkMan) {
    final isActive = milkMan.status == 'Active';
    final hasPending = milkMan.pendingAmount != '₹0';
    String calculateDailyAverage() {
      //Sum of all each milk entry quantity and divide by total entries
      return milkManHistoryController.history?.data
              ?.where((element) => element.milkmanId == milkMan.id)
              .map(
                (e) =>
                    double.parse(e.quantityLitre ?? "0") /
                    double.parse(
                      milkManHistoryController.history?.data!.length
                              .toString() ??
                          "0",
                    ),
              )
              .reduce((a, b) => a + b)
              .toStringAsFixed(2) ??
          "";
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            await milkManHistoryController.getMilkManHistory(
              milkmanId: milkMan.id,
            );
            await Get.to(MilkManDetailsScreen(milkMan: milkMan));

            // Refresh data when returning from details screen
            await milkManController.milkmanList();
            setState(() {
              milkMen = milkManController.milkManModel?.data ?? [];
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row with image and basic info
                Row(
                  children: [
                    // Profile Image
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isActive ? greenColor : greyColor,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          "${AppUrl.baseUrl + milkMan.photo!}" ??
                              "https://uxwing.com/person-profile-image-icon/",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.person,
                                size: 35,
                                color: greyColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 14),

                    // Name and Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  milkMan.name ?? "",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: FontFamily.gilroyBold,
                                    color: BlackColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? greentext.withOpacity(0.1)
                                      : greyColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  milkMan.status ?? "",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: FontFamily.gilroyBold,
                                    color: isActive ? greentext : greyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.phone, color: greyColor, size: 14),
                              SizedBox(width: 4),
                              Text(
                                milkMan.phone ?? "",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: greyColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          // Location
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: RedColor,
                                size: 16,
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  milkMan.address ?? "",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: FontFamily.gilroyMedium,
                                    color: greyColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4),

                // Divider
                Divider(color: lightgrey, height: 1),

                SizedBox(height: 8),

                // Statistics Row
                Row(
                  children: [
                    Expanded(
                      child: _buildStatItem(
                        icon: Icons.water_drop,
                        label: 'Daily Avg',
                        value: (milkMan.totalAvg ?? 0).toStringAsFixed(1) ?? "",
                        color: blueColor,
                      ),
                    ),
                    Container(height: 50, width: 1, color: lightgrey),
                    Expanded(
                      child: _buildStatItem(
                        icon: Icons.calendar_today,
                        label: 'Total Supply',
                        value:
                            (milkMan.totalSupply ?? 0).toStringAsFixed(1) ?? "",
                        color: greenColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                // Footer Row with amount
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bgcolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Amount',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: FontFamily.gilroyMedium,
                              color: greyColor,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "₹${milkMan.totalAmount ?? ""}",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: FontFamily.gilroyBold,
                              color: greenColor,
                            ),
                          ),
                        ],
                      ),
                      if (hasPending)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: orangeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: orangeColor.withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.pending_actions,
                                color: orangeColor,
                                size: 16,
                              ),
                              SizedBox(width: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pending',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: FontFamily.gilroyMedium,
                                      color: orangeColor,
                                    ),
                                  ),
                                  Text(
                                    "₹${milkMan.pendingAmount ?? ""}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: FontFamily.gilroyBold,
                                      color: orangeColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Stat Item Widget
  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            SizedBox(width: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontFamily.gilroyBold,
                color: BlackColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontFamily: FontFamily.gilroyMedium,
            color: greyColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Empty State
  Widget _buildEmptyState() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(color: bgcolor, shape: BoxShape.circle),
              child: Icon(Icons.search_off, color: greyColor),
            ),
            SizedBox(height: 24),
            Text(
              'No Suppliers Found',
              style: TextStyle(
                fontSize: 20,
                fontFamily: FontFamily.gilroyBold,
                color: BlackColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'No milk suppliers match your search criteria.\nTry adjusting the filters.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontFamily.gilroyMedium,
                color: greyColor,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
