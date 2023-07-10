import 'package:bow_wow/Components/Dialogs/adopt_dialog.dart';
import 'package:bow_wow/Components/HelperClasses/loading_widget.dart';
import 'package:bow_wow/Components/adopt_button.dart';
import 'package:bow_wow/Components/detail_tile_widget.dart';
import 'package:bow_wow/Components/image_view.dart';
import 'package:bow_wow/Components/owner_tile.dart';
import 'package:bow_wow/Models/list_model.dart';
import 'package:bow_wow/Theme/colors.dart';
import 'package:bow_wow/UI/DetailsPage/Bloc/detail_bloc.dart';
import 'package:bow_wow/UI/DetailsPage/Bloc/detail_state.dart';
import 'package:bow_wow/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  final ListItem data;

  const DetailPage({super.key, required this.data});

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  late DetailBloc detailBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      detailBloc.saveData(widget.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    detailBloc = BlocProvider.of<DetailBloc>(context);
    return Scaffold(
      body: BlocConsumer<DetailBloc, DetailState>(
        listener: (context, state) {
          if (state is PetAdoptedState) {
            showSuccessDialog();
          }
        },
        builder: (context, state) {
          if (state is DetailInitialState) {
            return LoadingWidget.circularLoader;
          } else {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _getImageWidget(),
                      _getNameWidget(),
                      _getOwnerWidget(),
                      _getTilesView(),
                      _getDescriptionWidget()
                    ],
                  ),
                ),
                _getBackButton(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _getAdoptButton(state is DetailLoadingState),
                )
              ],
            );
          }
        },
      ),
    );
  }

  Widget _getDescriptionWidget() {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 100.0, left: 16, right: 16, top: 24),
      child: Text(
        detailBloc.data.description ?? "",
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(),
      ),
    );
  }

  Widget _getOwnerWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: OwnerTile(
        imageUrl: detailBloc.data.profileImage ?? "",
        name: detailBloc.data.ownerName ?? "",
        contact: detailBloc.data.ownerContact,
      ),
    );
  }

  Widget _getTilesView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailTileWidget(
              color: AppColors.tileColor1,
              title: Strings.sex,
              value: detailBloc.data.sex ?? ""),
          DetailTileWidget(
              color: AppColors.tileColor2,
              title: Strings.age,
              value: "${detailBloc.data.ageYears ?? ""} ${Strings.years}"),
          DetailTileWidget(
              color: AppColors.tileColor3,
              title: Strings.weight,
              value: "${detailBloc.data.weight ?? 0}${Strings.kg}")
        ],
      ),
    );
  }

  Widget _getNameWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailBloc.data.name ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.pets_outlined,
                  size: 20,
                ),
              ),
              Expanded(
                child: Text(
                  detailBloc.data.breed ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.pin_drop_outlined,
                  size: 20,
                ),
              ),
              Expanded(
                child: Text(
                  detailBloc.data.location ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getImageWidget() {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Hero(
        tag: detailBloc.data.documentId ?? "",
        child: AppImageView().appDetailImageView(context,
            detailBloc.data.imageUrl ?? "", detailBloc.data.isAdopted ?? false),
      ),
    );
  }

  Widget _getAdoptButton(bool isLoading) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 24),
      child: AdoptButton(
        isLoading: isLoading,
        isAdopted: detailBloc.data.isAdopted ?? false,
        onClick: onAdoptClick,
      ),
    );
  }

  void onAdoptClick() {
    detailBloc.adoptPet(context);
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop(true);
        });
        return const AdoptSuccessfulDialog();
      },
    );
  }

  Widget _getBackButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Card(
        margin: const EdgeInsets.only(top: 52, left: 16),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(child: Icon(Icons.arrow_back)),
        ),
      ),
    );
  }
}
