import 'package:flutter/material.dart';

class CustomTableProduct extends StatelessWidget {
  final String name;
  final int quantity;
  final double price;

  const CustomTableProduct({
    super.key,
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    // هنا تم إعادة ال Widget نفسه وليس TableRow
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Text(name),
          ),
          Expanded(
            child: Text(
              'x$quantity',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}



// TableRow _buildProductTableRow(String name, int quantity, double price) {
//   return TableRow(
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Text(name),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Text('x$quantity', style: const TextStyle(color: Colors.grey)),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Text(
//           '\$${price.toStringAsFixed(2)}',
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     ],
//   );
// }
