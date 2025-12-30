// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:storeappnew/Controller_class/add_milk_controller.dart';
import 'package:storeappnew/Controller_class/milk_man_controller.dart';
import 'package:storeappnew/Controller_class/milk_man_history_controller.dart';
import 'package:storeappnew/Modal_class/add_milk_model.dart';
import 'package:storeappnew/Modal_class/milk_man_history.dart';
import 'package:storeappnew/Modal_class/milk_man_model.dart';
import 'package:storeappnew/api_screens/confrigation.dart';
import 'package:storeappnew/api_screens/data_store.dart';
import 'package:storeappnew/utils/Colors.dart';
import 'package:storeappnew/utils/Fontfamily.dart';
import 'package:url_launcher/url_launcher.dart';

class MilkManDetailsScreen extends StatefulWidget {
  final Data milkMan;

  const MilkManDetailsScreen({super.key, required this.milkMan});

  @override
  State<MilkManDetailsScreen> createState() => _MilkManDetailsScreenState();
}

class _MilkManDetailsScreenState extends State<MilkManDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  MilkManHistoryController milkManHistoryController = Get.find();

  AddMilkController addMilkController = Get.put(AddMilkController());
  MilkManController milkManController = Get.find();

  // Daily history data - removed final to allow updates
  /*
  List<Map<String, dynamic>> dailyHistory = [
    {
      'date': '2025-12-04',
      'day': 'Today',
      'milkType': 'Cow',
      'quantity': '45 L',
      'fat': '4.2',
      'snf': '8.5',
      'quality': 'Excellent',
      'morningAmount': '2,250',
      'eveningAmount': '1,900',
      'totalAmount': '4,150',
      'status': 'Collected',
      'collectionTime': '06:30 AM / 06:00 PM',
      'paymentStatus': 'Pending',
    },
    {
      'date': '2025-12-03',
      'day': 'Yesterday',
      'milkType': 'Buffalo',
      'quantity': '40 L',
      'fat': '4.1',
      'snf': '8.4',
      'quality': 'Excellent',
      'morningAmount': '2,100',
      'eveningAmount': '2,000',
      'totalAmount': '4,100',
      'status': 'Collected',
      'collectionTime': '06:25 AM / 06:10 PM',
      'paymentStatus': 'Paid',
    },
   
  ];
*/
  List<HistoryData> dailyHistory = [];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    dailyHistory = milkManHistoryController.history?.data ?? [];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String getDayName(String supplyDate) {
    // supplyDate format: yyyy-MM-dd
    DateTime date = DateTime.parse(supplyDate);
    return DateFormat('yyyy-MM-dd').format(DateTime.now()) == supplyDate
        ? 'Today'
        : DateFormat('EEEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // App Bar with Profile
            _buildSliverAppBar(),

            // Dashboard Cards
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  _buildDashboardCards(),
                  SizedBox(height: 10),
                ],
              ),
            ),

            // Tabs Header
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: greenColor,
                  unselectedLabelColor: greyColor,
                  indicatorColor: greenColor,
                  indicatorWeight: 3,
                  labelStyle: TextStyle(
                    fontFamily: FontFamily.gilroyBold,
                    fontSize: 15,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontFamily: FontFamily.gilroyMedium,
                    fontSize: 15,
                  ),
                  tabs: [
                    Tab(text: 'Daily History'),
                    Tab(text: 'Information'),
                  ],
                ),
              ),
            ),
          ];
        },

        // Tab Content
        body: TabBarView(
          controller: _tabController,
          children: [_buildDailyHistoryTab(), _buildInformationTab()],
        ),
      ),
    );
  }

  // Sliver App Bar with Profile
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 130,
      collapsedHeight: 130,
      pinned: true,
      backgroundColor: WhiteColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: WhiteColor),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        InkWell(
          child: Icon(Icons.call, color: WhiteColor),
          onTap: () async {
            //launch Dialer
            final Uri phoneUri = Uri(
              scheme: 'tel',

              path: widget.milkMan.phone.toString(), // phone number
            );

            if (await canLaunchUrl(phoneUri)) {
              await launchUrl(phoneUri);
            } else {
              Fluttertoast.showToast(msg: 'Something went wrong');
            }
          },
        ),
        SizedBox(width: 10),
        InkWell(
          child: Container(
            height: 30,
            width: 100,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: WhiteColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: WhiteColor, width: 2),
            ),
            child: Text(
              "Add Milk",
              style: TextStyle(
                color: Color(0xff006b8a),
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          onTap: () {
            _showAddMilkBottomSheet();
          },
        ),
        // IconButton(
        //   icon: Icon(Icons.more_vert, color: WhiteColor),
        //   onPressed: () {
        //     // More options
        //   },
        // ),
      ],
      flexibleSpace: Container(
        //alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [greenColor, Color(0xff006b8a)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //SizedBox(height: 30),
              // Profile Image
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: WhiteColor, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        "${AppUrl.baseUrl + widget.milkMan.photo!}",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: greyColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.milkMan.name ?? 'N/A',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: FontFamily.gilroyBold,
                                  color: WhiteColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Last Delivery: ${dailyHistory[0].supplyDate ?? 'Never'}\n${getDayName(dailyHistory[0].supplyDate ?? "")}",
                            // 'Last Delivery: ${widget.milkMan['lastDelivery'] ?? 'Never'}',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: FontFamily.gilroyMedium,
                              color: WhiteColor.withOpacity(0.9),
                            ),
                          ),
                        ),
                        // Rating

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Icon(Icons.star, color: yelloColor, size: 20),
                        //     SizedBox(width: 4),
                        //     Text(
                        //       '${widget.milkMan['rating'] ?? '0.0'} Rating',
                        //       style: TextStyle(
                        //         fontSize: 15,
                        //         fontFamily: FontFamily.gilroyBold,
                        //         color: WhiteColor,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: widget.milkMan.status == 'Active'
                          ? greentext
                          : greyColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.milkMan.status ?? 'Unknown',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: FontFamily.gilroyBold,
                        color: WhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  // Dashboard Cards
  Widget _buildDashboardCards() {
    //calculate total supply
    String calculateTotalSupply() {
      final list = milkManHistoryController.history?.data ?? [];

      final total = list.fold<double>(
        0.0,
        (sum, e) => sum + double.tryParse(e.quantityLitre ?? "0")!,
      );

      return total.toStringAsFixed(1);
    }

    //calculate total amount
    String calculateTotalAmount() {
      final list = milkManHistoryController.history?.data ?? [];

      final total = list.fold<double>(
        0.0,
        (sum, e) => sum + double.tryParse(e.totalPrice ?? "0")!,
      );

      return total.toStringAsFixed(1);
    }

    //Daily Average = (Total quantity of milk supplied) / (Number of unique supply dates)
    // String calculateDailyAverage() {
    //   final list = milkManHistoryController.history?.data ?? [];

    //   if (list.isEmpty) return "0.00";

    //   final total = list.fold<double>(
    //     0.0,
    //     (sum, e) => sum + double.tryParse(e.quantityLitre ?? "0")!,
    //   );

    //   final average = total / list.length;
    //   return average.toStringAsFixed(2);
    // }

    String calculateDailyAverageMilk() {
      final data = milkManHistoryController.history?.data ?? [];

      if (data.isEmpty) return "0.00";

      // Map to store total milk per day
      Map<String, double> dailyTotals = {};

      for (var e in data) {
        final date = e.supplyDate; // expected yyyy-MM-dd
        final qty = double.tryParse(e.quantityLitre ?? "0") ?? 0;

        if (date == null || date.isEmpty) continue;

        dailyTotals[date] = (dailyTotals[date] ?? 0) + qty;
      }

      if (dailyTotals.isEmpty) return "0.00";

      // Total milk across all days
      double totalMilk = dailyTotals.values.fold(0, (a, b) => a + b);

      // Number of unique days
      int totalDays = dailyTotals.length;

      double dailyAvg = totalMilk / totalDays;

      return dailyAvg.toStringAsFixed(1);
    }

    //calculate buffalo milk supply
    String calculateBuffaloMilkSupply() {
      final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

      final list = milkManHistoryController.history?.data ?? [];

      final total = list
          .where(
            (e) =>
                e.milkType?.toLowerCase() == "buffalo" && e.supplyDate == today,
          )
          .fold<double>(
            0.0,
            (sum, e) => sum + double.tryParse(e.quantityLitre ?? "0")!,
          );

      return total.toStringAsFixed(1);
    }

    //calculate cow milk supply
    String calculateCowMilkSupply() {
      final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

      final list = milkManHistoryController.history?.data ?? [];

      final total = list
          .where(
            (e) => e.milkType?.toLowerCase() == "cow" && e.supplyDate == today,
          )
          .fold<double>(
            0.0,
            (sum, e) => sum + double.tryParse(e.quantityLitre ?? "0")!,
          );

      return total.toStringAsFixed(1);
    }

    return Column(
      children: [
        // First Row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Flexible(
                child: _buildDashboardCard(
                  icon: Icons.water_drop,
                  label: 'Total Supply',
                  value:
                      calculateTotalSupply(), // widget.milkMan.totalMilkSupplied ?? "",
                  color: blueColor,
                ),
              ),
              SizedBox(width: 8),
              Flexible(
                child: _buildDashboardCard(
                  icon: Icons.trending_up,
                  label: 'Daily Average',
                  value:
                      calculateDailyAverageMilk(), //widget.milkMan.dailyAverage ?? "",
                  color: greenColor,
                ),
              ),
            ],
          ),
        ),
        // Second Row
        SizedBox(height: 8),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16),
        //   child: _buildDashboardCard(
        //     icon: Icons.account_balance_wallet,
        //     label: 'Total Amount',
        //     value:
        //         calculateTotalAmount(), //'₹${widget.milkMan.totalAmount ?? '0'}',
        //     color: buttonColor,
        //   ),
        // ), //
        // SizedBox(height: 8),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: _buildDashboardCard(
        //     icon: Icons.pending_actions,
        //     label: 'Pending Amount',
        //     value: '₹${widget.milkMan.pendingAmount ?? '0'}',
        //     color: orangeColor,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildDashboardCard(
                  icon: Icons.account_balance_wallet,
                  label: 'Total Amount',
                  value:
                      "₹${calculateTotalAmount()}", //'₹${widget.milkMan.totalAmount ?? '0'}',
                  color: buttonColor,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildDashboardCard(
                  icon: Icons.pending_actions,
                  label: 'Pending Amount',
                  value: '₹${widget.milkMan.pendingAmount ?? '0'}',
                  color: orangeColor,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8),
        // Third Row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildDashboardCard(
                  iconString: '🐄',
                  icon: Icons.pets,
                  label: 'Cows Milk Rate (₹/L)',
                  value: '₹${widget.milkMan.todayRate!.cow!}',
                  color: Color(0xff8B4513),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildDashboardCard(
                  iconString: '🐃',
                  icon: Icons.pets,
                  label: 'Buffaloes Milk Rate (₹/L)',
                  value: '₹${widget.milkMan.todayRate!.buffalo!}',
                  color: Color(0xff696969),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        // Third Row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildDashboardCard(
                  iconString: '🐄',
                  icon: Icons.pets,
                  label: 'Today Cow Milk Supply (L)',
                  value: '${calculateCowMilkSupply()}',
                  color: Color(0xff8B4513),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildDashboardCard(
                  iconString: '🐃',
                  icon: Icons.pets,
                  label: 'Today Buffalo Milk Supply (L)',
                  value: '${calculateBuffaloMilkSupply()}',
                  color: Color(0xff696969),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Dashboard Card
  Widget _buildDashboardCard({
    String? iconString,
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: iconString != null
                    ? Text(
                        iconString,
                        style: TextStyle(color: color, fontSize: 22),
                      )
                    : Icon(icon, color: color, size: 28),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: FontFamily.gilroyBold,
                        color: BlackColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 1),
                    Text(
                      label,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: FontFamily.gilroyMedium,
                        color: greyColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Daily History Tab
  Widget _buildDailyHistoryTab() {
    return RefreshIndicator(
      color: greenColor,
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        await milkManHistoryController.getMilkManHistory(
          milkmanId: widget.milkMan.id,
        );
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: dailyHistory.length,
        itemBuilder: (context, index) {
          final item = dailyHistory[index];
          return _buildHistoryCard(item);
        },
      ),
    );
  }

  // History Card
  Widget _buildHistoryCard(HistoryData history) {
    final isMissed = history.status == 'Missed';
    final statusColor = isMissed
        ? RedColor
        : (history.quality == 'Excellent' || history.quality == 'Good'
            ? greentext
            : history.quality == 'Poor'
                ? Colors.red
                : yelloColor);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isMissed ? RedColor.withOpacity(0.3) : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        isMissed ? Icons.close : Icons.check_circle,
                        color: statusColor,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getDayName(history.supplyDate ?? ""),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontFamily.gilroyBold,
                            color: BlackColor,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          history.supplyDate ?? "",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: FontFamily.gilroyMedium,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor.withOpacity(0.3)),
                  ),
                  child: Text(
                    history.status ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: FontFamily.gilroyBold,
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),

            if (!isMissed) ...[
              SizedBox(height: 8),

              // Divider
              //   Divider(color: lightgrey, height: 1),
              //SizedBox(height: 8),

              //
              Divider(color: greenColor.withOpacity(0.5), height: 1),
              SizedBox(height: 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            history.milkType == 'cow' ? '🐄' : '🐃',
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${double.tryParse(history.quantityLitre ?? '0')!.toStringAsFixed(1)} L",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: FontFamily.gilroyBold,
                              color: BlackColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${history.milkType?.replaceAll("cow", "Cow").replaceAll("buffalo", "Buffalo")} Milk',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamily.gilroyMedium,
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                  Container(height: 60, width: 1, color: lightgrey),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('💸', style: TextStyle(fontSize: 25)),
                          SizedBox(width: 10),
                          Text(
                            '₹${double.tryParse(history.totalPrice ?? '0')!.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: FontFamily.gilroyBold,
                              color: BlackColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Total Amount',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamily.gilroyMedium,
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 8),

              // Quality Metrics
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: bgcolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildQualityMetric(
                          'Fat',
                          '${history.fat}%',
                          blueColor,
                        ),
                        Container(height: 30, width: 1, color: lightgrey),
                        _buildQualityMetric(
                          'SNF',
                          '${history.snf}%',
                          greenColor,
                        ),
                        Container(height: 30, width: 1, color: lightgrey),
                        _buildQualityMetric(
                          'Rate',
                          '₹${history.todaysRate}',
                          greenColor,
                        ),
                        Container(height: 30, width: 1, color: lightgrey),
                        _buildQualityMetric(
                          'Quality',
                          history.quality ?? "",
                          statusColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),
              // Collection Time
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time, color: redgradient, size: 14),
                  SizedBox(width: 4),
                  Text(
                    history.supplyTime ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: FontFamily.gilroyMedium,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ] else ...[
              SizedBox(height: 8),
              Center(
                child: Text(
                  'No collection recorded for this day',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontFamily.gilroyMedium,
                    color: greyColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Collection Info Widget
  Widget _buildCollectionInfo(
    String label,
    String quantity,
    String amount,
    IconData icon,
    Color color,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(icon, color: color, size: 24),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontFamily: FontFamily.gilroyMedium,
                color: greyColor,
              ),
            ),
          ],
        ),
        SizedBox(width: 12),
        Column(
          children: [
            Text(
              quantity,
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontFamily.gilroyBold,
                color: BlackColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              amount,
              style: TextStyle(
                fontSize: 12,
                fontFamily: FontFamily.gilroyBold,
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Quality Metric Widget
  Widget _buildQualityMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontFamily: FontFamily.gilroyMedium,
            color: greyColor,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.gilroyBold,
            color: color,
          ),
        ),
      ],
    );
  }

  // Information Tab
  Widget _buildInformationTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Contact Information'),
          SizedBox(height: 12),
          _buildInfoCard([
            _buildInfoRow(Icons.person, 'Name', widget.milkMan.name ?? ""),
            _buildInfoRow(Icons.phone, 'Phone', widget.milkMan.phone ?? ""),
            _buildInfoRow(
              Icons.location_on,
              'Address',
              widget.milkMan.address ?? "",
            ),
            _buildInfoRow(
              Icons.calendar_today,
              'Joined Date',
              widget.milkMan.createdAt?.substring(0, 10) ?? "",
            ),
            _buildInfoRow(
              Icons.event,
              'Last Delivery',
              " ${dailyHistory[0].supplyDate ?? ""} (${getDayName(dailyHistory[0].supplyDate ?? "")})",
            ),
          ]),
          // SizedBox(height: 20),
          // _buildSectionTitle('Business Details'),
          // SizedBox(height: 12),
          // _buildInfoCard([
          // _buildInfoRow(
          //   Icons.pets,
          //   'Cow Milk Rate',
          //   '₹${widget.milkMan.cowMilkRate}/L',
          // ),
          // _buildInfoRow(
          //   Icons.pets,
          //   'Buffalo Milk Rate',
          //   '₹${widget.milkMan.buffaloMilkRate}/L',
          // ),
          //]),
          // SizedBox(height: 20),
          // _buildSectionTitle('Performance Metrics'),
          // SizedBox(height: 12),
          // _buildInfoCard([
          //   _buildInfoRow(
          //     Icons.water_drop,
          //     'Total Supply',
          //     widget.milkMan.totalMilkSupplied ?? "",
          //   ),
          //   _buildInfoRow(
          //     Icons.trending_up,
          //     'Daily Average',
          //     widget.milkMan.dailyAverage ?? "",
          //   ),
          // ]),
          // SizedBox(height: 20),
          // _buildSectionTitle('Financial Summary'),
          // SizedBox(height: 12),
          // _buildInfoCard([
          //   _buildInfoRow(
          //     Icons.account_balance_wallet,
          //     'Total Amount',
          //     '₹${widget.milkMan.totalAmount ?? ""}',
          //   ),
          //   _buildInfoRow(
          //     Icons.pending_actions,
          //     'Pending Amount',
          //     '₹${widget.milkMan.pendingAmount ?? ""}',
          //   ),
          //   _buildInfoRow(
          //     Icons.payment,
          //     'Paid Amount',
          //     '₹${(int.tryParse(widget.milkMan.totalAmount?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0') ?? 0) - (int.tryParse(widget.milkMan.pendingAmount?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0') ?? 0)}',
          //   ),
          // ]),
        ],
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontFamily: FontFamily.gilroyBold,
        color: BlackColor,
      ),
    );
  }

  // Info Card
  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  // Info Row
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: lightgrey.withOpacity(0.5), width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: greenColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: greenColor, size: 20),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: FontFamily.gilroyMedium,
                    color: greyColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: FontFamily.gilroyBold,
                    color: BlackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Get Payment Status Color
  Color _getPaymentStatusColor(String? status) {
    switch (status) {
      case 'Paid':
        return greentext;
      case 'Pending':
        return orangeColor;
      case 'Partial':
        return yelloColor;
      case 'N/A':
        return greyColor;
      default:
        return greyColor;
    }
  }

  // Get Payment Icon
  IconData _getPaymentIcon(String? status) {
    switch (status) {
      case 'Paid':
        return Icons.check_circle;
      case 'Pending':
        return Icons.pending;
      case 'Partial':
        return Icons.schedule;
      case 'N/A':
        return Icons.block;
      default:
        return Icons.info;
    }
  }

  // Get Payment Method Icon
  IconData _getPaymentMethodIcon(String? method) {
    switch (method) {
      case 'Cash':
        return Icons.money;
      case 'UPI':
        return Icons.qr_code_2;
      case 'Bank Transfer':
        return Icons.account_balance;
      default:
        return Icons.payment;
    }
  }

  void _showAddMilkBottomSheet() {
    final TextEditingController fatController = TextEditingController();
    final TextEditingController snfController = TextEditingController();
    DateTime selectedDate = DateTime.now();
    String selectedQuality = 'Excellent';

    double calculateTotal() {
      final rateStr = milkManHistoryController.selectedMilkType.value == "Cow"
          ? widget.milkMan.todayRate!.cow
          : widget.milkMan.todayRate!.buffalo;
      final qtyStr = milkManHistoryController.qtyController.text;

      if (rateStr == null || rateStr.isEmpty) return 0.0;
      if (qtyStr.isEmpty) return 0.0;

      // Extract only numbers/decimals from rate in case it contains ₹ of other chars
      final cleanRateStr = rateStr.replaceAll(RegExp(r'[^0-9.]'), '');
      final rate = double.tryParse(cleanRateStr) ?? 0.0;
      final qty = double.tryParse(qtyStr) ?? 0.0;

      return rate * qty;
    }

    double currentTotal = calculateTotal();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setBottomSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 10,
                        width: 50,
                        decoration: BoxDecoration(
                          color: greenColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: WhiteColor, width: 2),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Milk",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: FontFamily.gilroyBold,
                            color: BlackColor,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 5),

                    // Date Selection
                    InkWell(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null && picked != selectedDate) {
                          setBottomSheetState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: lightgrey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today, color: greenColor),
                            SizedBox(width: 10),
                            Text(
                              DateFormat('dd-MM-yyyy').format(selectedDate),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: FontFamily.gilroyMedium,
                                color: BlackColor,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Change",
                              style: TextStyle(
                                color: blueColor,
                                fontFamily: FontFamily.gilroyBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Milk Type Selection
                    Text(
                      "Select Milk Type",
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyMedium,
                        color: greyColor,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Cow',
                          groupValue:
                              milkManHistoryController.selectedMilkType.value,
                          activeColor: greenColor,
                          onChanged: (value) {
                            setBottomSheetState(() {
                              milkManHistoryController.selectedMilkType.value =
                                  value!;
                              currentTotal = calculateTotal();
                            });
                          },
                        ),
                        Text(
                          'Cow',
                          style: TextStyle(fontFamily: FontFamily.gilroyMedium),
                        ),
                        SizedBox(width: 20),
                        Radio<String>(
                          value: 'Buffalo',
                          groupValue:
                              milkManHistoryController.selectedMilkType.value,
                          activeColor: greenColor,
                          onChanged: (value) {
                            setBottomSheetState(() {
                              milkManHistoryController.selectedMilkType.value =
                                  value!;
                              currentTotal = calculateTotal();
                            });
                          },
                        ),
                        Text(
                          'Buffalo',
                          style: TextStyle(fontFamily: FontFamily.gilroyMedium),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Quantities
                    if (milkManHistoryController.selectedMilkType.value ==
                        'Cow')
                      _buildTextField(
                        controller: milkManHistoryController.qtyController,
                        label: "Cow Milk (L)",
                        icon: Icons.water_drop,
                        isNumber: true,
                        onChanged: (value) {
                          setBottomSheetState(() {
                            currentTotal = calculateTotal();
                          });
                        },
                      )
                    else
                      _buildTextField(
                        controller: milkManHistoryController.qtyController,
                        label: "Buffalo Milk (L)",
                        icon: Icons.water_drop_outlined,
                        isNumber: true,
                        onChanged: (value) {
                          setBottomSheetState(() {
                            currentTotal = calculateTotal();
                          });
                        },
                      ),
                    SizedBox(height: 16),

                    // Fat and SNF
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            controller: fatController,
                            label: "Fat (%)",
                            icon: Icons.percent,
                            isNumber: true,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            controller: snfController,
                            label: "SNF (%)",
                            icon: Icons.analytics,
                            isNumber: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Quality Dropdown
                    Text(
                      "Quality",
                      style: TextStyle(
                        fontFamily: FontFamily.gilroyMedium,
                        color: greyColor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: lightgrey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedQuality,
                          isExpanded: true,
                          items: ['Excellent', 'Good', 'Average', 'Poor'].map((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            if (newValue != null) {
                              setBottomSheetState(() {
                                selectedQuality = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 24),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Total Amount:\n ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: FontFamily.gilroyMedium,
                                    color: BlackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "₹ ${currentTotal.toStringAsFixed(1)} ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: FontFamily.gilroyMedium,
                                    color: BlackColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                _submitMilkData(
                                  selectedDate,
                                  milkManHistoryController.qtyController.text,
                                  milkManHistoryController
                                      .selectedMilkType.value,
                                  fatController.text,
                                  snfController.text,
                                  selectedQuality,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff006b8a),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Collect Milk",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: FontFamily.gilroyBold,
                                    color: WhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isNumber = false,
    ValueChanged<String>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontFamily.gilroyMedium,
            color: greyColor,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 6),
        TextField(
          controller: controller,
          onChanged: onChanged,
          //accept only numbers
          inputFormatters: [
            label == "Collect Milk (L)" || label == "Bulk Milk (L)"
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
          ],
          keyboardType: isNumber
              ? TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: greenColor, size: 20),
            hintText: "0.0",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: lightgrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: lightgrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: greenColor, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ],
    );
  }

  void _submitMilkData(
    DateTime date,
    String qty,
    String milkType,
    String fat,
    String snf,
    String quality,
  ) async {
    double ltrs = double.tryParse(qty) ?? 0.0;

    if (ltrs <= 0) {
      Fluttertoast.showToast(msg: "Please enter valid quantity");
      return;
    }
    if (fat.isEmpty || fat == "0") {
      Fluttertoast.showToast(msg: "Please enter valid fat percentage");
      return;
    }
    if (snf.isEmpty || snf == "0") {
      Fluttertoast.showToast(msg: "Please enter valid snf percentage");
      return;
    }

    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    String dayLabel =
        DateFormat('yyyy-MM-dd').format(DateTime.now()) == formattedDate
            ? 'Today'
            : DateFormat('EEEE').format(date);

    String currentTime = DateFormat('hh:mm a').format(DateTime.now());

    var data = AddMilkModel(
      storeId: getData.read("StoreLogin")["id"],
      milkmanId: widget.milkMan.id,
      supplyDate: formattedDate,
      supplyTime: currentTime,
      milkType: milkType.toLowerCase(),
      quantityLitre: ltrs.toStringAsFixed(1),
      fat: fat.isEmpty ? '-' : fat,
      snf: snf.isEmpty ? '-' : snf,
      quality: quality,
    ).toJson();

    //add milk data to daily history
    await addMilkController.addMilk(data);

    // Refresh milk man list data
    await milkManController.milkmanList();

    // Refresh history data to get the newly added entry
    await milkManHistoryController.getMilkManHistory(
      milkmanId: widget.milkMan.id,
    );

    // Update local state with fresh data
    setState(() {
      dailyHistory = milkManHistoryController.history?.data ?? [];
    });

    // Clear form fields
    milkManHistoryController.qtyController.clear();
    milkManHistoryController.selectedMilkType.value = "Cow";

    // Close bottom sheet
    Navigator.pop(context);
  }
}

// Sliver App Bar Delegate for Tabs
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: WhiteColor, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
