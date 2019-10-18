import 'package:flutter/material.dart';


void main() => runApp(new MyApp());
class Komponen {
  final String type;
  final String desc;
  final String syntax;
  final String url;

  // construktor
  Komponen({this.type,this.desc,this.syntax,this.url});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      home: new ListPage(title: 'UTS PPB',),
    );
  }
}

class ListPage extends StatefulWidget {
  final String title;
  ListPage({Key key, this.title}) : super(key: key);
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Komponen> pages = <Komponen> [
    Komponen(type: 'Activity',desc: 'Sebuah aktivitas akan menghasilkan antarmuka aplikasi di layar, sebagai contoh ketika kita membuka sebuah aplikasi maka akan muncul tampilan dari aplikasi tersebut. Activity akan diimplementasikan sebagai subclass dari class Activity'),
    Komponen(type: 'Service',desc: 'Service adalah komponen yang berjalan di latar belakang. Sebagai contoh, service bisa memainkan musik di latar belakang saat user berada dalam aplikasi yang berbeda atau mungkin mengambil data melalui jaringan tanpa menghalangi interaksi pengguna dengan aktivitas.'),
    Komponen(type: 'Broadcast Receiver',desc: 'Broadcast Receiver berfungsi menerima pesan intent dari aplikasi lain atau dari sistem'),
    Komponen(type: 'Content Provider',desc: 'Content Provider adlah penyedia konten dari satu aplikasi ke aplikasi lain atas perintah tertentu'),
    Komponen(type: 'Additional Components',desc: '' ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MATERI ${widget.title}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(  
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child:  ListView.builder(
                  shrinkWrap: true,
                  itemCount: pages.length,
                  itemBuilder: (context, idx){
                    return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RaisedButton(
                      child: Text(pages[idx].type, style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(pages: pages[idx],)));
                      },
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ]
        )
      ),
    );
  }
}