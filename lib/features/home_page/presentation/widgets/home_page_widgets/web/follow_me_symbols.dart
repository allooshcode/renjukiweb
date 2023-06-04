import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_porfolio/features/portfolio/presentation/bloc/port_folio_bloc/portfolio_bloc.dart';
import 'package:my_porfolio/global/app_colors/app_colors_dark.dart';
import 'package:my_porfolio/global/utils/constants.dart';

class FollowMeSymboles extends StatelessWidget {
  const FollowMeSymboles({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<PortfolioBloc>(context)
                .add(const CallLinkedInEvent());
          },
          child: Container(
              width: AppConstants.unitWidthValu(context) * 5,
              alignment: Alignment.center,
              height: AppConstants.unitHeightValue(context) * 7,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColorsLight.secondaryColor),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('Linked In',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: AppConstants.unitWidthValu(context) * 0.7)),
              )),
        ),
      ],
    );
  }
}
