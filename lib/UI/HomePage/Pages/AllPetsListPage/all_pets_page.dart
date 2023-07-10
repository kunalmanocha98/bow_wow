import 'package:bow_wow/Components/HelperClasses/loading_widget.dart';
import 'package:bow_wow/Components/list_item.dart';
import 'package:bow_wow/Components/not_found_widget.dart';
import 'package:bow_wow/UI/HomePage/Pages/AllPetsListPage/Bloc/all_pets_bloc.dart';
import 'package:bow_wow/UI/HomePage/Pages/AllPetsListPage/Bloc/all_pets_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPetsListPage extends StatefulWidget {
  const AllPetsListPage({super.key});

  @override
  AllPetsListPageState createState() => AllPetsListPageState();
}

class AllPetsListPageState extends State<AllPetsListPage> {
  late AllPetsBloc allPetsBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      allPetsBloc.fetchData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    allPetsBloc = BlocProvider.of<AllPetsBloc>(context);
    return BlocBuilder<AllPetsBloc, AllPetsState>(
      builder: (BuildContext context, state) {
        if (state is AllPetsLoadingState) {
          return LoadingWidget.circularLoader;
        } else if (state is AllPetsEmptyState) {
          return const NotFoundWidget();
        } else {
          return ListView.builder(
            itemCount: allPetsBloc.list.length,
            padding: const EdgeInsets.only(bottom: 100),
            itemBuilder: (BuildContext context, int index) {
              return ListItemWidget(
                data: allPetsBloc.list[index],
                index: index,
                callback: () {
                  allPetsBloc.openDetail(context, allPetsBloc.list[index]);
                },
              );
            },
          );
        }
      },
    );
  }
}
