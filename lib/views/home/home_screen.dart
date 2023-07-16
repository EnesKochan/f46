import 'package:f46/ui/costum_theme.dart';
import 'package:f46/views/home/widgets/costum_navbar.dart';
import 'package:f46/views/home/widgets/fullwidth_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../info/info_page.dart';
import '../../widgets/costum_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/small_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    

final pPhoto = FirebaseAuth.instance.currentUser?.photoURL ?? 'https://firebasestorage.googleapis.com/v0/b/travelly-90e1c.appspot.com/o/AnonimPhoto.jpg?alt=media&token=1507d6e6-47da-4a5f-95dc-3c717cd39180';
final currentUser = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)?.settings.arguments as User?;
    return Scaffold(
      appBar:  CostumAppbar(pPhoto: pPhoto,),
        
      bottomNavigationBar: const CostumNavBar(),
      body:Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Çevrendeki Popüler Konumlar", style: context.paragraph?.copyWith(fontWeight: FontWeight.w500),),
                          Text("Hepsini Gör", style: context.small?.copyWith(color: AppColors.anarenk)),
                        ],
                      ),
                    )
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  SliverToBoxAdapter(
                  child: SizedBox(
                  height: 200.0,
                  child: 
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                    .collection("locations")
                    .snapshots(),
                    builder: (context, snapshot){
                        
                        if(snapshot.hasError){
                          return const Text("Bir şeyler ters gitti.");
                        }
                        if(snapshot.connectionState == ConnectionState.waiting){
                           return const Scaffold(
                            body: Center(
                              child: CircularProgressIndicator(),
                            ),
                           );
                        }
                        if(snapshot.data!.docs.isEmpty){
                          return const Text("Geçerli veri bulunamadı");
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: ((context, index) {
                            final locId = snapshot.data!.docs[index].id;
                            return 
                              InkWell(
                                  onTap: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => 
                                      infoPage(locId: locId, colId: 'locations',),),);
                                  },
                                  child: SmallCard(
                                    locId: locId,
                                    baslik: snapshot.data!.docs[index]['title'], 
                                    konum: snapshot.data!.docs[index]['konum'], 
                                    imgUrl: snapshot.data!.docs[index]['img'], 
                                    likes: List<String>.from(snapshot.data!.docs[index]['Likes']),
                                  ),
                              );
                            }
                          )
                        );
                      },
                    ),
                    )
                  ),
                  // ara başlık
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 16),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popüler Rotalar", style: context.paragraph?.copyWith(fontWeight: FontWeight.w500),),
                          Text("Hepsini Gör", style: context.small?.copyWith(color: AppColors.anarenk)),
                        ],
                      ),
                    )
                  ),

                    const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  // big cards
                  
                  SliverFixedExtentList(
                    itemExtent: MediaQuery.of(context).size.height,
                    
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return StreamBuilder(
                          
                    stream: FirebaseFirestore.instance
                    .collection("routes")
                    .snapshots(),
                    builder: (context, snapshot){
                        
                        if(snapshot.hasError){
                          return const Text("Bir şeyler ters gitti.");
                        }
                        if(snapshot.connectionState == ConnectionState.waiting){
                           return const CircularProgressIndicator();
                        }
                        if(snapshot.data!.docs.isEmpty){
                          return const Text("Geçerli veri bulunamadı");
                        }
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: ((context, index) {
                            final rotId = snapshot.data!.docs[index].id;
                            return 
                              Padding(
                                  padding: const EdgeInsets.only(right: 18),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => 
                                          infoPage(locId: rotId, colId: 'routes',),),);
                                      },
                                      child: FullWidthCard(
                                        likes: List<String>.from(snapshot.data!.docs[index]['Likes']),
                                        locId: rotId,
                                        baslik: snapshot.data!.docs[index]['title'], 
                                        konum: snapshot.data!.docs[index]['konum'], 
                                        imgUrl: snapshot.data!.docs[index]['img']
                                      ),
                                  ),
                                
                              );
                            }
                          )
                        );
                      },
                    );
                      }, //
                    ), //
                  ), //

                  
                ],
              ),
      ),
            
    );
  }
}


