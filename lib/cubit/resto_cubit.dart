import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_with_bloc/models/resto_models.dart';
import 'package:state_with_bloc/service/resto_service.dart';

part 'resto_state.dart';

class RestoCubit extends Cubit<RestoState> {
  RestoCubit() : super(RestoInitial());

  void getResto() async {
    try {
      emit(RestoLoading());
      RestaurantModel resto = await RestoService().getListResto();
      emit(RestoSuccess(resto));
    } catch (e) {
      emit(RestoFailed(e.toString()));
    }
  }
}
