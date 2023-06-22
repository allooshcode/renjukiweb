import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:renjuki2/features/homepage/presentation/widgets/home_page_widgets/web/follow_me_symbols.dart';
import 'package:renjuki2/global/shared_widgets/custom_button.dart';
import 'package:renjuki2/global/shared_widgets/list_tile.dart';
import 'package:renjuki2/global/utils/icon_broken.dart';

import '../../../../../../global/utils/constants.dart';

class HeaderInfoWebWidget extends StatelessWidget {
  const HeaderInfoWebWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const CustomListTile(
        textData: 'ALAA AHMAD ALI AL AYATIM',
        iconLeading: IconBroken.Profile,
        fontSize: 6,
      ),
      SizedBox(
        height:
            AppConstants.secondaryText * AppConstants.unitHeightValue(context),
      ),
      const CustomListTile(
        textData: 'FLUTTER DEVELOPER',
        iconLeading: IconBroken.Work, fontSize: 6,
        // color: AppColorsLight.secondaryColor,
      ),
      Padding(
        padding: EdgeInsets.all(AppConstants.unitHeightValue(context) * 2),
        child: Text(
            '         I\'m mobile developer & graphic desinger based in Malaysia,'
            'and i\'m passionate and dedicated to my work. ',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: AppConstants.unitHeightValue(context) * 3,
                )),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: AppConstants.secondaryText *
                AppConstants.unitHeightValue(context),
          ),
          Expanded(
              child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is LaunchingWhatsState) {
                Fluttertoast.showToast(
                    msg: 'Excited to contact you..',
                    toastLength: Toast.LENGTH_LONG,
                    webPosition: 'center');
              }
            },
            builder: (context, state) {
              return CustomButton(
                fun: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(const LaunchWhatsAppEvent());
                },
                icon: IconBroken.Call_Silent,
                title: 'Contact Now',
              );
            },
          )),
          SizedBox(
            width: AppConstants.secondaryText *
                AppConstants.unitHeightValue(context),
          ),
          Expanded(
            child: CustomButton(
                fun: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(const CallResumeEvent());
                },
                title: "Resume",
                icon: IconBroken.Edit_Square),
          ),
        ],
      ),
      SizedBox(
        height:
            AppConstants.secondaryText * AppConstants.unitHeightValue(context),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('  Follow Me:  '),
          const FollowMeSymboles(),
          Expanded(
            child: SizedBox(
              width: AppConstants.secondaryText *
                  AppConstants.unitHeightValue(context),
            ),
          ),
        ],
      )
    ]);
  }
}
