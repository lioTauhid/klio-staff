import '../service/api/api_exception.dart';
import '../utils/utils.dart';

class ErrorController {
  void handleApiError(error) {
    switch (error) {
      case BadRequestException:
        Utils.hideLoading();
        Utils.showSnackBar("Failed to load data $error");
        break;
      case ApiNotRespondingException:
        Utils.hideLoading();
        Utils.showSnackBar("Failed to load data $error");
        break;
      // show error dialog
      case ProcessDataException:
        Utils.hideLoading();
        Utils.showSnackBar("Failed to load data $error");
        break;
      // show error dialog
      default:
        Utils.hideLoading();
        Utils.showSnackBar("Failed to load data $error");
        break;
      // show error dialog
    }
  }
}
