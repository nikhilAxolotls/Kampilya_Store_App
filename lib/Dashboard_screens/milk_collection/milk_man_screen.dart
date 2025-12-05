// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:storeappnew/Dashboard_screens/milk_collection/milk_man_details_screen.dart';
import 'package:storeappnew/utils/Colors.dart';
import 'package:storeappnew/utils/Fontfamily.dart';

class MilkManScreen extends StatefulWidget {
  const MilkManScreen({super.key});

  @override
  State<MilkManScreen> createState() => _MilkManScreenState();
}

class _MilkManScreenState extends State<MilkManScreen> {
  // Dummy data for milkmen
  final List<Map<String, dynamic>> milkMen = [
    {
      'id': '1',
      'name': 'Ramesh Kumar',
      'phone': '+91 98765 43210',
      'address': 'Village Gokul, Mathura',
      'img': 'https://randomuser.me/api/portraits/men/32.jpg',
      'totalMilkSupplied': '2,450 L',
      'monthlyAverage': '82 L/day',
      'totalAmount': '₹1,22,500',
      'pendingAmount': '₹8,500',
      'rating': 4.8,
      'status': 'Active',
      'joinedDate': '2023-01-15',
      'lastDelivery': '2025-12-04',
      'cowCount': 8,
      'buffaloCount': 5,
    },
    {
      'id': '2',
      'name': 'Suresh Yadav',
      'phone': '+91 98765 43211',
      'address': 'Village Vrindavan, Mathura',
      'img': 'https://randomuser.me/api/portraits/men/45.jpg',
      'totalMilkSupplied': '3,200 L',
      'monthlyAverage': '106 L/day',
      'totalAmount': '₹1,60,000',
      'pendingAmount': '₹12,000',
      'rating': 4.9,
      'status': 'Active',
      'joinedDate': '2022-11-20',
      'lastDelivery': '2025-12-04',
      'cowCount': 12,
      'buffaloCount': 8,
    },
    {
      'id': '3',
      'name': 'Mahesh Patel',
      'phone': '+91 98765 43212',
      'address': 'Village Barsana, Mathura',
      'img': 'https://randomuser.me/api/portraits/men/62.jpg',
      'totalMilkSupplied': '1,800 L',
      'monthlyAverage': '60 L/day',
      'totalAmount': '₹90,000',
      'pendingAmount': '₹5,500',
      'rating': 4.6,
      'status': 'Active',
      'joinedDate': '2023-03-10',
      'lastDelivery': '2025-12-04',
      'cowCount': 6,
      'buffaloCount': 4,
    },
    {
      'id': '4',
      'name': 'Rajendra Singh',
      'phone': '+91 98765 43213',
      'address': 'Village Nandgaon, Mathura',
      'img': 'https://randomuser.me/api/portraits/men/22.jpg',
      'totalMilkSupplied': '2,900 L',
      'monthlyAverage': '96 L/day',
      'totalAmount': '₹1,45,000',
      'pendingAmount': '₹0',
      'rating': 5.0,
      'status': 'Active',
      'joinedDate': '2022-08-05',
      'lastDelivery': '2025-12-04',
      'cowCount': 10,
      'buffaloCount': 6,
    },
    {
      'id': '5',
      'name': 'Dinesh Sharma',
      'phone': '+91 98765 43214',
      'address': 'Village Govardhan, Mathura',
      'img': 'https://randomuser.me/api/portraits/men/54.jpg',
      'totalMilkSupplied': '1,500 L',
      'monthlyAverage': '50 L/day',
      'totalAmount': '₹75,000',
      'pendingAmount': '₹3,000',
      'rating': 4.5,
      'status': 'Inactive',
      'joinedDate': '2023-05-22',
      'lastDelivery': '2025-11-30',
      'cowCount': 5,
      'buffaloCount': 3,
    },
    {
      'id': '6',
      'name': 'Prakash Verma',
      'phone': '+91 98765 43215',
      'address': 'Village Radha Kund, Mathura',
      'img': 'https://randomuser.me/api/portraits/men/71.jpg',
      'totalMilkSupplied': '2,100 L',
      'monthlyAverage': '70 L/day',
      'totalAmount': '₹1,05,000',
      'pendingAmount': '₹7,000',
      'rating': 4.7,
      'status': 'Active',
      'joinedDate': '2023-02-14',
      'lastDelivery': '2025-12-04',
      'cowCount': 7,
      'buffaloCount': 5,
    },
  ];

  String selectedFilter = 'All';
  String searchQuery = '';

