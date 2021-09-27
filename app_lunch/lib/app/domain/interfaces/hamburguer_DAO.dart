

import 'package:app_lunch/app/domain/entities/hamburguer.dart';

abstract class HamburguerDAO{

  save(Hamburguer hamburguer);

  remove(int id);

  Future<List<Hamburguer>>find();

}