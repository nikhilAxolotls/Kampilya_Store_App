// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:storeappnew/utils/Colors.dart';
import 'package:storeappnew/utils/Fontfamily.dart';

class MilkManDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> milkMan;

  const MilkManDetailsScreen({super.key, required this.milkMan});

  @override
  State<MilkManDetailsScreen> createState() => _MilkManDetailsScreenState();
}

class _MilkManDetailsScreenState extends State<MilkManDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy daily history data
  final List<Map<String, dynamic>> dailyHistory = [
    {
      'date': '2025-12-04',
      'day': 'Today',
      'morningQuantity': '45 L',
      'eveningQuantity': '38 L',
      'totalQuantity': '83 L',
      'fat': '4.2%',
      'snf': '8.5%',
      'quality': 'Excellent',
      'morningAmount': '₹2,250',
      'eveningAmount': '₹1,900',
      'totalAmount': '₹4,150',
      'status': 'Collected',
      'collectionTime': '06:30 AM / 06:00 PM',
      'paymentStatus': 'Pending',
      'paymentMethod': '-',
      'paymentDate': '-',
    },
    {
      'date': '2025-12-03',
      'day': 'Yesterday',
      'morningQuantity': '42 L',
      'eveningQuantity': '40 L',
      'totalQuantity': '82 L',
      'fat': '4.1%',
      'snf': '8.4%',
      'quality': 'Excellent',
      'morningAmount': '₹2,100',
      'eveningAmount': '₹2,000',
      'totalAmount': '₹4,100',
      'status': 'Collected',
      'collectionTime': '06:25 AM / 06:10 PM',
      'paymentStatus': 'Paid',
      'paymentMethod': 'UPI',
      'paymentDate': '2025-12-03',
    },
    {
      'date': '2025-12-02',
      'day': 'Monday',
      'morningQuantity': '48 L',
      'eveningQuantity': '36 L',
      'totalQuantity': '84 L',
      'fat': '4.3%',
      'snf': '8.6%',
      'quality': 'Excellent',
      'morningAmount': '₹2,400',
      'eveningAmount': '₹1,800',
      'totalAmount': '₹4,200',
      'status': 'Collected',
      'collectionTime': '06:20 AM / 06:15 PM',
      'paymentStatus': 'Paid',
      'paymentMethod': 'Cash',
      'paymentDate': '2025-12-02',
    },
    {
      'date': '2025-12-01',
      'day': 'Sunday',
      'morningQuantity': '40 L',
      'eveningQuantity': '42 L',
      'totalQuantity': '82 L',
      'fat': '4.0%',
      'snf': '8.3%',
      'quality': 'Good',
      'morningAmount': '₹2,000',
      'eveningAmount': '₹2,100',
      'totalAmount': '₹4,100',
      'status': 'Collected',
      'collectionTime': '06:35 AM / 06:05 PM',
      'paymentStatus': 'Partial',
      'paymentMethod': 'Cash',
      'paymentDate': '2025-12-01',
      'paidAmount': '₹2,000',
    },
    {
      'date': '2025-11-30',
      'day': 'Saturday',
      'morningQuantity': '46 L',
      'eveningQuantity': '38 L',
      'totalQuantity': '84 L',
      'fat': '4.2%',
      'snf': '8.5%',
      'quality': 'Excellent',
      'morningAmount': '₹2,300',
      'eveningAmount': '₹1,900',
      'totalAmount': '₹4,200',
      'status': 'Collected',
      'collectionTime': '06:15 AM / 06:20 PM',
      'paymentStatus': 'Paid',
      'paymentMethod': 'Bank Transfer',
      'paymentDate': '2025-11-30',
    },
    {
      'date': '2025-11-29',
      'day': 'Friday',
      'morningQuantity': '44 L',
      'eveningQuantity': '40 L',
      'totalQuantity': '84 L',
      'fat': '4.1%',
      'snf': '8.4%',
      'quality': 'Good',
      'morningAmount': '₹2,200',
      'eveningAmount': '₹2,000',
      'totalAmount': '₹4,200',
      'status': 'Collected',
      'collectionTime': '06:30 AM / 06:10 PM',
      'paymentStatus': 'Paid',
      'paymentMethod': 'UPI',
      'paymentDate': '2025-11-29',
    },
    {
      'date': '2025-11-28',
      'day': 'Thursday',
      'morningQuantity': '0 L',
      'eveningQuantity': '0 L',
      'totalQuantity': '0 L',
      'fat': '-',
      'snf': '-',
      'quality': 'Not Collected',
      'morningAmount': '₹0',
      'eveningAmount': '₹0',
      'totalAmount': '₹0',
      'status': 'Missed',
      'collectionTime': '-',
      'paymentStatus': 'N/A',
      'paymentMethod': '-',
      'paymentDate': '-',
    },
    {
      'date': '2025-11-27',
      'day': 'Wednesday',
      'morningQuantity': '50 L',
      'eveningQuantity': '42 L',
      'totalQuantity': '92 L',
      'fat': '4.4%',
      'snf': '8.7%',
      'quality': 'Excellent',
      'morningAmount': '₹2,500',
      'eveningAmount': '₹2,100',
      'totalAmount': '₹4,600',
      'status': 'Collected',
      'collectionTime': '06:10 AM / 06:25 PM',
      'paymentStatus': 'Paid',
      'paymentMethod': 'Cash',
      'paymentDate': '2025-11-27',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: CustomScrollView(
        // physics: ReverseScrollPhysics(),
        slivers: [
          // App Bar with Profile
          _buildSliverAppBar(),

          // Dashboard Cards
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                _buildDashboardCards(),
                SizedBox(height: 20),
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

          // Tab Content
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [_buildDailyHistoryTab(), _buildInformationTab()],
            ),
          ),
        ],
      ),
    );
  }

  // Sliver App Bar with Profile
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 250,
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
        IconButton(
          icon: Icon(Icons.call, color: WhiteColor),
          onPressed: () {
            // Call functionality
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: WhiteColor),
          onPressed: () {
            // More options
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [greenColor, Color(0xff006b8a)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                // Profile Image
                Container(
                  height: 100,
                  width: 100,
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
                      widget.milkMan['img'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(Icons.person, size: 50, color: greyColor),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Name
                Text(
                  widget.milkMan['name'],
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: FontFamily.gilroyBold,
                    color: WhiteColor,
                  ),
                ),
                SizedBox(height: 6),
                // Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: yelloColor, size: 20),
                    SizedBox(width: 4),
                    Text(
                      '${widget.milkMan['rating']} Rating',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: FontFamily.gilroyBold,
                        color: WhiteColor,
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: widget.milkMan['status'] == 'Active'
                            ? greentext
                            : greyColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        widget.milkMan['status'],
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: FontFamily.gilroyBold,
                          color: WhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Last Delivery
                Text(
                  'Last Delivery: ${widget.milkMan['lastDelivery']}',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: FontFamily.gilroyMedium,
                    color: WhiteColor.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dashboard Cards
  Widget _buildDashboardCards() {
    return Column(
      children: [
        // First Row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildDashboardCard(
                  icon: Icons.water_drop,
                  label: 'Total Supply',
                  value: widget.milkMan['totalMilkSupplied'],
                  color: blueColor,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildDashboardCard(
                  icon: Icons.trending_up,
                  label: 'Daily Average',
                  value: widget.milkMan['monthlyAverage'],
                  color: greenColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        // Second Row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildDashboardCard(
                  icon: Icons.account_balance_wallet,
                  label: 'Total Amount',
                  value: widget.milkMan['totalAmount'],
                  color: buttonColor,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildDashboardCard(
                  icon: Icons.pending_actions,
                  label: 'Pending',
                  value: widget.milkMan['pendingAmount'],
                  color: orangeColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        // Third Row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _buildDashboardCard(
                  icon: Icons.pets,
                  label: 'Cows',
                  value: '${widget.milkMan['cowCount']}',
                  color: Color(0xff8B4513),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildDashboardCard(
                  icon: Icons.pets,
                  label: 'Buffaloes',
                  value: '${widget.milkMan['buffaloCount']}',
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
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontFamily: FontFamily.gilroyBold,
              color: BlackColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontFamily.gilroyMedium,
              color: greyColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Daily History Tab
  Widget _buildDailyHistoryTab() {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
      },
      color: greenColor,
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: dailyHistory.length,
        itemBuilder: (context, index) {
          return _buildHistoryCard(dailyHistory[index]);
        },
      ),
    );
  }

  // History Card
  Widget _buildHistoryCard(Map<String, dynamic> history) {
    final isMissed = history['status'] == 'Missed';
    final statusColor = isMissed
        ? RedColor
        : (history['quality'] == 'Excellent' ? greentext : yelloColor);

    return Container(
      margin: EdgeInsets.only(bottom: 16),
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
        padding: EdgeInsets.all(16),
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
                          history['day'],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontFamily.gilroyBold,
                            color: BlackColor,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          history['date'],
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
                    history['status'],
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
              SizedBox(height: 16),

              // Divider
              Divider(color: lightgrey, height: 1),

              SizedBox(height: 16),

              // Morning and Evening Collection
              Row(
                children: [
                  Expanded(
                    child: _buildCollectionInfo(
                      'Morning',
                      history['morningQuantity'],
                      history['morningAmount'],
                      Icons.wb_sunny,
                      yelloColor,
                    ),
                  ),
                  Container(height: 60, width: 1, color: lightgrey),
                  Expanded(
                    child: _buildCollectionInfo(
                      'Evening',
                      history['eveningQuantity'],
                      history['eveningAmount'],
                      Icons.nightlight_round,
                      buttonColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Quality Metrics
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: bgcolor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildQualityMetric('Fat', history['fat'], blueColor),
                        Container(height: 30, width: 1, color: lightgrey),
                        _buildQualityMetric('SNF', history['snf'], greenColor),
                        Container(height: 30, width: 1, color: lightgrey),
                        _buildQualityMetric(
                          'Quality',
                          history['quality'],
                          statusColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12),

              // Total Row
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      greenColor.withOpacity(0.1),
                      greenColor.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: greenColor.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.water_drop, color: greenColor, size: 20),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Quantity',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: FontFamily.gilroyMedium,
                                color: greyColor,
                              ),
                            ),
                            Text(
                              history['totalQuantity'],
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: FontFamily.gilroyBold,
                                color: greenColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: FontFamily.gilroyMedium,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          history['totalAmount'],
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: FontFamily.gilroyBold,
                            color: greenColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12),

              // Payment Information Card
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _getPaymentStatusColor(
                    history['paymentStatus'],
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _getPaymentStatusColor(
                      history['paymentStatus'],
                    ).withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: _getPaymentStatusColor(
                                  history['paymentStatus'],
                                ).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                _getPaymentIcon(history['paymentStatus']),
                                color: _getPaymentStatusColor(
                                  history['paymentStatus'],
                                ),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Status',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: FontFamily.gilroyMedium,
                                    color: greyColor,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  history['paymentStatus'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: FontFamily.gilroyBold,
                                    color: _getPaymentStatusColor(
                                      history['paymentStatus'],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (history['paymentStatus'] != 'Pending' &&
                            history['paymentStatus'] != 'N/A')
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: blueColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  _getPaymentMethodIcon(
                                    history['paymentMethod'],
                                  ),
                                  color: blueColor,
                                  size: 14,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  history['paymentMethod'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: FontFamily.gilroyBold,
                                    color: blueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    if (history['paymentStatus'] == 'Partial') ...[
                      SizedBox(height: 12),
                      Divider(color: lightgrey, height: 1),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Paid Amount',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: greyColor,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                history['paidAmount'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: FontFamily.gilroyBold,
                                  color: greentext,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Remaining',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: greyColor,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '₹${int.parse(history['totalAmount'].replaceAll(RegExp(r'[^0-9]'), '')) - int.parse(history['paidAmount'].replaceAll(RegExp(r'[^0-9]'), ''))}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: FontFamily.gilroyBold,
                                  color: orangeColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                    if (history['paymentDate'] != '-') ...[
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: greyColor,
                            size: 12,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Paid on ${history['paymentDate']}',
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: FontFamily.gilroyMedium,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              SizedBox(height: 8),

              // Collection Time
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time, color: greyColor, size: 14),
                  SizedBox(width: 4),
                  Text(
                    history['collectionTime'],
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: FontFamily.gilroyMedium,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ] else ...[
              SizedBox(height: 12),
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
    return Column(
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
        SizedBox(height: 4),
        Text(
          quantity,
          style: TextStyle(
            fontSize: 16,
            fontFamily: FontFamily.gilroyBold,
            color: BlackColor,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 13,
            fontFamily: FontFamily.gilroyBold,
            color: color,
          ),
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
            _buildInfoRow(Icons.person, 'Name', widget.milkMan['name']),
            _buildInfoRow(Icons.phone, 'Phone', widget.milkMan['phone']),
            _buildInfoRow(
              Icons.location_on,
              'Address',
              widget.milkMan['address'],
            ),
          ]),
          SizedBox(height: 20),
          _buildSectionTitle('Business Details'),
          SizedBox(height: 12),
          _buildInfoCard([
            _buildInfoRow(
              Icons.calendar_today,
              'Joined Date',
              widget.milkMan['joinedDate'],
            ),
            _buildInfoRow(
              Icons.event,
              'Last Delivery',
              widget.milkMan['lastDelivery'],
            ),
            _buildInfoRow(
              Icons.pets,
              'Total Cattle',
              '${widget.milkMan['cowCount'] + widget.milkMan['buffaloCount']} (${widget.milkMan['cowCount']} Cows, ${widget.milkMan['buffaloCount']} Buffaloes)',
            ),
          ]),
          SizedBox(height: 20),
          _buildSectionTitle('Performance Metrics'),
          SizedBox(height: 12),
          _buildInfoCard([
            _buildInfoRow(
              Icons.water_drop,
              'Total Supply',
              widget.milkMan['totalMilkSupplied'],
            ),
            _buildInfoRow(
              Icons.trending_up,
              'Daily Average',
              widget.milkMan['monthlyAverage'],
            ),
            _buildInfoRow(
              Icons.star,
              'Rating',
              '${widget.milkMan['rating']} / 5.0',
            ),
          ]),
          SizedBox(height: 20),
          _buildSectionTitle('Financial Summary'),
          SizedBox(height: 12),
          _buildInfoCard([
            _buildInfoRow(
              Icons.account_balance_wallet,
              'Total Amount',
              widget.milkMan['totalAmount'],
            ),
            _buildInfoRow(
              Icons.pending_actions,
              'Pending Amount',
              widget.milkMan['pendingAmount'],
            ),
            _buildInfoRow(
              Icons.payment,
              'Paid Amount',
              '₹${int.parse(widget.milkMan['totalAmount'].replaceAll(RegExp(r'[^0-9]'), '')) - int.parse(widget.milkMan['pendingAmount'].replaceAll(RegExp(r'[^0-9]'), ''))}',
            ),
          ]),
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