  List<Map<String, dynamic>> getFilteredMilkMen() {
    List<Map<String, dynamic>> filtered = milkMen;

    // Apply status filter
    if (selectedFilter != 'All') {
      filtered = filtered.where((m) => m['status'] == selectedFilter).toList();
    }

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((m) {
        return m['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
            m['phone'].contains(searchQuery) ||
            m['address'].toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final filteredMilkMen = getFilteredMilkMen();
    final activeMilkMen = milkMen.where((m) => m['status'] == 'Active').length;
    final totalMilkToday = milkMen.where((m) => m['status'] == 'Active').fold(
      0,
      (sum, m) {
        final avg = m['monthlyAverage'].toString().split(' ')[0];
        return sum + int.parse(avg);
      },
    );

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
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Statistics Header
              _buildStatisticsHeader(activeMilkMen, totalMilkToday),

              SizedBox(height: 6),

              // Search Bar
              _buildSearchBar(),

              SizedBox(height: 10),

              // Filter Chips
              _buildFilterChips(),

              SizedBox(height: 20),

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

              SizedBox(height: 12),

              // Milkmen List
              filteredMilkMen.isEmpty
                  ? _buildEmptyState()
                  : _buildMilkMenList(filteredMilkMen),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Statistics Header with gradient cards
  Widget _buildStatisticsHeader(int activeMilkMen, int totalMilkToday) {
    return Container(
      height: 180,
      margin: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
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
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: WhiteColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.people, color: WhiteColor, size: 24),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '$activeMilkMen',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: FontFamily.gilroyBold,
                      color: WhiteColor,
                    ),
                  ),
                  SizedBox(height: 4),
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
          SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
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
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: WhiteColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.water_drop, color: WhiteColor, size: 24),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '$totalMilkToday L',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: FontFamily.gilroyBold,
                      color: WhiteColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Today\'s Collection',
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
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
        child: TextField(
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
              fontSize: 14,
            ),
            prefixIcon: Icon(Icons.search, color: greyColor),
            suffixIcon: searchQuery.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: greyColor),
                    onPressed: () {
                      setState(() {
                        searchQuery = '';
                      });
                    },
                  )
                : null,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
  Widget _buildMilkMenList(List<Map<String, dynamic>> filteredMilkMen) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: filteredMilkMen.length,
      itemBuilder: (context, index) {
        return _buildMilkManCard(filteredMilkMen[index]);
      },
    );
  }

  // Individual Milkman Card
  Widget _buildMilkManCard(Map<String, dynamic> milkMan) {
    final isActive = milkMan['status'] == 'Active';
    final hasPending = milkMan['pendingAmount'] != '₹0';

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(20),
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MilkManDetailsScreen(milkMan: milkMan),
              ),
            );
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.all(16),
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
                          milkMan['img'],
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
                                  milkMan['name'],
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
                                  milkMan['status'],
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
                                milkMan['phone'],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: FontFamily.gilroyMedium,
                                  color: greyColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star, color: yelloColor, size: 14),
                              SizedBox(width: 4),
                              Text(
                                '${milkMan['rating']} Rating',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: FontFamily.gilroyBold,
                                  color: yelloColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 14),

                // Location
                Row(
                  children: [
                    Icon(Icons.location_on, color: RedColor, size: 16),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        milkMan['address'],
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

                SizedBox(height: 14),

                // Divider
                Divider(color: lightgrey, height: 1),

                SizedBox(height: 14),

                // Statistics Row
                Row(
                  children: [
                    Expanded(
                      child: _buildStatItem(
                        icon: Icons.water_drop,
                        label: 'Monthly Avg',
                        value: milkMan['monthlyAverage'],
                        color: blueColor,
                      ),
                    ),
                    Container(height: 40, width: 1, color: lightgrey),
                    Expanded(
                      child: _buildStatItem(
                        icon: Icons.calendar_today,
                        label: 'Total Supply',
                        value: milkMan['totalMilkSupplied'],
                        color: greenColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                // Footer Row with amount
                Container(
                  padding: EdgeInsets.all(12),
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
                            milkMan['totalAmount'],
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
                            vertical: 8,
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
                                    milkMan['pendingAmount'],
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
      children: [
        Icon(icon, color: color, size: 20),
        SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontFamily: FontFamily.gilroyBold,
            color: BlackColor,
          ),
        ),
        SizedBox(height: 2),
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
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(color: bgcolor, shape: BoxShape.circle),
            child: Icon(Icons.search_off, size: 80, color: greyColor),
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
    );
  }
}
