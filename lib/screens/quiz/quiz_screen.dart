// import 'package:flutter/material.dart';

// // Option tile widget
// class OptionTile extends StatelessWidget {
  

//   const OptionTile({
//     required this.label,
//     required this.isSelected,
//     required this.onSelect,
//     super.key,
//   });

//   final String label;
//   final bool isSelected;
//   final VoidCallback onSelect;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ListTile(
//         contentPadding: EdgeInsets.symmetric(horizontal: 16),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//           side: BorderSide(color: isSelected ? Colors.teal : Colors.grey[300]!),
//         ),
//         tileColor: isSelected ? Colors.teal.withOpacity(0.2) : Colors.white,
//         title: Text(
//           label,
//           style: TextStyle(fontSize: 16),
//         ),
//         leading: Radio(
//           value: label,
//           groupValue: isSelected ? label : null,
//           onChanged: (value) {
//             // Handle selection change
//           },
//           activeColor: Colors.teal,
//         ),
//         onTap: () {
//           // Handle option tap
//         },
//       ),
//     );
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(StringProperty('label', label));
//     properties.add(DiagnosticsProperty<bool>('isSelected', isSelected));
//     properties.add(ObjectFlagProperty<VoidCallback>.has('onSelect', onSelect));
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: QuizScreen(),
//   ),);
// }
