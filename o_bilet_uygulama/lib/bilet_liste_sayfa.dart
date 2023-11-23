import 'package:flutter/material.dart';
import 'package:o_bilet_uygulama/bilgiler.dart';

class BiletListeSayfa extends StatefulWidget {
  const BiletListeSayfa({super.key});

  @override
  State<BiletListeSayfa> createState() => _BiletListeSayfaState();
}

class _BiletListeSayfaState extends State<BiletListeSayfa> {


  Future<List<Bilgiler>> bilgileriYukle() async {
    var bilgilerlistesi = <Bilgiler>[];
    var b1 = Bilgiler(firmaAd: "Metro", resim: "metro.png", fiyat: 300, saat: "15:00");
    var b2 = Bilgiler(firmaAd: "Vip", resim: "vip.png", fiyat: 350, saat: "15:30");
    var b3 = Bilgiler(firmaAd: "Kamil Koç", resim: "kamilkoc.png", fiyat: 320, saat: "15:30");
    var b4 = Bilgiler(firmaAd: "Pamukkale", resim: "pamukkale.png", fiyat: 330, saat: "16:00");
    var b5 = Bilgiler(firmaAd: "Kale", resim: "kale.png", fiyat: 350, saat: "16:30");
    bilgilerlistesi.add(b1);
    bilgilerlistesi.add(b2);
    bilgilerlistesi.add(b3);
    bilgilerlistesi.add(b4);
    bilgilerlistesi.add(b5);

    return bilgilerlistesi;
  }

  @override



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: 160, width:MediaQuery.of(context).size.width),

      body: FutureBuilder<List<Bilgiler>>(
        future: bilgileriYukle(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var bilgilerListesi = snapshot.data;
            return ListView.builder(
              itemCount: bilgilerListesi!.length,
              itemBuilder: (context,indeks){
                var bilgi = bilgilerListesi[indeks];
                return GestureDetector(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:Card(
                      color: Colors.white,
                      child: Row(
                        children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 75,width: 75,
                                      child: Container(alignment: Alignment.centerLeft,
                                          child: Image.asset("resimler/${bilgi.resim}"))),
                                  Row(
                                    children: [
                                      Icon(Icons.account_box_outlined),
                                      Text("2+1",style: TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                  Text("İzmir Otogar > Ankara Otogar"),
                                ],
                            ),
                             ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(width: 50,height: 100,alignment: Alignment.centerRight,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("${bilgi.saat}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time),
                                      Text("8s*",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(width: 100,
                            alignment: Alignment.topRight ,
                            child: Column(
                              children: [
                                Text("${bilgi.fiyat} TL",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(1,1,10,1),
                                      child: TextButton(onPressed: (){}, child: Text("İncele",style: TextStyle(color: Colors.black)),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else{
            return const Center();
          }
        },
      ),
    );
  }
}
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final double width;

  const CustomAppBar({Key? key, required this.height, required this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(width, height), child: Image.asset("resimler/ustekran.png"));
  }
  @override
  Size get preferredSize => Size.fromHeight(height);
  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 160,
        flexibleSpace: CustomAppBar(
          height: 160,
          width: MediaQuery.of(context).size.width,
        )
    );
  }
}
