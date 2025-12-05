// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:storeappnew/Modal_class/Rider_model.dart';
// import 'package:storeappnew/api_screens/confrigation.dart';
// import 'package:storeappnew/utils/Colors.dart';
// import 'package:storeappnew/utils/Fontfamily.dart';

// class RiderDetailsScreen extends StatefulWidget {
//   final Riderdatum info;

//   const RiderDetailsScreen({super.key, required this.info});

//   @override
//   State<RiderDetailsScreen> createState() => _RiderDetailsScreenState();
// }

// class _RiderDetailsScreenState extends State<RiderDetailsScreen> {
//   bool isLoading = false;

//   // Mock data for demonstration - Replace with actual API call
//   final List<Map<String, dynamic>> assignedRoutes = [
//     {
//       'route_name': 'Route 1',
//       'orderDate': '2025-12-02',
//       'deliveryTime': '10:00 AM - 12:00 PM',
//       'status': 'Pending',
//       'total': '₹12,450',
//       'societies': 3,
//       'customers': [
//         {
//           'name': 'Rajesh Kumar',
//           'address': '123, MG Road, Bangalore',
//           'phone': '+91 98765 43210',
//           'orderTotal': '₹1,250',
//           'society': 'Green Valley Society',
//         },
//         {
//           'name': 'Priya Sharma',
//           'address': '45, MG Road, Bangalore',
//           'phone': '+91 98765 43211',
//           'orderTotal': '₹2,100',
//           'society': 'Green Valley Society',
//         },
//         {
//           'name': 'Amit Patel',
//           'address': '78, MG Road, Bangalore',
//           'phone': '+91 98765 43212',
//           'orderTotal': '₹1,890',
//           'society': 'Lake View Apartments',
//         },
//         {
//           'name': 'Sneha Reddy',
//           'address': '12, MG Road, Bangalore',
//           'phone': '+91 98765 43213',
//           'orderTotal': '₹3,450',
//           'society': 'Lake View Apartments',
//         },
//         {
//           'name': 'Vikram Singh',
//           'address': '56, MG Road, Bangalore',
//           'phone': '+91 98765 43214',
//           'orderTotal': '₹3,760',
//           'society': 'Sunrise Heights',
//         },
//       ],
//     },
//     {
//       'route_name': 'Route 2',
//       'orderDate': '2025-12-02',
//       'deliveryTime': '2:00 PM - 4:00 PM',
//       'status': 'In Progress',
//       'total': '₹8,900',
//       'societies': 4,
//       'customers': [
//         {
//           'name': 'Anita Desai',
//           'address': '45, Indiranagar, Bangalore',
//           'phone': '+91 98765 43215',
//           'orderTotal': '₹2,100',
//           'society': 'Palm Grove',
//         },
//         {
//           'name': 'Ramesh Nair',
//           'address': '67, Indiranagar, Bangalore',
//           'phone': '+91 98765 43216',
//           'orderTotal': '₹1,800',
//           'society': 'Palm Grove',
//         },
//         {
//           'name': 'Kavita Joshi',
//           'address': '89, Indiranagar, Bangalore',
//           'phone': '+91 98765 43217',
//           'orderTotal': '₹2,500',
//           'society': 'Royal Gardens',
//         },
//         {
//           'name': 'Suresh Kumar',
//           'address': '23, Indiranagar, Bangalore',
//           'phone': '+91 98765 43218',
//           'orderTotal': '₹2,500',
//           'society': 'Silver Oak',
//         },
//       ],
//     },
//     {
//       'route_name': 'Route 3',
//       'orderDate': '2025-12-01',
//       'deliveryTime': '11:00 AM - 1:00 PM',
//       'status': 'Completed',
//       'total': '₹5,640',
//       'societies': 2,
//       'customers': [
//         {
//           'name': 'Deepak Malhotra',
//           'address': '78, Koramangala, Bangalore',
//           'phone': '+91 98765 43219',
//           'orderTotal': '₹890',
//           'society': 'Elite Residency',
//         },
//         {
//           'name': 'Meera Iyer',
//           'address': '90, Koramangala, Bangalore',
//           'phone': '+91 98765 43220',
//           'orderTotal': '₹1,450',
//           'society': 'Elite Residency',
//         },
//         {
//           'name': 'Arjun Rao',
//           'address': '34, Koramangala, Bangalore',
//           'phone': '+91 98765 43221',
//           'orderTotal': '₹3,300',
//           'society': 'Golden Heights',
//         },
//       ],
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgcolor,
//       appBar: AppBar(
//         backgroundColor: WhiteColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: BlackColor),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: true,
//         title: Text(
//           'Rider Routes',
//           style: TextStyle(
//             color: BlackColor,
//             fontFamily: FontFamily.gilroyBold,
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           // Add API call to refresh routes
//           await Future.delayed(Duration(seconds: 1));
//         },
//         color: greenColor,
//         child: SingleChildScrollView(
//           physics: AlwaysScrollableScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Rider Profile Header Card
//               _buildRiderProfileHeader(),

