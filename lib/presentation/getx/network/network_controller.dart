// import 'package:get/get.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

// class NetworkController extends GetxController {
//   var isConnected = true.obs;
//   @override
//   void onInit() {
//     super.onInit();
//     Connectivity().onConnectivityChanged.listen((result) {
//       if (result == ConnectivityResult.mobile ||
//           result == ConnectivityResult.wifi) {
//             isConnected.value=true;
//         print('connected');
//         print(result);
//       }else if(result== ConnectivityResult.none){
//         isConnected.value=false;
//         print('not connected');
//         print(result);
//       }
//     });

//   }
// }
