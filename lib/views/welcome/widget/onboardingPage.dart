// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f46/ui/costum_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatelessWidget {
  final String img;
  final String baslik;
  final String altBaslik;
  const OnBoardingWidget({super.key, required this.img, required this.baslik, required this.altBaslik});

  @override
  Widget build(BuildContext context) {
    return Container(
              color: AppColors.pageColor,
              child: 
              SafeArea(
                minimum: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                        imageUrl: img,
                        //placeholder: (context, url) => const CircularProgressIndicator(),
                        ),
                    Text(baslik, style: context.h3?.copyWith(color: AppColors.anarenk), textAlign: TextAlign.center,),
                    Text(altBaslik,
                          style: context.paragraph, textAlign: TextAlign.center,)
                ],
              ),),
            );
  }
}

