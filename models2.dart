

import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

Future getJson()async{
 final response=await rootBundle.loadString("json/market.json");
 var res=jsonDecode(response);
 var fin=List<Categorie>.from(res.map((i)=>Categorie.fromJson(i)));
 return fin;
}

class ListCategorie{
  final List<Categorie> categorie;
  ListCategorie({this.categorie});
  factory ListCategorie.fromJson(List<dynamic>json){
    List<Categorie>arrcate=List<Categorie>();
    arrcate=json.map((i)=>Categorie.fromJson(i)).toList();
    return ListCategorie(
        categorie: arrcate
    );
  }
}

class Categorie {
  int id;
  String nomCategorie;
  String imageCategorie;
  ListProduit produit;

  Categorie({
    this.id,
    this.nomCategorie,
    this.imageCategorie,
    this.produit,
  });

  factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
    id: json["id"],
    nomCategorie: json["nom_categorie"],
    imageCategorie: json["image_categorie"],
    produit: ListProduit.fromJson(json["produit"]),
  );


}
class ListProduit{
  List<Produit> prod;
  ListProduit({this.prod});
  factory ListProduit.fromJson(List<dynamic>json){
    List<Produit>arrprod=List<Produit>();
    arrprod=json.map((i)=>Produit.fromJson(i)).toList();
    return ListProduit(
      prod: arrprod
    );
  }
}

class Produit {
  int id;
  String nomProduit;
  String descriptionProduit;
  int prixProduit;
  String imageProduit;
  ListCommande commande;

  Produit({
    this.id,
    this.nomProduit,
    this.descriptionProduit,
    this.prixProduit,
    this.imageProduit,
    this.commande,
  });

  factory Produit.fromJson(Map<String, dynamic> json) => Produit(
    id: json["id"],
    nomProduit: json["nom_produit"],
    descriptionProduit: json["description_produit"],
    prixProduit: json["prix_produit"],
    imageProduit: json["image_produit"],
    commande: ListCommande.fromJson(json["commande"]),
  );

}

class ListCommande{
  List<Commande> com;
  ListCommande({this.com});
  factory ListCommande.fromJson(List<dynamic>json){
    List<Commande>arrcom=List<Commande>();
    arrcom=json.map((i)=>Commande.fromJson(i)).toList();
    return ListCommande(
        com: arrcom
    );
  }
}

class Commande {
  int id;
  String date;
  int quantite;
  String status;
 Utilisateur utilisateur;

  Commande({
    this.id,
    this.date,
    this.quantite,
    this.status,
    this.utilisateur,
  });

  factory Commande.fromJson(Map<String, dynamic> json) => Commande(
    id: json["id"],
    date: json["date"],
    quantite: json["quantite"],
    status: json["status"],
    utilisateur:Utilisateur.fromJson(json["utilisateur"]),
  );

}


class Utilisateur {
  int id;
  String nomUtilisateur;
  String contactUtilisateur;

  Utilisateur({
    this.id,
    this.nomUtilisateur,
    this.contactUtilisateur,
  });

  factory Utilisateur.fromJson(Map<String, dynamic> json) => Utilisateur(
    id: json["id"],
    nomUtilisateur: json["nom_utilisateur"],
    contactUtilisateur: json["contact_utilisateur"],
  );

}
