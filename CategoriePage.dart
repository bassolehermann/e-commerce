import 'dart:convert';

import 'package:e_commerce/pages/ProduitPage.dart';
import 'package:flutter/material.dart';
import '../models/models2.dart';
import '../models/models.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'animation.dart';
class CategoriePage extends StatefulWidget {

  @override
  _CategoriePageState createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  TextEditingController controller = new TextEditingController();
  Future getJson()async{
    final response=await rootBundle.loadString("json/market.json");
    var res=jsonDecode(response);
    var fin=List<Categorie>.from(res.map((i)=>Categorie.fromJson(i)));
    _userDetails=List<Categorie>.from(res.map((i)=>Categorie.fromJson(i)));
    return fin;
  }
  @override
  void initState() {
    super.initState();
    getJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: new TextField(
            controller: controller,
            decoration: new InputDecoration(
                hintText: 'Search', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: new IconButton(
            icon: new Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search, color: Colors.black54,),
          )
        ],
      ),
      body: Container(
        child: _searchResult.length > 0 || controller.text.isNotEmpty
      ? Container(
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder (
            future: getJson(),
            builder: (context,snapshot){
              if(snapshot.data!=null){
                List<Categorie> cate=snapshot.data;
                return ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, i) => GestureDetector(
                      onTap: (){
                        Navigator.push(context, SizeRoute(page: ProduitPage(_searchResult[i].produit.prod,)));
                      },
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            image: DecorationImage(
                                image: AssetImage(_searchResult[i].imageCategorie),
                                fit: BoxFit.cover
                            )
                        ),
                        child: Text(_searchResult[i].nomCategorie, style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),),
                      ),
                    )
                );
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

            },
          ),
        ):
        Container(
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder (
            future: getJson(),
            builder: (context,snapshot){
              if(snapshot.data!=null){
                List<Categorie> cate=snapshot.data;
                return ListView.builder(
                    itemCount: cate.length,
                    itemBuilder: (buildContext, index) => GestureDetector(
                      onTap: (){
                        Navigator.push(context, SizeRoute(page: ProduitPage(cate[index].produit.prod,)));
                      },
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            image: DecorationImage(
                                image: AssetImage(cate[index].imageCategorie),
                                fit: BoxFit.cover
                            )
                        ),
                        child: Text(cate[index].nomCategorie, style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),),
                      ),
                    )
                );
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home,color: Colors.grey,), onPressed: (){}),
            IconButton(icon: Icon(Icons.branding_watermark,color: Colors.blue), onPressed: (){}),
            IconButton(icon: Icon(Icons.shopping_cart,color: Colors.grey), onPressed: (){}),
            IconButton(icon: Icon(Icons.account_box,color: Colors.grey), onPressed: (){})
          ],
        ),
      ),
    );
  }
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _userDetails.forEach((CategorieDetail) {
      if (CategorieDetail.nomCategorie.contains(text)) _searchResult.add(CategorieDetail);
    });
    setState(() {});
  }
}

List<Categorie> _searchResult = [];

List<Categorie> _userDetails = [];