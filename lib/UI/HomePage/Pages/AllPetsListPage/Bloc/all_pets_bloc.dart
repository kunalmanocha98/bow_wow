
import 'package:bow_wow/Connectivity/firestore_calls.dart';
import 'package:bow_wow/Models/list_model.dart';
import 'package:bow_wow/UI/DetailsPage/detail_page.dart';
import 'package:bow_wow/UI/HomePage/Pages/AllPetsListPage/Bloc/all_pets_state.dart';
import 'package:bow_wow/Utils/Services/navigator_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPetsBloc extends Cubit<AllPetsState>{
  AllPetsBloc(super.initialState);
  List<ListItem> list = [];

  void fetchData(BuildContext context){
    list.clear();
    emit(AllPetsLoadingState());
    FireStoreCalls().getAllPets().then((value) {
      if(value.docs.isNotEmpty){
        for (var element in value.docs) {
          list.add(ListItem.fromFireStore(element));
        }
      }
      emit(AllPetsLoadedState());
    });
  }

  void openDetail(BuildContext context,ListItem data) {
    NavigatorService().push(context, DetailPage(data: data));
  }

}