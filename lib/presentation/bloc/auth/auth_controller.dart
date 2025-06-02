import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/usecase/auth/login_usecase.dart';
import 'package:e_commerce_app/presentation/views/main_page.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final LoginUsecase loginUseCase;

  AuthController({required this.loginUseCase});
  var token = "".obs;
  var isLoading = false.obs;
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
        Get.offAll(MainPage());
      },
    );
    isLoading.value = false;
  }
}
