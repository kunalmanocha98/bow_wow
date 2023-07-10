import 'package:bow_wow/Connectivity/firestore_calls.dart';
import 'package:bow_wow/Models/list_model.dart';
import 'package:bow_wow/UI/HomePage/Pages/UnAdoptedPetsListPage/Bloc/unadopted_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Utils/Services/navigator_service.dart';
import '../../../../DetailsPage/detail_page.dart';

class UnAdoptedListBloc extends Cubit<UnAdoptedListState>{
  UnAdoptedListBloc(super.initialState);
  List<ListItem> list = [];

  void fetchData(BuildContext context){
    list.clear();
    emit(UnAdoptedLoadingState());
    FireStoreCalls().getUnAdoptedPets().then((value) {
      if(value.docs.isNotEmpty){
        for (var element in value.docs) {
          list.add(ListItem.fromFireStore(element));
        }
        emit(UnAdoptedLoadedState());
      }else{
        emit(UnAdoptedEmptyState());
      }

    });
  }

  void openDetail(BuildContext context,ListItem data) {
    NavigatorService().push(context, DetailPage(data: data));
  }
}