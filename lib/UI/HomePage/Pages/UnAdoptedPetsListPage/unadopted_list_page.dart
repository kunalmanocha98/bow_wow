import 'package:bow_wow/Components/HelperClasses/loading_widget.dart';
import 'package:bow_wow/Components/list_item.dart';
import 'package:bow_wow/Components/not_found_widget.dart';
import 'package:bow_wow/UI/HomePage/Pages/UnAdoptedPetsListPage/Bloc/unadopted_list_bloc.dart';
import 'package:bow_wow/UI/HomePage/Pages/UnAdoptedPetsListPage/Bloc/unadopted_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnAdoptedListPage extends StatefulWidget{
  const UnAdoptedListPage({super.key});

  @override
  UnAdoptedListPageState createState() => UnAdoptedListPageState();
}

class UnAdoptedListPageState extends State<UnAdoptedListPage>{
  late UnAdoptedListBloc unAdoptedListBloc;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      unAdoptedListBloc.fetchData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    unAdoptedListBloc = BlocProvider.of<UnAdoptedListBloc>(context);
    return BlocBuilder<UnAdoptedListBloc, UnAdoptedListState>(
      builder: (BuildContext context, state) {
        if (state is UnAdoptedLoadingState) {
          return LoadingWidget.circularLoader;
        } else if (state is UnAdoptedEmptyState) {
          return const NotFoundWidget();
        } else {
          return ListView.builder(
            itemCount: unAdoptedListBloc.list.length,
            padding: const EdgeInsets.only(bottom: 100),
            itemBuilder: (BuildContext context, int index) {
              return ListItemWidget(
                data: unAdoptedListBloc.list[index],
                index: index,
                callback: () {
                  unAdoptedListBloc.openDetail(context, unAdoptedListBloc.list[index]);
                },
              );
            },
          );
        }
      },
    );
  }
}