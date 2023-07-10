import 'package:bow_wow/Connectivity/firestore_calls.dart';
import 'package:bow_wow/Models/list_model.dart';
import 'package:bow_wow/UI/DetailsPage/Bloc/detail_state.dart';
import 'package:bow_wow/UI/HomePage/Pages/AdoptedPetsListPage/Bloc/adopted_pets_bloc.dart';
import 'package:bow_wow/UI/HomePage/Pages/AllPetsListPage/Bloc/all_pets_bloc.dart';
import 'package:bow_wow/UI/HomePage/Pages/UnAdoptedPetsListPage/Bloc/unadopted_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBloc extends Cubit<DetailState>{
  DetailBloc(super.initialState);
  late ListItem data;

  void adoptPet(BuildContext context){
    emit(DetailLoadingState());
    FireStoreCalls().adoptPet(data.documentId??"").then((value) {
      data.isAdopted = true;
      emit(PetAdoptedState());
      BlocProvider.of<AllPetsBloc>(context).fetchData(context);
      BlocProvider.of<AdoptedPetsBloc>(context).fetchData(context);
      BlocProvider.of<UnAdoptedListBloc>(context).fetchData(context);
    }).catchError((onError){
      emit(DetailChangeState());
    });
  }

  void saveData(ListItem data) {
    this.data = data;
    emit(DetailChangeState());
  }

}