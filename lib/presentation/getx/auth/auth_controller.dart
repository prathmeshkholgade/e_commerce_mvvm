import 'package:e_commerce_app/core/utils/helper.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/usecase/auth/login_usecase.dart';
import 'package:e_commerce_app/presentation/views/main_page.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final LoginUsecase loginUseCase;
  var token = "".obs;
  var isLoading = false.obs;
  var isTokenInitialized = false.obs;
  AuthController({required this.loginUseCase});
  @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   _loadStoredToken();
  // }
  Future<void> loadStoredToken() async {
    token.value = await Helper.loadToken();
    print("Loaded token: ${token}");
    isTokenInitialized.value = true;
  }

  // final  token = "".obs;

  Future<void> loginUser(String userName, String password) async {
    isLoading.value = true;
    final result = await loginUseCase(userName: userName, password: password);
    result.fold(
      (e) {
        print(e);
        isLoading.value = false;
      },
      (value) {
        token.value = value;
        print(value);
        print("type ${value.runtimeType}");

        Helper.saveApiToken(token: value);
        Get.offAll(MainPage());
      },
    );
    isLoading.value = false;
  }

  bool get isLoggedIn => token.value.isNotEmpty;
}
