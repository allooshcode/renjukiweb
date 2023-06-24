// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:renjuki2/features/homepage/presentation/bloc/port_folio_bloc/home_bloc.dart';
// import 'package:renjuki2/global/app_colors/app_colors_dark.dart';
// import 'package:renjuki2/global/utils/constants.dart';
//
// import '../../../bloc/home_bloc/home_bloc.dart';
//
// class FollowMeSymboles extends StatelessWidget {
//   const FollowMeSymboles({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         InkWell(
//           onTap: () {
//             BlocProvider.of<HomeBloc>(context).add(const CallLinkedInEvent());
//           },
//           child: Container(
//               width: AppConstants.unitWidthValu(context) * 5,
//               alignment: Alignment.center,
//               height: AppConstants.unitHeightValue(context) * 7,
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle, color: AppColorsLight.secondaryColor),
//               child: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: Text('Linked In',
//                     textAlign: TextAlign.center,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                         fontSize: AppConstants.unitWidthValu(context) * 0.7)),
//               )),
//         ),
//       ],
//     );
//   }
// }
