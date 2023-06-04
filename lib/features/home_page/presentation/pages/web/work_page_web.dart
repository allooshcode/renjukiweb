import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_porfolio/features/portfolio/presentation/bloc/port_folio_bloc/portfolio_bloc.dart';
import 'package:my_porfolio/global/shared_widgets/photo_widget.dart';
import 'package:my_porfolio/global/utils/constants.dart';

import '../../../../../global/animations/tween_animation.dart';
import '../../widgets/home_page_widgets/web/apps_info.dart';

class WorkPageWeb extends StatelessWidget {
  const WorkPageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(
            child: CustomTweenAnimation(
                widgetToAnimate: PhotoWidget(
              photoPath: 'assets/mobileApp.png',
              fun: () {
                BlocProvider.of<PortfolioBloc>(context)
                    .add(const CallMobLinkEvent(isIphoneApp: false));
              },
            )),
          ),
          const Expanded(
              child: AppsInfo(
            subTitle:
                'Online Grocery Store application in Production for Suria WholeSaler sdn bhd in Kuala Lumpur.',
            title: 'Suria Store Mobile APP ( Android)',
          ))
        ]),
        SizedBox(
          height: AppConstants.unitHeightValue(context) * 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTweenAnimation(
                  widgetToAnimate: PhotoWidget(
                photoPath: 'assets/mobileApp.png',
                fun: () {
                  BlocProvider.of<PortfolioBloc>(context)
                      .add(const CallMobLinkEvent(isIphoneApp: true));
                },
              )),
            ),
            const Expanded(
              child: AppsInfo(
                subTitle:
                    'Developed from scratch - Stripe payment Gateway - Firebase Back end - Flutter Front end - Google Location API.',
                title: 'Suria Store Mobile APP (IOS )',
              ),
            )
          ],
        ),
        SizedBox(
          height: AppConstants.unitHeightValue(context) * 20,
        ),
        Row(children: [
          Expanded(
            child: CustomTweenAnimation(
                widgetToAnimate: PhotoWidget(
              photoPath: 'assets/webApp.png',
              fun: () {
                BlocProvider.of<PortfolioBloc>(context)
                    .add(const CallWebLinkEvent());
              },
            )),
          ),
          const Expanded(
              child: AppsInfo(
            subTitle:
                'in production for Suria Wholesaler , creative website developed from scratch using Flutter & Dart.',
            title: 'Suriawholesaler.com web app',
          ))
        ]),
      ],
    );
  }
}