//               SizedBox(height: 16),

//               // Statistics Cards
//               _buildStatisticsSection(),

//               SizedBox(height: 20),

//               // Routes Section Header
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Assigned Routes',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontFamily: FontFamily.gilroyBold,
//                         color: BlackColor,
//                       ),
//                     ),
//                     Text(
//                       '${assignedRoutes.length} routes',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontFamily: FontFamily.gilroyMedium,
//                         color: greyColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 12),

//               // Routes List
//               assignedRoutes.isEmpty ? _buildEmptyState() : _buildRoutesList(),

//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Rider Profile Header with gradient background
//   Widget _buildRiderProfileHeader() {
//     return Container(
//       margin: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [greenColor, Color(0xff006b8a)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: greenColor.withOpacity(0.3),
//             blurRadius: 15,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(20),
//         child: Row(
//           children: [
//             // Rider Image
//             Container(
//               height: 80,
//               width: 80,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: WhiteColor, width: 3),
//                 boxShadow: [
//                   BoxShadow(
//                     color: BlackColor.withOpacity(0.2),
//                     blurRadius: 10,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: ClipOval(
//                 child: Image.network(
//                   "${AppUrl.imageurl}${widget.info.img}",
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       color: Colors.grey[300],
//                       child: Icon(Icons.person, size: 40, color: greyColor),
//                     );
//                   },
//                 ),
//               ),
//             ),

//             SizedBox(width: 16),

//             // Rider Details
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.info.title,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontFamily: FontFamily.gilroyBold,
//                       color: WhiteColor,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 6),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.phone,
//                         color: WhiteColor.withOpacity(0.9),
//                         size: 16,
//                       ),
//                       SizedBox(width: 6),
//                       Text(
//                         "${widget.info.ccode} ${widget.info.mobile}",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontFamily: FontFamily.gilroyMedium,
//                           color: WhiteColor.withOpacity(0.9),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 4),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.email,
//                         color: WhiteColor.withOpacity(0.9),
//                         size: 16,
//                       ),
//                       SizedBox(width: 6),
//                       Expanded(
//                         child: Text(
//                           widget.info.email,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontFamily: FontFamily.gilroyMedium,
//                             color: WhiteColor.withOpacity(0.9),
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Statistics Section
//   Widget _buildStatisticsSection() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: [
//           Expanded(
//             child: _buildStatCard(
//               icon: Icons.route,
//               label: 'Total Routes',
//               value: '${assignedRoutes.length}',
//               color: buttonColor,
//             ),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: _buildStatCard(
//               icon: Icons.check_circle,
//               label: 'Completed',
//               value:
//                   '${assignedRoutes.where((r) => r['status'] == 'Completed').length}',
//               color: greentext,
//             ),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: _buildStatCard(
//               icon: Icons.pending_actions,
//               label: 'Pending',
//               value:
//                   '${assignedRoutes.where((r) => r['status'] == 'Pending').length}',
//               color: orangeColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Individual Stat Card
//   Widget _buildStatCard({
//     required IconData icon,
//     required String label,
//     required String value,
//     required Color color,
//   }) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: WhiteColor,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, color: color, size: 24),
//           ),
//           SizedBox(height: 10),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 22,
//               fontFamily: FontFamily.gilroyBold,
//               color: BlackColor,
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 12,
//               fontFamily: FontFamily.gilroyMedium,
//               color: greyColor,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   // Routes List
//   Widget _buildRoutesList() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       itemCount: assignedRoutes.length,
//       itemBuilder: (context, index) {
//         return _buildRouteCard(assignedRoutes[index]);
//       },
//     );
//   }

