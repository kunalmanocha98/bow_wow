import 'package:bow_wow/Components/circle_avatar.dart';
import 'package:flutter/material.dart';

class OwnerTile extends StatelessWidget{
  final String imageUrl;
  final String? contact;
  final String name;
  const OwnerTile({super.key, required this.imageUrl, this.contact, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppCircleAvatar(imageUrl:imageUrl),
        Expanded(child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8),
          child: Text(
            name,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
        )),
        _getCallButton()
      ],
    );
  }

  Widget _getCallButton(){
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red.shade100
      ),
      child: const Icon(Icons.call_outlined,color: Colors.redAccent,),
    );
  }
}