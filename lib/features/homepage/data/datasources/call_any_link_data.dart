import 'package:renjuki2/features/homepage/data/datasources/call_link__remote_data.dart';
import 'package:renjuki2/global/errors/exceptions.dart';
import 'package:renjuki2/global/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CallLinkData implements CallAnyLinkDataBase {
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
  Future<void> callFaceBookLink() async {
    try {
      if (await canLaunchUrl(Uri.parse(AppConstants.faceBookLink))) {
        await launchUrl(Uri.parse(AppConstants.faceBookLink));
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
