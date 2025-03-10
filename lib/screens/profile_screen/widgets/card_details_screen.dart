// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:hey_follow_up/util/date_helper.dart';
// import '../../../util/color_scheme.dart';
//
// class CardDetailsScreen extends StatelessWidget {
//
//   final PaymentMethod paymentMethod;
//
//   const CardDetailsScreen({super.key, required this.paymentMethod});
//
//   static Future<void> show(BuildContext context, PaymentMethod paymentMethod) async {
//     await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => CardDetailsScreen(paymentMethod: paymentMethod,),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           leading: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             ),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.close,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//           expandedHeight: 300.0,
//           pinned: true,
//           floating: true,
//           flexibleSpace: FlexibleSpaceBar(
//             background: Container(
//               decoration: BoxDecoration(
//                   color: AppColor.kPrimaryColor,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20.0),
//                     bottomRight: Radius.circular(20.0),
//                   )),
//               child: SafeArea(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.check_circle,
//                       color: Colors.white,
//                       size: 100,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Your payment\nwas successful!',
//                       textAlign: TextAlign.center,
//                       style: Theme.of(context).textTheme.displaySmall?.copyWith(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SliverList(
//           delegate: SliverChildListDelegate(
//             [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Payment details", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 20),
//                     _buildDetail("CATEGORY", "Light"),
//                     const SizedBox(height: 16),
//                     _buildDetail(paymentMethod.paymentMethodType, "${paymentMethod.billingDetails.name ?? ''} (${paymentMethod.id})", isLink: true),
//                     const SizedBox(height: 16),
//                     _buildPaymentMethod(paymentMethod),
//                     const SizedBox(height: 16),
//                     _buildDetail("AMOUNT", "\$134"),
//                     const SizedBox(height: 16),
//                     _buildDetail("PAYMENT DATE", DateHelper.formatDate(DateTime.now().toIso8601String())),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     ));
//   }
//
//   Widget _buildDetail(String title, String value, {bool isLink = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
//         const SizedBox(height: 4),
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//             color: isLink ? Colors.blue : Colors.black,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPaymentMethod(PaymentMethod paymentMethod) {
//     final last4 = paymentMethod.card.last4 ?? "****";
//     final brand = paymentMethod.card.brand ?? "Card";
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("PAYMENT METHOD", style: TextStyle(fontSize: 14, color: Colors.grey)),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             // Image.asset(
//             //   _getCardBrandIcon(brand),
//             //   width: 24,
//             //   height: 24,
//             // ),
//             Icon(Icons.credit_card, size: 24,),
//             const SizedBox(width: 8),
//             Text("**** $last4", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//           ],
//         ),
//       ],
//     );
//   }
//
//   String _getCardBrandIcon(String brand) {
//     switch (brand.toLowerCase()) {
//       case "visa":
//         return "assets/visa.png"; // Replace with actual asset path
//       case "mastercard":
//         return "assets/mastercard.png";
//       case "amex":
//         return "assets/amex.png";
//       default:
//         return "assets/card.png";
//     }
//   }
// }
