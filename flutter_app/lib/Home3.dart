import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
//import 'dart:async';

class Home3 extends StatefulWidget {
  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  String _preco = "0";

  void _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);
Map<String , dynamic> retorno = json.decode(response.body);
setState(() {
  _preco = retorno["CAD"]["buy"].toString();
});
print("Resultado : " + retorno["BRL"]["buy"].toString());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Image.asset("imagens/bitcoin.png"),
             Text("Quer saber o valor do bitcoin atualize!"),
             Padding(padding: EdgeInsets.only(top:30 ,bottom:30),
            
             child:           
             Text(
                 "R\$ : " + _preco,
             style: TextStyle(
               fontSize: 35
             ),) ,
             ),
             Text("Valor do bitCoin"),
             RaisedButton(
               child: Text("Atualizar",
               style: TextStyle(
                 fontSize: 20,
                 color: Colors.white
               ),),
               color: Colors.orange,
               padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
               onPressed: _recuperarPreco,
             )
            ],
          ),
        ),
      ),
    );
  }
}
