import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Moto {
  String nome = " ";
  String paisUsado = " ";
  String descricao = " ";
  String imageLink = " ";
  Moto(this.nome, this.paisUsado, this.descricao, this.imageLink);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<Moto> _motos = [
    Moto(
        "Custom",
        "Estados unidos",
        "Moto para pessoas que gostam de estrada, viagens longa e com o máximo de conforto",
        "https://st.depositphotos.com/1162342/2627/i/600/depositphotos_26273907-stock-photo-custom-motorcycle.jpg"),
    Moto(
        "Yamaha R6",
        "Japão",
        "Moto para pessaos que gostam de aventura e velociade, conforto e rapidez são seu atribusto.",
        "https://images.unsplash.com/photo-1609630875171-b1321377ee65?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3xlbnwwfHwwfHw%3D&w=1000&q=80"),
    Moto(
        "WATTS-W125",
        "Estados unidos",
        "Moto elétrica, modelo feito pensando no efeito mais agradavél para a natureza e sem gastos com combustão de gazolina ou alcool.",
        "https://autoentusiastas.com.br/ae/wp-content/uploads/2022/02/WATTS-W125-ABRE-1140x720.jpg"),
    Moto(
        "classicas",
        "Japão",
        "Modelo criado pela honda, muito papular nos dias atuais por colecionadores de moto antigas.",
        "https://quatrorodas.abril.com.br/wp-content/uploads/2016/10/140620-classicas-02.jpeg?quality=70&strip=info&w=928?quality=70&strip=info&w=636"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Motos',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 63, 139),
          title: const Text('Motos'),
        ),
        body: ListView.builder(
          itemCount: _motos.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(_motos[index].nome),
                subtitle: Text(_motos[index].paisUsado),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EspadasTela(_motos[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class EspadasTela extends StatelessWidget {
  final Moto _moto;
  const EspadasTela(this._moto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 63, 139),
        title: Text(_moto.nome),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image.network(
                _moto.imageLink,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Center(
              child: Text(
                _moto.descricao,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
