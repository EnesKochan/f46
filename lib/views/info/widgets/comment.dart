import 'package:f46/ui/costum_theme.dart';
import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  final String user;
  final String text;
  final String time;
  final String photo;
  const Comment({super.key, required this.user, required this.text, required this.time, required this.photo});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {


  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        
        //color: AppColors.beyaz,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        border: Border.all(color: AppColors.anarenk, style: BorderStyle.solid),
        
      ),
      margin: const EdgeInsets.only(bottom: 6),
      
      child: 
      Padding(padding: const EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.anarenk,
                    radius: 20,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.photo),
                      radius: 18,
                  ),),
                  const SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.user, style: context.paragraph?.copyWith(fontWeight: FontWeight.w600),),
                      Text(widget.time, style: context.small?.copyWith(fontWeight: FontWeight.w300),),
                    ],
                  ),
                ],
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert, color: AppColors.ikincirenk,))
            ],
          ),
          const SizedBox(height: 8),
          Text(widget.text)
        ],
      ),),
    );
  }
}