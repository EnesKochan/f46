import 'package:f46/views/info/widgets/costum_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../ui/costum_theme.dart';

class MapTab extends StatelessWidget {
  final double xCoordinate;
  final double yCoordinate;
  const MapTab({super.key, required this.xCoordinate, required this.yCoordinate});

  @override
  Widget build(BuildContext context) {
    return Stack(
                                  
                                  children: [ 

                                    
                                    
                                    FlutterMap(
                                        options: MapOptions(
                                        center: LatLng(xCoordinate, yCoordinate),
                                        zoom: 15.8,
                                      ),
                                      children: [
                                        TileLayer(
                                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                            userAgentPackageName: 'com.example.app',
                                        ),
                                        MarkerLayer(
                                          markers: [
                                              Marker(
                                                point: LatLng(xCoordinate, yCoordinate),
                                                width: 50,
                                                height: 50,
                                                builder: (context) => const CostumMarker(),
                                              ),
                                          ],
                                      )
                                      ],
                                    ),
                                    

                                      Padding(
                                      padding: const EdgeInsets.only(right: 22, bottom: 32),
                                      child: Align(
                                        alignment: AlignmentDirectional.bottomEnd,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                  blurRadius: 3.0,
                                                  ),
                                              ],
                                            color: AppColors.anarenk,
                                            borderRadius: BorderRadius.circular(8)
                                          ),
                                          width: 60,
                                          height: 60,
                                          child: const Icon(Icons.directions, size: 30, color: AppColors.beyaz,),
                                          
                                        ),
                                      ),
                                      ),

                                      Padding(
                                      padding: const EdgeInsets.only(right: 22, bottom: 104),
                                      child: Align(
                                        alignment: AlignmentDirectional.bottomEnd,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                  blurRadius: 3.0,
                                                  ),
                                              ],
                                            color: AppColors.beyaz,
                                            borderRadius: BorderRadius.circular(30)
                                          ),
                                          width: 60,
                                          height: 60,
                                          child: const Icon(Icons.my_location, size: 30, color: AppColors.anarenk,),
                                          
                                        ),
                                      ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 22, bottom: 32),
                                        child: Align(alignment: AlignmentDirectional.bottomStart,
                                        // ignore: avoid_unnecessary_containers
                                        child: Container(
                                          
                                          child: Image.asset("assets/logoKucuk.png"),
                                        ),),
                                      )
                                    
                                    ]

                                );
  }
}