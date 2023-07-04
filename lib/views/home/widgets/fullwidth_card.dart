import 'package:f46/ui/costum_theme.dart';
import 'package:flutter/material.dart';

class FullWidthCard extends StatelessWidget {
  final String baslik;
  final String konum;
  final String imgUrl;
  const FullWidthCard({super.key, required this.baslik, required this.konum, required this.imgUrl});


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
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(imgUrl, fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                child: Container (
                                   height: 48,
                                   width: MediaQuery.of(context).size.width,
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
                                              Icon(Icons.push_pin, size: 16,),
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



