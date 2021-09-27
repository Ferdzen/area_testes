import 'package:app_lunch/app/database/sqlite/connection.dart';
import 'package:app_lunch/app/domain/entities/hamburguer.dart';
import 'package:app_lunch/app/domain/interfaces/hamburguer_DAO.dart';
import 'package:sqflite/sqflite.dart';

class HamburguerDAOImpl implements HamburguerDAO {
  Database _db;

  @override
  Future<List<Hamburguer>> find() async {
    _db = await Connection.get();
    List<Map<String,dynamic>> resultado = await _db.query('cardapio');
    List<Hamburguer> cardapio = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Hamburguer(
          id: linha['id'],
          nome: linha['nome'],
          descricao: linha['descricao'],
          valor: linha['valor'],
          url_icon: linha['url_icon']);
    });

    return cardapio;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM cardapio WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Hamburguer hamburguer) async {
    _db = await Connection.get();
    var sql;

    if (hamburguer.id == null) {
      sql =
          'INSERT INTO cardapio (nome, descricao, valor, url_icon) VALUES(?,?,?,?)';
      _db.rawInsert(sql, [
        hamburguer.nome,
        hamburguer.descricao,
        hamburguer.valor,
        hamburguer.url_icon
      ]);
    } else {
      sql =
          'UPDATE cardapio SET nome = ?, descricao = ?, valor = ?, url_icon = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        hamburguer.nome,
        hamburguer.descricao,
        hamburguer.valor,
        hamburguer.url_icon,
        hamburguer.id
      ]);
    }
  }
}
