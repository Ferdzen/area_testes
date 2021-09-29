import 'package:app_lunch/app/database/sqlite/dao/hamburguer_dao_impl.dart';
import 'package:get_it/get_it.dart';
import 'app/domain/interfaces/hamburguer_DAO.dart';

setupInjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<HamburguerDAO>(HamburguerDAOImpl());
}