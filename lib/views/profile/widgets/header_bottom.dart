import 'package:f46/ui/costum_theme.dart';
import 'package:flutter/material.dart';

class HeaderDetails extends StatelessWidget implements PreferredSizeWidget {
  final int takipci;
  final int takipEdilen;
  final int begeni;
  const HeaderDetails({super.key, required this.takipci, required this.takipEdilen, required this.begeni});

   @override
  Size get preferredSize =>  Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: EdgeInsets.only(right: 22, left: 22, bottom: 18),
          child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Takip Edilenler", style: context.paragraph?.copyWith(fontWeight: FontWeight.w600),),
                    Text(takipEdilen.toString(), style: context.small,),
                  ],
                ),
                Column(
                  children: [
                    Text("Takipçiler", style: context.paragraph?.copyWith(fontWeight: FontWeight.w600),),
                    Text(takipci.toString(), style: context.small,),
                  ],
                ),
                Column(
                  children: [
                    Text("Beğeniler", style: context.paragraph?.copyWith(fontWeight: FontWeight.w600),),
                    Text(begeni.toString(), style: context.small,),
                  ],
                ),

              ],
              ),
        ),
        );
  }
  

}