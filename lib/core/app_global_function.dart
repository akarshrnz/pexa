import 'package:pexa_carcare_test/core/api_constants.dart';

class AppGlobalFunction{
 static String getPosterUrl(String? path) {
  if (path != null) {
    return ApiConstants.basePosterUrl + path;
  } else {
    return ApiConstants.moviePlaceHolder;
  }
}

// static String getBackdropUrl(String? path) {
//   if (path != null) {
//     return ApiConstants.baseBackdropUrl + path;
//   } else {
//     return ApiConstants.moviePlaceHolder;
//   }
// }
}