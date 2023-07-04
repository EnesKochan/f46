import 'package:f46/views/info/widgets/sliver_appbar_delegate.dart';
import 'package:flutter/material.dart';
import '../../../../ui/costum_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// ignore: camel_case_types
class infoPage extends StatefulWidget {
  final String locId;     //Bir önceki sayfadan gelirken getirilen id
  
  const infoPage({super.key, required this.locId});

  @override
  State<infoPage> createState() => _infoPageState();
}

// ignore: camel_case_types
class _infoPageState extends State<infoPage> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance.collection('locations').doc(widget.locId).get(),
              builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Bir şeyler ters gitti.");
                }
                if (snapshot.hasData && !snapshot.data!.exists) {
                   return Center (
                    child: Text("Veri bulunamadı(locId'yi kontrol et)"));
                }
                if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    return DefaultTabController(
                      length: 3,
                      child: NestedScrollView(
                        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                          
                          return <Widget>[
                            SliverAppBar(
                              expandedHeight: 240.0,
                              floating: true,
                              pinned: true,
                              stretch: true,
                              leading: Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: IconButton(
                                      icon: Icon(Icons.arrow_back_ios_new_outlined, color: context.secondary, size: 30,),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                              ), 
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(Icons.share, color: context.secondary, size: 30,)),
                                )
                              ],
                              flexibleSpace: FlexibleSpaceBar(
                                  centerTitle: true,
                                  title: Text("${data['title']}",
                                      style: context.h5?.copyWith(color: context.secondary, fontWeight: FontWeight.w500)),
                                  background: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.network(
                                        "${data['img']} ",
                                        fit: BoxFit.cover,
                                      ),
                                      const DecoratedBox(decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment(0.0, 0.6),
                                            end: Alignment(0.0, 0.0),
                                            colors: [
                                              Color(0xb2f69829),
                                              Color(0x00000000),
                                            ] )
                                      ))
                                    ],
                                  )
                                  ),
                            ),
                            SliverPersistentHeader(
                              delegate: SliverAppBarDelegate(
                                TabBar(
                                    unselectedLabelColor: context.gri,
                                    indicatorWeight: 3, 
                                    controller: _tabController,
                                    tabs: const <Widget>[
                                      Tab(text: 'Hakkında'),
                                      Tab(text: 'Yorumlar'),
                                      Tab(text: 'Konum'),
                                    ],
                                  ),
                              ),
                              pinned: true,
                            ),
                          ];
                        },
                        body: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                SafeArea(
                                minimum:const EdgeInsets.only(left: 20, right: 20, top: 4),
                                top: false,
                                  child: CustomScrollView(
                                    slivers: [
                                      SliverList(
                                        delegate: SliverChildListDelegate(
                                          [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 8,),
                                                Text("${data['description']} ", 
                                                style: context.paragraph?.copyWith(color: context.gri),
                                                // overflow: TextOverflow.ellipsis, // sonuna nokta nokta ekler
                                                // maxLines: 6, //maksimum satır sayısı
                                                ),
                                                const SizedBox(height: 22,),
                                                Text("Toplulukta Paylaşılanlar ", style: context.h4,),
                                                
                                                
                                              ],
                                            )
                                            
                                          ]
                                        ),
                                        ),

                                        
                                      
                                        SliverGrid(
                                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 150.0,
                                            mainAxisSpacing: 10.0,
                                            crossAxisSpacing: 10.0,
                                            childAspectRatio: 1.0,
                                          ),
                                          delegate: SliverChildBuilderDelegate(
                                            (BuildContext context, int index) {
                                              final photo = data['photos'][index]; // locIdden geliyo
                                              return Container(
                                                
                                                decoration: BoxDecoration(
                                                  color: context.primary,
                                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                ),
                                                child: 
                                                ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: 
                                                Image.network(photo, fit: BoxFit.cover,),),
                                              );
                                            },
                                            childCount: data['photos'].length,
                                          ),
                                        ),

                                        
                                    ],
                                  ),
                                ),
                                const Card(
                                  margin: EdgeInsets.all(16.0),
                                  child: Center(
                                      child: Text('Yorumlar Eklenecek!')),
                                ),
                                const Card(
                                  margin: EdgeInsets.all(16.0),
                                  child: Center(
                                      child: Text('Haritalar ve konum bilgileri eklenecek!')),
                                ),
                              ],
                            ),
                      ),
                    );
                
                
                }

                return CircularProgressIndicator();
                },
                              ),
                      
            

    );
  }
}






