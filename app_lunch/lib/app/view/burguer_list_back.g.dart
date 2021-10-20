// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burguer_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BurguerListBack on _BurguerListBack, Store {
  final _$cardAtom = Atom(name: '_BurguerListBack.card');

  @override
  Future<List<Hamburguer>> get card {
    _$cardAtom.reportRead();
    return super.card;
  }

  @override
  set card(Future<List<Hamburguer>> value) {
    _$cardAtom.reportWrite(value, super.card, () {
      super.card = value;
    });
  }

  final _$_BurguerListBackActionController =
      ActionController(name: '_BurguerListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_BurguerListBackActionController.startAction(
        name: '_BurguerListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_BurguerListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
card: ${card}
    ''';
  }
}
