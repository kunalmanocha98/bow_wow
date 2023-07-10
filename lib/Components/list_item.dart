import 'package:bow_wow/Components/custom_card.dart';
import 'package:bow_wow/Components/image_view.dart';
import 'package:bow_wow/Models/list_model.dart';
import 'package:bow_wow/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final int index;
  final ListItem data;
  final void Function()? callback;

  const ListItemWidget(
      {super.key, required this.index, required this.data, this.callback});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              transitionOnUserGestures: true,
              tag: data.documentId ?? "",
              child: AppImageView().appListImageView(
                  context, data.imageUrl ?? "", data.isAdopted ?? false),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          data.name ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                          onPressed: callback,
                          child: Text(
                            Strings.seeDetails,
                          ))
                    ],
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
                          data.breed ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          data.sex!.toLowerCase() == "male"
                              ? Icons.male_outlined
                              : Icons.female_outlined,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          data.sex ?? "",
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
                          data.location ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
