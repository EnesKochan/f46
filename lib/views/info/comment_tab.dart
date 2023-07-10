

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f46/services/helper_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets/comment.dart';
import '../../ui/costum_input.dart';
import '../../ui/costum_theme.dart';

class CommentTab extends StatefulWidget {
  final String locId;
  const CommentTab({super.key, required this.locId});

  @override
  State<CommentTab> createState() => _CommentTabState();
}

class _CommentTabState extends State<CommentTab> {

  final _commentTextController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser!;

  //yorum ekle
  void addComment(String commentText){
    //firebase update
    FirebaseFirestore.instance
      .collection("locations")
      .doc(widget.locId)
      .collection("Comments")
      .add({
        "CommentText": commentText,
        "CommentedBy": currentUser.displayName,
        "CommentedByPhoto": currentUser.photoURL,
        "CommentTime": Timestamp.now(),
        }
      );
      return clearText();
  }
  void clearText() {
    _commentTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
    bottomNavigationBar: 
            Padding(padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
            child: Row(
            children: [
              Expanded(child: 
                TextField(
                  controller: _commentTextController,
                      decoration: InputDecoration(
                      focusedBorder: CostumInput.Focus.copyWith(borderRadius: BorderRadius.circular(50)),
                      enabledBorder: CostumInput.Enabled.copyWith(borderRadius: BorderRadius.circular(50)),
                      filled: true,
                      fillColor: AppColors.beyaz,
                      
                      prefixIcon: const 
                      Padding(padding: EdgeInsets.all(8),
                      child: Icon(Icons.emoji_emotions),),
                        hintText: 'Yorumunuzu yazınız...',
                        floatingLabelStyle: context.h5?.copyWith(color: AppColors.anarenk, fontWeight: FontWeight.w800),
                        labelStyle: context.paragraph?.copyWith(color: AppColors.koyugri),
                                    )),),
              const SizedBox(width: 8,),
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.anarenk,
                child:IconButton(
                  onPressed: () => addComment(_commentTextController.text), 
                  icon: const Icon(Icons.send, size: 30, color: AppColors.beyaz,)),),
            ],
          ),),
    body: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: 
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                  .collection("locations")
                  .doc(widget.locId)
                  .collection("Comments")
                  .orderBy("CommentTime", descending: true)
                  .snapshots(),
                builder: (context, snaphot){
                  if (!snaphot.hasData){
                    return const Center(
                      child: CircularProgressIndicator()
                    );
                  
                  };

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                          Padding(
                            padding: const EdgeInsets.only(right: 8, left: 6, top: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Row(
                                  children: [
                                    Text("Filtrele", style: context.paragraph?.copyWith(fontWeight: FontWeight.w500),),
                                    const SizedBox(width: 4,),
                                    const Icon(Icons.filter_list, color: AppColors.ikincirenk,),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("En Yeni", style: context.small?.copyWith(fontWeight: FontWeight.w500, color: AppColors.anarenk),),
                                    const SizedBox(width: 4,),
                                    const Icon(Icons.arrow_drop_down_circle_outlined),
                                  ],
                                )
                              ],
                            ),
                            ),
                          Expanded(
                            child:ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: snaphot.data!.docs.map((doc) {
                              final commentData = doc.data() as Map<String, dynamic>;
                              return Comment(
                                user: commentData["CommentedBy"], 
                                text: commentData["CommentText"],
                                photo: commentData["CommentedByPhoto" ] ,
                                time: formatDate(commentData["CommentTime"]), );
                    
                            }).toList(),
                          ),
                        
                      ),
                    ],
                  );
                },
                ),
            
          ),
          
        
      );
  }
}