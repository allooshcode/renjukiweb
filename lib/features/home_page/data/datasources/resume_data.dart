
import 'package:renjuki/features/home_page/data/datasources/call_link__remote_data.dart';
import 'package:renjuki/global/errors/exceptions.dart';
import 'package:renjuki/global/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';



class ResumeData extends CallLinkRemoteDataBase {
  @override
  Future<void> callLink() async {
    try {
      if (await canLaunchUrl(Uri.parse(AppConstants.resumeUrl))) {
        await launchUrl(Uri.parse(AppConstants.resumeUrl));
      } else {
        throw ServerException(msgError: 'Could not launch Resume File');
      }
    } catch (err) {
      throw ServerException(msgError: err.toString());
    }
  }
}