//   // Individual Route Card
//   Widget _buildRouteCard(Map<String, dynamic> route) {
//     Color statusColor = _getStatusColor(route['status']);
//     IconData statusIcon = _getStatusIcon(route['status']);

//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: WhiteColor,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 12,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () {
//             _showCustomersBottomSheet(route);
//           },
//           borderRadius: BorderRadius.circular(16),
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header Row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Order ID
//                     Row(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: buttonColor.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Icon(
//                             Icons.receipt_long,
//                             color: buttonColor,
//                             size: 20,
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               route['route_name'] ?? 'N/A',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: FontFamily.gilroyBold,
//                                 color: BlackColor,
//                               ),
//                             ),
//                             Text(
//                               route['orderDate'] ?? '',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontFamily: FontFamily.gilroyMedium,
//                                 color: greyColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     // Status Badge
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         color: statusColor.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: statusColor.withOpacity(0.3)),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(statusIcon, color: statusColor, size: 14),
//                           SizedBox(width: 4),
//                           Text(
//                             route['status'] ?? 'Unknown',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontFamily: FontFamily.gilroyBold,
//                               color: statusColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 14),

//                 // Divider
//                 Divider(color: lightgrey, height: 1),

//                 SizedBox(height: 14),

//                 // Customer Details
//                 Row(
//                   children: [
//                     Icon(Icons.person, color: greyColor, size: 18),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         route['customerName'],
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontFamily: FontFamily.gilroyBold,
//                           color: BlackColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 10),

//                 // Address
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(Icons.location_on, color: RedColor, size: 18),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         route['customerAddress'],
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontFamily: FontFamily.gilroyMedium,
//                           color: greyColor,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 10),

//                 // Delivery Time
//                 Row(
//                   children: [
//                     Icon(Icons.access_time, color: orangeColor, size: 18),
//                     SizedBox(width: 8),
//                     Text(
//                       route['deliveryTime'] ?? 'N/A',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontFamily: FontFamily.gilroyMedium,
//                         color: greyColor,
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 14),

//                 // Footer Row
//                 Container(
//                   padding: EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: bgcolor,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(Icons.apartment, color: greenColor, size: 18),
//                           SizedBox(width: 6),
//                           Text(
//                             '${route['societies'] ?? 0} societies',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontFamily: FontFamily.gilroyMedium,
//                               color: greyColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         route['total'] ?? '₹0',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontFamily: FontFamily.gilroyBold,
//                           color: greenColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Empty State
//   Widget _buildEmptyState() {
//     return Container(
//       padding: EdgeInsets.all(40),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(30),
//             decoration: BoxDecoration(color: bgcolor, shape: BoxShape.circle),
//             child: Icon(Icons.route_outlined, size: 80, color: greyColor),
//           ),
//           SizedBox(height: 24),
//           Text(
//             'No Routes Assigned',
//             style: TextStyle(
//               fontSize: 20,
//               fontFamily: FontFamily.gilroyBold,
//               color: BlackColor,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'This rider has no assigned routes yet.\nRoutes will appear here once assigned.',
//             style: TextStyle(
//               fontSize: 14,
//               fontFamily: FontFamily.gilroyMedium,
//               color: greyColor,
//               height: 1.5,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   // Get Status Color
//   Color _getStatusColor(String? status) {
//     switch (status) {
//       case 'Completed':
//         return greentext;
//       case 'In Progress':
//         return blueColor;
//       case 'Pending':
//         return orangeColor;
//       case 'Cancelled':
//         return RedColor;
//       default:
//         return greyColor;
//     }
//   }

