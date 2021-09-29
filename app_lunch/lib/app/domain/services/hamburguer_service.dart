


import 'package:app_lunch/app/domain/entities/hamburguer.dart';
import 'package:app_lunch/app/domain/exception/domain_layer_exception.dart';
import 'package:app_lunch/app/domain/interfaces/hamburguer_DAO.dart';
import 'package:get_it/get_it.dart';

class HamburguerService{
  
  /*
  Utilizando a injeção, corto a depencidência que existiria entre a camada de domínio e a camada
  de implementação, setando os métodos que vou utilizar por meio da camada de interface e chamando
  o que estiver disponível para ter acesso as operações do banco de dados, usando o GetIt para 
  tercerizar minha implementação.
  */ 
  var _dao = GetIt.I.get<HamburguerDAO>();

  salvar(Hamburguer hamburguer){
    validaNome(hamburguer.nome);
    validaDescricao(hamburguer.descricao);
    validaValor(hamburguer.valor);
    _dao.save(hamburguer);
  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Hamburguer>> find(){
    return _dao.find();
  }

  validaNome(String nome){
    var min = 10;
    var max = 60;

    if(nome == null){
      throw new DomainLayerException('O nome é obrigatório.');
    }else if(nome.length < min){
      throw new DomainLayerException('O nome deve possuir pelo menos $min caracteres.');
    }else if(nome.length > max){
      throw new DomainLayerException('O nome deve possuir no máximo $max caracteres.');
    }
    
  }

  validaDescricao(String descricao){
    var min = 10;
    var max = 300;

    if(descricao == null){
      throw new DomainLayerException('A descrição não pode estar vazia.');
    }else if(descricao.length < min){
      throw new DomainLayerException('A descrição deve possuir pelo menos $min caracteres.');
    }else if(descricao.length > max){
      throw new DomainLayerException('A descrição deve possuir no máximo $max caracteres.');
    }
  }

  validaValor(double valor){
    var min = 2;

    if(valor <= min){
      throw new DomainLayerException('O valor inserido é muito baixo. Entre com um valor maior que $min reais.');
    }
  }
}