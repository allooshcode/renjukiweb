import 'package:my_porfolio/features/portfolio/data/datasources/call_link__remote_data.dart';
import 'package:my_porfolio/global/errors/exceptions.dart';
import 'package:my_porfolio/global/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CallMobAppData extends CallAnyLinkDataBase {
  @override
  Future<void> callMobileGoogleLink() async {
    try {
      if (await canLaunchUrl(Uri.parse(AppConstants.mobileGooglePlayApp))) {
        await launchUrl(Uri.parse(AppConstants.mobileGooglePlayApp));
      } else {
        throw ServerException(msgError: 'Could not launch url');
      }
    } catch (err) {
      throw ServerException(msgError: err.toString());
    }
  }
  
  @override
  Future<void> callWebLink() async {
     try {
      if (await canLaunchUrl(Uri.parse(AppConstants.webAppLink))) {
        await launchUrl(Uri.parse(AppConstants.webAppLink));
      } else {
        throw ServerException(msgError: 'Could not launch url');
      }
    } catch (err) {
      throw ServerException(msgError: err.toString());
    }
  }
  
  @override
  Future<void> callMobileIosLink() async {
  try {
      if (await canLaunchUrl(Uri.parse(AppConstants.iosAppLink))) {
        await launchUrl(Uri.parse(AppConstants.iosAppLink));
      } else {
        throw ServerException(msgError: 'Could not launch url');
      }
    } catch (err) {
      throw ServerException(msgError: err.toString());
    }
  }
}
