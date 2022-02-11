import 'package:flutter/material.dart';
import '../data/entity_ejemplo.dart';

typedef NavigatorDetail = void Function(EntityNumero);
typedef AddTodo = void Function(EntityNumero, String);

//typedef Blocpro<B extends BlocBase<int>> = BlocProvider<B , int>> ;

class HomePage extends StatelessWidget {
  final NavigatorDetail onGoto;
  const HomePage({Key? key, required this.onGoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<EntityNumero> nmumber = List.generate(4,
        (index) => EntityNumero(id: index * index, numero: '${index * index}'));

    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: nmumber.length,
            itemBuilder: (_, index) => GestureDetector(
                  // onTap: () => onGotodetails(nmumber[index]),
                  onTap: () => onGoto(nmumber[index]),
                  child: Container(
                    height: 200,
                    margin: const EdgeInsets.all(20),
                    child: FittedBox(child: Text(nmumber[index].numero)),
                    color: Colors.pinkAccent,
                  ),
                )),
      ),
    );
  }

  onGotodetails(EntityNumero number) => onGoto(number);
}

class Numeros extends StatelessWidget {
  final EntityNumero entityNumero;
  final AddTodo ontoGotodo;

  const Numeros(
      {Key? key, required this.entityNumero, required this.ontoGotodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = 'Será que srivio el envió del argumento!!!!!';
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: FittedBox(child: Text('Bienvenido ${entityNumero.id}')),
          ),
          TextButton(
              onPressed: () => addGodTodo(entityNumero, name),
              child: const Text('aplasta'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Agregar contenido',
            textScaleFactor: 0.5, textAlign: TextAlign.center),
        onPressed: () => addGodTodo(entityNumero, name),
      ),
    );
  }

  void addGodTodo(EntityNumero entityNumero, name) =>
      ontoGotodo(entityNumero, name);
}

class AddCaterogy extends StatelessWidget {
  final EntityNumero entityNumero;
  final String nosequepoder;

  const AddCaterogy(
      {Key? key, required this.entityNumero, required this.nosequepoder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Hero(
        tag: entityNumero.id,
        child: Center(
          child: Text(
            'Estamos para agregar más numeros $nosequepoder --${entityNumero.numero}',
            style: const TextStyle(color: Colors.purpleAccent),
          ),
        ),
      ),
    );
  }
}

class Unkonw extends StatelessWidget {
  const Unkonw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('404'),
    );
  }
}
