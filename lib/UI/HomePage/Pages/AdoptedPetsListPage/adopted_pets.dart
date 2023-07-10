import 'package:bow_wow/Components/HelperClasses/loading_widget.dart';
import 'package:bow_wow/Components/list_item.dart';
import 'package:bow_wow/Components/not_found_widget.dart';
import 'package:bow_wow/UI/HomePage/Pages/AdoptedPetsListPage/Bloc/adopted_pets_bloc.dart';
import 'package:bow_wow/UI/HomePage/Pages/AdoptedPetsListPage/Bloc/adopted_pets_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdoptedPetsPage extends StatefulWidget{
  const AdoptedPetsPage({super.key});

  @override
  AdoptedPetsPageState createState() => AdoptedPetsPageState();
}

class AdoptedPetsPageState extends State<AdoptedPetsPage>{
  late AdoptedPetsBloc adoptedPetsBloc;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      adoptedPetsBloc.fetchData(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    adoptedPetsBloc = BlocProvider.of<AdoptedPetsBloc>(context);
    return BlocBuilder<AdoptedPetsBloc, AdoptedPetsState>(
      builder: (BuildContext context, state) {
        if (state is AdoptedPetsLoadingState) {
          return LoadingWidget.circularLoader;
        } else if(state is AdoptedPetsEmptyState){
          return const NotFoundWidget();
        }else {
          return ListView.builder(
            itemCount: adoptedPetsBloc.list.length,
            padding: const EdgeInsets.only(bottom: 100),
            itemBuilder: (BuildContext context, int index) {
              return ListItemWidget(
                data: adoptedPetsBloc.list[index],
                index: index,
                callback: () {
                  adoptedPetsBloc.openDetail(context,adoptedPetsBloc.list[index]);
                },
              );
            },
          );
        }
      },
    );
  }
}