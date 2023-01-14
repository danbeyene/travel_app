
import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/models/data_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit({required this.dataServices}) : super(InitialState()){
    emit(WelcomeState());
  }
  List<DataModel>? dataModelList;
  DataServices dataServices;
  getData() async {
    try{
      emit(LoadingState());
      dataModelList = await dataServices.getPlaceData();
      emit(LoadedState(dataModelList: dataModelList!));
    }catch(e){
      emit(FailureState(errMsg: e.toString()));
    }
  }
  goToDetailPage(DataModel dataModel){
    emit(DetailPageState(dataModel: dataModel));
  }
  goBack(){
    emit(LoadedState(dataModelList: dataModelList!));
  }

}