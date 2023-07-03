import 'package:f46/ui/costum_theme.dart';
import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String baslik;
  final String konum;
  final String imgUrl;
  const SmallCard({super.key, required this.baslik, required this.konum, required this.imgUrl});


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
                              child: Image.network(imgUrl, fit: BoxFit.cover,),
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
                                      Text(baslik, style: context.paragraph?.copyWith(fontWeight: FontWeight.w500),),
                                         Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                          Row(
                                            children: [
                                              Icon(Icons.location_on, size: 16,),
                                              Text(konum, style: context.xsmall?.copyWith(color: context.gri),),
                                             ],
                                          ),
                                          Icon(Icons.favorite, size: 20,),
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