//   // Get Status Icon
//   IconData _getStatusIcon(String? status) {
//     switch (status) {
//       case 'Completed':
//         return Icons.check_circle;
//       case 'In Progress':
//         return Icons.local_shipping;
//       case 'Pending':
//         return Icons.pending;
//       case 'Cancelled':
//         return Icons.cancel;
//       default:
//         return Icons.info;
//     }
//   }

//   // Show Customers Bottom Sheet
//   void _showCustomersBottomSheet(Map<String, dynamic> route) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return DraggableScrollableSheet(
//           initialChildSize: 0.7,
//           minChildSize: 0.5,
//           maxChildSize: 0.95,
//           builder: (context, scrollController) {
//             List<dynamic> customers = route['customers'] ?? [];

//             return Container(
//               decoration: BoxDecoration(
//                 color: WhiteColor,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(24),
//                   topRight: Radius.circular(24),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   // Handle bar
//                   Container(
//                     margin: EdgeInsets.only(top: 12, bottom: 8),
//                     width: 40,
//                     height: 4,
//                     decoration: BoxDecoration(
//                       color: greyColor.withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),

//                   // Header
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               route['route_name'] ?? 'Route',
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontFamily: FontFamily.gilroyBold,
//                                 color: BlackColor,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               '${customers.length} Customers',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: FontFamily.gilroyMedium,
//                                 color: greyColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 6,
//                           ),
//                           decoration: BoxDecoration(
//                             color: greenColor.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(
//                               color: greenColor.withOpacity(0.3),
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(
//                                 Icons.apartment,
//                                 color: greenColor,
//                                 size: 16,
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 '${route['societies'] ?? 0} societies',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontFamily: FontFamily.gilroyBold,
//                                   color: greenColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   Divider(height: 1, color: lightgrey),

//                   // Customers List
//                   Expanded(
//                     child: customers.isEmpty
//                         ? Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.people_outline,
//                                   size: 60,
//                                   color: greyColor,
//                                 ),
//                                 SizedBox(height: 16),
//                                 Text(
//                                   'No customers found',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontFamily: FontFamily.gilroyMedium,
//                                     color: greyColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : ListView.builder(
//                             controller: scrollController,
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 8,
//                             ),
//                             itemCount: customers.length,
//                             itemBuilder: (context, index) {
//                               final customer = customers[index];
//                               return _buildCustomerCard(customer, index);
//                             },
//                           ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   // Customer Card Widget
//   Widget _buildCustomerCard(Map<String, dynamic> customer, int index) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 12),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: WhiteColor,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: lightgrey),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.03),
//             blurRadius: 8,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Customer Header
//           Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: buttonColor.withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   '${index + 1}',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: FontFamily.gilroyBold,
//                     color: buttonColor,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       customer['name'] ?? '',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontFamily: FontFamily.gilroyBold,
//                         color: BlackColor,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Icon(Icons.apartment, color: greenColor, size: 14),
//                         SizedBox(width: 4),
//                         Expanded(
//                           child: Text(
//                             customer['society'] ?? '',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontFamily: FontFamily.gilroyMedium,
//                               color: greenColor,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Text(
//                 customer['orderTotal'] ?? '',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: FontFamily.gilroyBold,
//                   color: greenColor,
//                 ),
//               ),
//             ],
//           ),

//           SizedBox(height: 12),
//           Divider(height: 1, color: lightgrey),
//           SizedBox(height: 12),

//           // Address
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Icon(Icons.location_on, color: RedColor, size: 18),
//               SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   customer['address'] ?? '',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontFamily: FontFamily.gilroyMedium,
//                     color: greyColor,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),

//           SizedBox(height: 8),

//           // Phone
//           Row(
//             children: [
//               Icon(Icons.phone, color: blueColor, size: 18),
//               SizedBox(width: 8),
//               Text(
//                 customer['phone'] ?? '',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontFamily: FontFamily.gilroyMedium,
//                   color: greyColor,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:storeappnew/Modal_class/Rider_model.dart';
import 'package:storeappnew/api_screens/confrigation.dart';
import 'package:storeappnew/utils/Colors.dart';
import 'package:storeappnew/utils/Fontfamily.dart';

class RiderDetailsScreen extends StatefulWidget {
  final Riderdatum info;

  const RiderDetailsScreen({super.key, required this.info});

  @override
  State<RiderDetailsScreen> createState() => _RiderDetailsScreenState();
}

class _RiderDetailsScreenState extends State<RiderDetailsScreen> {
  bool isLoading = false;

  /// Mock API Data
  final List<Map<String, dynamic>> assignedRoutes = [
    {
      'route_name': 'Route 1',
      'orderDate': '2025-12-02',
      'deliveryTime': '10:00 AM - 12:00 PM',

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
              "productsName": "Product 1",
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
              "order_id": "ORD123456",
              "productsName": "Product 1",
              "order_date": "2025-12-02",
              "remainingDelivery": "2",
              "totalDelivery": "5",
              "delivery_time": "10:00 AM - 12:00 PM",
              "total": "₹1,250",
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
              "order_id": "ORD123456",
              "productsName": "Product 1",
              "order_date": "2025-12-02",
              "remainingDelivery": "2",
              "totalDelivery": "5",
              "delivery_time": "10:00 AM - 12:00 PM",
              "total": "₹1,250",
            },
          ],
        },
      ],
    },
    {
      'route_name': 'Route 2',
      'orderDate': '2025-12-02',
      'deliveryTime': '2:00 PM - 4:00 PM',

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
              "order_id": "ORD123456",
              "order_date": "2025-12-02",
              "productsName": "Product 1",
              "remainingDelivery": "2",
              "totalDelivery": "5",
              "delivery_time": "10:00 AM - 12:00 PM",
              "total": "₹1,250",
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
              "order_id": "ORD123456",
              "order_date": "2025-12-02",
              "productsName": "Product 1",
              "remainingDelivery": "2",
              "totalDelivery": "5",
              "delivery_time": "10:00 AM - 12:00 PM",
              "total": "₹1,250",
            },
          ],
        },
        {
          'name': 'Ramesh',
          'address': '67, Indiranagar, Bangalore',
          'phone': '+91 98765 43216',
          'orderTotal': '₹1,800',
          'society': 'Palm Grove',
          "order_status": 'In Progress',
          "order_details": [
            {
              "order_id": "ORD123456",
              "productsName": "Product 1",
              "order_date": "2025-12-02",
              "remainingDelivery": "2",
              "totalDelivery": "5",
              "delivery_time": "10:00 AM - 12:00 PM",
              "total": "₹1,250",
            },
          ],
        },
      ],
    },
    {
      'route_name': 'Route 3',
      'orderDate': '2025-12-02',
      'deliveryTime': '10:00 AM - 12:00 PM',

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
              "productsName": "Product 1",
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
              "order_id": "ORD123456",
              "productsName": "Product 1",
              "order_date": "2025-12-02",
              "remainingDelivery": "2",
              "totalDelivery": "5",
              "delivery_time": "10:00 AM - 12:00 PM",
              "total": "₹1,250",
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
              "order_id": "ORD123456",
              "productsName": "Product 1",
              "order_date": "2025-12-02",
              "remainingDelivery": "2",
              "totalDelivery": "5",
              "delivery_time": "10:00 AM - 12:00 PM",
              "total": "₹1,250",
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
          'Rider Routes',
          style: TextStyle(
            color: BlackColor,
            fontFamily: FontFamily.gilroyBold,
            fontSize: 18,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => await Future.delayed(Duration(seconds: 1)),
        color: greenColor,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRiderProfileHeader(),
              SizedBox(height: 16),
              _buildStatisticsSection(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Assigned Routes',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: FontFamily.gilroyBold,
                        color: BlackColor,
                      ),
                    ),
                    Text(
                      '${assignedRoutes.length} routes',
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
              assignedRoutes.isEmpty ? _buildEmptyState() : _buildRoutesList(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRiderProfileHeader() {
    return Container(
      margin: EdgeInsets.all(16),
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
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: WhiteColor,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: ClipOval(
                child: Image.network(
                  "${AppUrl.imageurl}${widget.info.img}",
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                  errorBuilder: (c, e, s) =>
                      Icon(Icons.person, size: 60, color: WhiteColor),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.info.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: FontFamily.gilroyBold,
                      color: WhiteColor,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "${widget.info.ccode} ${widget.info.mobile}",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: WhiteColor,
                    ),
                  ),
                  Text(
                    widget.info.email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: WhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    int totalRoutes = assignedRoutes.length;
    int completedOrders = 0;
    int pendingOrders = 0;
    int inProgressOrders = 0;
    for (var element in assignedRoutes) {
      for (var customer in element['customers']) {
        if (customer['order_status'] == 'Pending') {
          pendingOrders++;
        } else if (customer['order_status'] == 'In Progress') {
          inProgressOrders++;
        } else if (customer['order_status'] == 'Completed') {
          completedOrders++;
        }
      }
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              icon: Icons.route,
              label: 'Total Routes',
              value: '${assignedRoutes.length}',
              color: buttonColor,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              icon: Icons.check_circle,
              label: 'In Progress Orders',
              value: inProgressOrders.toString(),
              color: greentext,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              icon: Icons.pending_actions,
              label: 'Pending Orders',

              value: pendingOrders.toString(),
              color: orangeColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color.fromARGB(255, 0, 106, 135), width: 0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 26),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontFamily: FontFamily.gilroyBold,
              color: BlackColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontFamily.gilroyMedium,
              color: greyColor,
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
      itemCount: assignedRoutes.length,
      itemBuilder: (context, i) => _buildRouteCard(assignedRoutes[i]),
    );
  }

  Widget _buildRouteCard(Map<String, dynamic> route) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xff006b8a), width: 0.2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showCustomersBottomSheet(route),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    route['route_name'],
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: FontFamily.gilroyBold,
                      color: BlackColor,
                    ),
                  ),
                  // Status Badge
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  //   decoration: BoxDecoration(
                  //     color: statusColor.withOpacity(0.1),
                  //     borderRadius: BorderRadius.circular(20),
                  //     border: Border.all(color: statusColor.withOpacity(0.3)),
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Icon(statusIcon, color: statusColor, size: 14),
                  //       SizedBox(width: 4),
                  //       Text(
                  //         route['status'] ?? 'Unknown',
                  //         style: TextStyle(
                  //           fontSize: 12,
                  //           fontFamily: FontFamily.gilroyBold,
                  //           color: statusColor,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 8),
              Divider(color: Color(0xff006b8a), height: 1, thickness: 0.1),
              SizedBox(height: 8),

              /// Customers Count
              Row(
                children: [
                  Icon(Icons.people, color: greyColor, size: 25),
                  SizedBox(width: 8),
                  Text(
                    "${route['customers'].length} Customers",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: BlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),

              /// Societies Count
              Row(
                children: [
                  Icon(Icons.apartment, color: greenColor, size: 25),
                  SizedBox(width: 8),
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

              SizedBox(height: 12),
              Divider(color: Color(0xff006b8a), height: 1, thickness: 0.1),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    route['deliveryTime'],
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.gilroyMedium,
                      color: greyColor,
                    ),
                  ),
                  Text(
                    route['total'],
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
                  SizedBox(height: 10),
                  Text(
                    route['route_name'],
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: FontFamily.gilroyBold,
                      color: BlackColor,
                    ),
                  ),
                  Text(
                    "${customers.length} Customers",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: FontFamily.gilroyMedium,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(height: 10),
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
          /// Name + Society
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

  OrderInfo({String? title, subtitle}) {
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
        child: Text(
          "No Routes Assigned",
          style: TextStyle(
            fontSize: 18,
            fontFamily: FontFamily.gilroyBold,
            color: greyColor,
          ),
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
      default:
        return Icons.info;
    }
  }
}
