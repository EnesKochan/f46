import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f46/ui/costum_theme.dart';
import 'package:f46/views/home/widgets/like_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../widgets/anonim_alert.dart';

class SmallCard extends StatefulWidget {
    final String baslik;
    final String konum;
    final String imgUrl;
    final List<String> likes;
    final String locId;
  const SmallCard({super.key, 
      required this.baslik, 
      required this.konum, 
      required this.imgUrl,  
      required this.likes, 
      required this.locId});

  @override
  State<SmallCard> createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {

  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState(){
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }
  void toggleLike() {
  if (currentUser.email == null) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AnonimAlert();
        },
      );
  } else {
    setState(() {
      isLiked = !isLiked;
    });

    DocumentReference postRef =
        FirebaseFirestore.instance.collection("locations").doc(widget.locId);

    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return 
          SizedBox(
                height: 200,
                width: 220,
                child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),),
                      elevation: 3,
                      child: Column(
                          children: [
                            SizedBox(
                              height: 126,
                              width: 220,
                              child: CachedNetworkImage(
                                imageUrl: widget.imgUrl, fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                child: Container (
                                   height: 48,
                                   width: 200,
                                   child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Text(widget.baslik, style: context.paragraph?.copyWith(fontWeight: FontWeight.w500),),
                                         Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.location_on, size: 16,),
                                              Text(widget.konum, style: context.xsmall?.copyWith(color: context.gri),),
                                             ],
                                          ),
                                          Row(
                                            children: [
                                              Text(widget.likes.length.toString()),
                                              const SizedBox(width: 4,),
                                              LikeButton(isLiked: isLiked, onTap: toggleLike),
                                            ],
                                          ),
                                          ],
                                        ),
                                      ],
                                    ),
                                                  
                                  ),
                                ),
                               ],
                              ),
                            ),
                          );
  }
}



