final createTable = '''
CREATE TABLE cardapio(
  id INT PRIMARY KEY
  ,nome VARCHAR(200) 
  ,descricao VARCHAR(500) 
  ,valor NUM(10,2) 
  ,url_icon VARCHAR(300) 
)
''';

final insert = '''
INSERT INTO cardapio (nome, descricao, valor, url_icon)
VALUES ('CheeseBurguer', 'Pão, Hamburguer 250g, Queijo duplo', '8,00', 'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg'),
('Burguer Duplo', 'Pão, 2 Hamburguer 250g, Queijo, Presunto, Cheedar', '12,00','https://cdn.pixabay.com/photo/2020/11/08/01/44/burger-5722678_960_720.jpg'),
('Burguer c/ bacon','Pão, Hamburguer 250g, Queijo duplo, 2 tiras de Bacon, Presunto', '15,00', 'https://cdn.pixabay.com/photo/2015/04/20/13/25/burgers-731298_960_720.jpg');

''';
