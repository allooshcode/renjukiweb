import 'package:my_porfolio/features/portfolio/data/datasources/call_link__remote_data.dart';
import 'package:my_porfolio/global/errors/exceptions.dart';
import 'package:my_porfolio/global/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CallLinkedInData extends CallLinkRemoteDataBase {
  @override
  Future<void> callLink() async {
    try {
      if (await canLaunchUrl(Uri.parse(AppConstants.linkidInUrl))) {
        await launchUrl(Uri.parse(AppConstants.linkidInUrl));
      } else {
        throw ServerException(msgError: 'Could not launch Linked In profile');
      }
    } catch (err) {
      throw ServerException(msgError: err.toString());
    }
  }
}
