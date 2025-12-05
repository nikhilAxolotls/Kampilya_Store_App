// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:storeappnew/utils/Colors.dart';
import 'package:storeappnew/utils/Fontfamily.dart';

class TotalRoutes extends StatefulWidget {
  const TotalRoutes({super.key});

  @override
  State<TotalRoutes> createState() => _TotalRoutesState();
}

class _TotalRoutesState extends State<TotalRoutes> {
  bool isLoading = false;

  /// Mock API Data - Replace with actual API call
  final List<Map<String, dynamic>> allRoutes = [
    {
      'route_name': 'Route 1',
      'route_id': 'RT001',
      'orderDate': '2025-12-02',
      'deliveryTime': '10:00 AM - 12:00 PM',
      'status': 'Active',
      'total': '₹12,450',
      'societies': 3,
      'customers': [
        {
          'name': 'Rajesh Kumar',
          'address': '123, MG Road, Bangalore',
          'phone': '+91 98765 43210',
          'orderTotal': '₹1,250',
          'society': 'Green Valley Society',
          "order_status": 'Pending',
          "order_details": [
            {
              "productsName": "Fresh Milk - 500ml",
              "order_id": "ORD123456",
              "order_date": "2025-12-02",
              "remainingDelivery": "2",
              "totalDelivery": "5",
              "delivery_time": "10:00 AM - 12:00 PM",
              "total": "₹1,250",
            },
          ],
        },
        {
          'name': 'Priya Sharma',
          'address': '45, MG Road, Bangalore',
          'phone': '+91 98765 43211',
          'orderTotal': '₹2,100',
          'society': 'Green Valley Society',
          "order_status": 'Pending',
          "order_details": [
            {
              "order_id": "ORD123457",
              "productsName": "Yogurt - 200g",
              "order_date": "2025-12-02",
              "remainingDelivery": "3",
              "totalDelivery": "5",
              "delivery_time": "10:00 AM - 12:00 PM",
              "total": "₹2,100",
            },
          ],
        },
        {
          'name': 'Amit Patel',
          'address': '78, MG Road, Bangalore',
          'phone': '+91 98765 43212',
          'orderTotal': '₹1,890',
          'society': 'Lake View Apartments',
          "order_status": 'In Progress',
          "order_details": [
            {
              "order_id": "ORD123458",
              "productsName": "Butter - 100g",
              "order_date": "2025-12-02",
              "remainingDelivery": "4",
              "totalDelivery": "5",
              "delivery_time": "10:00 AM - 12:00 PM",
              "total": "₹1,890",
            },
          ],
        },
      ],
    },
    {
      'route_name': 'Route 2',
      'route_id': 'RT002',
      'orderDate': '2025-12-02',
      'deliveryTime': '2:00 PM - 4:00 PM',
      'status': 'Active',
      'total': '₹8,900',
      'societies': 4,
      'customers': [
        {
          'name': 'Anita Desai',
          'address': '45, Indiranagar, Bangalore',
          'phone': '+91 98765 43215',
          'orderTotal': '₹2,100',
          'society': 'Palm Grove',
          "order_status": 'In Progress',
          "order_details": [
            {
              "order_id": "ORD123459",
              "order_date": "2025-12-02",
              "productsName": "Paneer - 250g",
              "remainingDelivery": "1",
              "totalDelivery": "5",
              "delivery_time": "2:00 PM - 4:00 PM",
              "total": "₹2,100",
            },
          ],
        },
        {
          'name': 'Ramesh Nair',
          'address': '67, Indiranagar, Bangalore',
          'phone': '+91 98765 43216',
          'orderTotal': '₹1,800',
          'society': 'Palm Grove',
          "order_status": 'Pending',
          "order_details": [
            {
              "order_id": "ORD123460",
              "order_date": "2025-12-02",
              "productsName": "Cheese Spread - 200g",
              "remainingDelivery": "2",
              "totalDelivery": "5",
              "delivery_time": "2:00 PM - 4:00 PM",
              "total": "₹1,800",
            },
          ],
        },
        {
          'name': 'Kavita Joshi',
          'address': '89, Indiranagar, Bangalore',
          'phone': '+91 98765 43217',
          'orderTotal': '₹2,500',
          'society': 'Royal Gardens',
          "order_status": 'Completed',
          "order_details": [
            {
              "order_id": "ORD123461",
              "order_date": "2025-12-02",
              "productsName": "Ghee - 500ml",
              "remainingDelivery": "0",
              "totalDelivery": "5",
              "delivery_time": "2:00 PM - 4:00 PM",
              "total": "₹2,500",
            },
          ],
        },
        {
          'name': 'Suresh Kumar',
          'address': '23, Indiranagar, Bangalore',
          'phone': '+91 98765 43218',
          'orderTotal': '₹2,500',
          'society': 'Silver Oak',
          "order_status": 'In Progress',
          "order_details": [
            {
              "order_id": "ORD123462",
              "order_date": "2025-12-02",
              "productsName": "Lassi - 200ml",
              "remainingDelivery": "3",
              "totalDelivery": "5",
              "delivery_time": "2:00 PM - 4:00 PM",
              "total": "₹2,500",
            },
          ],
        },
      ],
    },
    {
      'route_name': 'Route 3',
      'route_id': 'RT003',
      'orderDate': '2025-12-01',
      'deliveryTime': '11:00 AM - 1:00 PM',
      'status': 'Completed',
      'total': '₹5,640',
      'societies': 2,
      'customers': [
        {
          'name': 'Deepak Malhotra',
          'address': '78, Koramangala, Bangalore',
          'phone': '+91 98765 43219',
          'orderTotal': '₹890',
          'society': 'Elite Residency',
          "order_status": 'Completed',
          "order_details": [
            {
              "order_id": "ORD123463",
              "productsName": "Buttermilk - 500ml",
              "order_date": "2025-12-01",
              "remainingDelivery": "0",
              "totalDelivery": "5",
              "delivery_time": "11:00 AM - 1:00 PM",
              "total": "₹890",
            },
          ],
        },
        {
          'name': 'Meera Iyer',
          'address': '90, Koramangala, Bangalore',
          'phone': '+91 98765 43220',
          'orderTotal': '₹1,450',
          'society': 'Elite Residency',
          "order_status": 'Completed',
          "order_details": [
            {
              "order_id": "ORD123464",
              "productsName": "Curd - 400g",
              "order_date": "2025-12-01",
              "remainingDelivery": "0",
              "totalDelivery": "5",
              "delivery_time": "11:00 AM - 1:00 PM",
              "total": "₹1,450",
            },
          ],
        },
        {
          'name': 'Arjun Rao',
          'address': '34, Koramangala, Bangalore',
          'phone': '+91 98765 43221',
          'orderTotal': '₹3,300',
          'society': 'Golden Heights',
          "order_status": 'Completed',
          "order_details": [
            {
              "order_id": "ORD123465",
              "productsName": "Cream - 200ml",
              "order_date": "2025-12-01",
              "remainingDelivery": "0",
              "totalDelivery": "5",
              "delivery_time": "11:00 AM - 1:00 PM",
              "total": "₹3,300",
            },
          ],
        },
      ],
    },
  ];

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
          'All Routes',
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
    int activeRoutes = allRoutes.where((r) => r['status'] == 'Active').length;
    int completedRoutes = allRoutes
        .where((r) => r['status'] == 'Completed')
        .length;
    int totalCustomers = 0;
    for (var route in allRoutes) {
      totalCustomers += (route['customers'] as List).length;
    }

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 37, 186, 227),
            Color.fromARGB(255, 10, 140, 176),
            greenColor,
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
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  icon: Icons.check_circle,
                  label: 'Active Routes',
                  value: '$activeRoutes',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.task_alt,
                  label: 'Completed',
                  value: '$completedRoutes',
                ),
              ),
            ],
          ),
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

  Widget _buildRouteCard(Map<String, dynamic> route) {
    Color statusColor = _getStatusColor(route['status']);
    IconData statusIcon = _getStatusIcon(route['status']);

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xff006b8a), width: 0.2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showCustomersBottomSheet(route),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: buttonColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.receipt_long,
                          color: buttonColor,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            route['route_name'],
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: FontFamily.gilroyBold,
                              color: BlackColor,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            route['route_id'],
                            style: TextStyle(
                              fontSize: 12,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(statusIcon, color: statusColor, size: 14),
                        SizedBox(width: 4),
                        Text(
                          route['status'] ?? 'Unknown',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: FontFamily.gilroyBold,
                            color: statusColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 14),
              Divider(color: Color(0xff006b8a), height: 1, thickness: 0.1),
              SizedBox(height: 14),

              /// Date and Time Row
              Row(
                children: [
                  Icon(Icons.calendar_today, color: greyColor, size: 16),
                  SizedBox(width: 6),
                  Text(
                    route['orderDate'],
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: FontFamily.gilroyMedium,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.access_time, color: orangeColor, size: 16),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      route['deliveryTime'],
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: FontFamily.gilroyMedium,
                        color: greyColor,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              /// Customers and Societies Count
              Row(
                children: [
                  Icon(Icons.people, color: blueColor, size: 18),
                  SizedBox(width: 6),
                  Text(
                    "${route['customers'].length} Customers",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: BlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.apartment, color: greenColor, size: 18),
                  SizedBox(width: 6),
                  Text(
                    "${route['societies']} Societies",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: BlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 14),
              Divider(color: Color(0xff006b8a), height: 1, thickness: 0.1),
              SizedBox(height: 14),

              /// Total Amount Row
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
                    route['total'],
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: FontFamily.gilroyBold,
                      color: greenColor,
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

  void _showCustomersBottomSheet(Map<String, dynamic> route) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        List<dynamic> customers = route['customers'] ?? [];
        return DraggableScrollableSheet(
          initialChildSize: 0.75,
          maxChildSize: 0.95,
          builder: (_, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: WhiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    route['route_name'],
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: FontFamily.gilroyBold,
                                      color: BlackColor,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "${customers.length} Customers",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: FontFamily.gilroyMedium,
                                      color: greyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: greenColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: greenColor.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                route['total'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.gilroyBold,
                                  color: greenColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(height: 1, color: lightgrey),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.all(16),
                      itemCount: customers.length,
                      itemBuilder: (_, i) =>
                          _buildCustomerCard(customers[i], i),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCustomerCard(Map<String, dynamic> customer, int index) {
    Color statusColor = _getStatusColor(customer['order_status']);
    IconData statusIcon = _getStatusIcon(customer['order_status']);

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: lightgrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Name + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  customer['name'],
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontFamily.gilroyBold,
                    color: BlackColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: statusColor.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(statusIcon, color: statusColor, size: 14),
                    SizedBox(width: 4),
                    Text(
                      customer['order_status'] ?? 'Unknown',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: FontFamily.gilroyBold,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                customer['society'],
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: FontFamily.gilroyMedium,
                  color: blueColor,
                ),
              ),
              Text(
                customer['orderTotal'],
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: FontFamily.gilroyBold,
                  color: greenColor,
                ),
              ),
            ],
          ),

          Divider(),

          Text(
            'Order Details -',
            style: TextStyle(
              fontSize: 13,
              fontFamily: FontFamily.gilroyBold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderInfo(
                title: "Order ID",
                subtitle: customer['order_details'][0]['order_id'],
              ),
              OrderInfo(title: "Status", subtitle: customer['order_status']),
            ],
          ),
          SizedBox(height: 6),
          OrderInfo(
            title: "Product Name",
            subtitle: customer['order_details'][0]['productsName'],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderInfo(
                title: "Remaining Delivery",
                subtitle: customer['order_details'][0]['remainingDelivery'],
              ),
              OrderInfo(
                title: "Total Delivery",
                subtitle: customer['order_details'][0]['totalDelivery'],
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderInfo(
                title: "Start Date",
                subtitle: customer['order_details'][0]['order_date'],
              ),
            ],
          ),
          SizedBox(height: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Total Amount",
                style: TextStyle(
                  fontFamily: FontFamily.gilroyBold,
                  fontSize: 13,
                  color: greyColor,
                ),
              ),
              Text(
                " : ",
                style: TextStyle(
                  fontFamily: FontFamily.gilroyBold,
                  fontSize: 13,
                  color: greyColor,
                ),
              ),
              SizedBox(width: 6),
              Text(
                customer['order_details'][0]['total'],
                textAlign: TextAlign.right,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: FontFamily.gilroyBold,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          Divider(),
          SizedBox(height: 8),

          /// Address
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on, color: RedColor, size: 18),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  customer['address'],
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontFamily.gilroyMedium,
                    color: greyColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),

          /// Phone
          Row(
            children: [
              Icon(Icons.phone, color: blueColor, size: 18),
              SizedBox(width: 6),
              Text(
                customer['phone'],
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
    );
  }

  Widget OrderInfo({String? title, subtitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 13,
            color: greyColor,
          ),
        ),
        Text(
          " : ",
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 13,
            color: greyColor,
          ),
        ),
        SizedBox(width: 6),
        Text(
          subtitle ?? "",
          textAlign: TextAlign.right,
          maxLines: 2,
          style: TextStyle(
            fontFamily: FontFamily.gilroyBold,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
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
        return greentext;
      case 'In Progress':
        return blueColor;
      case 'Pending':
        return orangeColor;
      case 'Cancelled':
        return RedColor;
      case 'Active':
        return greenColor;
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
