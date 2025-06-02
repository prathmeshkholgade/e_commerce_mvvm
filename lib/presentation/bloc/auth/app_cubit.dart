// import 'package:bloc/bloc.dart';
// import 'package:e_commerce_app/domain/usecase/auth/login_usecase.dart';
// import 'package:e_commerce_app/presentation/bloc/auth/app_cubit_state.dart';

// class AppCubit extends Cubit<CubitState> {
//   final LoginUsecase loginUseCase;
//   AppCubit(this.loginUseCase) : super(AuthInitialState());

//   void login(userName, password) async {
//     emit(AuthLoadingState());
//     // login logic here
//     final result = await loginUseCase(password: password, userName: userName);
//     emit(AuthState(userName: "prathmesh"));
//   }
// }
