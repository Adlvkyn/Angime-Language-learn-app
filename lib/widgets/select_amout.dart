// import 'package:flutter/material.dart';
// import 'package:mobile_nsk/main.dart';
// import 'package:mobile_nsk/models/policy/insurance_amount.dart';
// import 'package:mobile_nsk/pages/widgets/dropdown.dart';
//
// class AmountDropDown extends StatelessWidget {
//   final InsuranceAmount selectedValue;
//   const AmountDropDown({Key? key, required this.selectedValue}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  DropdownMenu(
//       hintText: "Выберите сумму страхования",
//       onChanged: (values) {
//         box.write("amount_id", values.id);
//         values = selectedValue;
//       },
//       value: selectedValue,
//       items: amountsList
//           .map<DropdownMenuItem<InsuranceAmount>>(
//               (InsuranceAmount value) {
//             return DropdownMenuItem(
//               value: value,
//               child: Text(
//                   "премия "+ value.discountedPremium.toString() +
//                       ' - ' + "сумма "+
//                       value.insuranceSum.toString()),
//             );
//           }).toList(),
//     ),
//   }
// }
