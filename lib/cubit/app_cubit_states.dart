import 'package:equatable/equatable.dart';

import '../models/data_model.dart';

abstract class CubitStates extends Equatable {}
class InitialState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class LoadedState extends CubitStates{
  LoadedState({required this.dataModelList});
  final List<DataModel> dataModelList;
  @override
  // TODO: implement props
  List<Object> get props => [dataModelList];
}
class FailureState extends CubitStates{
  FailureState({required this.errMsg});
 final String errMsg;
  @override
  // TODO: implement props
  List<Object> get props => [errMsg];
}
class DetailPageState extends CubitStates{
  DetailPageState({required this.dataModel});
  final DataModel dataModel;
  @override
  // TODO: implement props
  List<Object> get props => [dataModel];
}