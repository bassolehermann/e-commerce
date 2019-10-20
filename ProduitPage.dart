import 'package:e_commerce/models/models2.dart';
import 'package:flutter/material.dart';
import '../pages/Panier.dart';
import 'animation.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ProduitPage extends StatefulWidget {
  final List<Produit> produit;
  ProduitPage(this.produit);

  @override
  _ProduitPageState createState() => _ProduitPageState();
}

class _ProduitPageState extends State<ProduitPage> {
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    for(var i in widget.produit){
      _userDetails.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,

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
        leading: GestureDetector(
            onTap: () {
              _userDetails.clear();
              _searchResult.clear();
              return Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Card(
                    elevation: 3,
                    child: Container(
                      height: 50,
                      //width: MediaQuery.of(context).size.width/2.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.arrow_drop_down),
                          Text('sort'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 3,
                    child: Container(
                      height: 50,
                      //width: MediaQuery.of(context).size.width/2.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.arrow_drop_down),
                          Text('Refine'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: _searchResult.length >0 || controller.text.isNotEmpty
              ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _searchResult.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context, SizeRoute(page: Panier(_searchResult[i]))),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  _searchResult[i].imageProduit,
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: double.infinity,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(_searchResult[i].nomProduit,
                                            style: TextStyle(color: Colors.grey)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(_searchResult[i].prixProduit.toString(),
                                            style: TextStyle(color: Colors.black)),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text('4.5',
                                                style: TextStyle(color: Colors.grey)),
                                            Icon(Icons.star, color: Colors.yellow),
                                            Spacer(),
                                            Text(_searchResult.length.toString(),
                                                style: TextStyle(color: Colors.grey)),
                                            SizedBox(
                                              width: 6,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget.produit.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context, SizeRoute(page: Panier(widget.produit[i]))),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            widget.produit[i].imageProduit,
                            fit: BoxFit.cover,
                            height: 150,
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(widget.produit[i].nomProduit,
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(widget.produit[i].prixProduit.toString(),
                                      style: TextStyle(color: Colors.black)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text('4.5',
                                          style: TextStyle(color: Colors.grey)),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Spacer(),
                                      Text(widget.produit.length.toString(),
                                          style: TextStyle(color: Colors.grey)),
                                      SizedBox(
                                        width: 6,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            )
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
    _userDetails.forEach((ProduitDetail) {
      if (ProduitDetail.nomProduit.contains(text))
        _searchResult.add(ProduitDetail);
    });
    setState(() {});
  }
}

List<Produit> _searchResult = [];

List<Produit> _userDetails = [];
