class Produto {
  // Atributos da classe com tipo e nulidade definidos
  String? nome;
  double? preco;

  // Construtor da classe para inicializar os atributos
  //Produto(this.nome, this.preco);

  // Método opcional para exibir as informações do produto
  void exibirDetalhes() {
    // Usamos o operador '??' para fornecer um valor padrão caso o atributo seja nulo
    print('Nome do Produto: ${nome ?? 'Não informado'}');
    print('Preço: R\$${preco?.toStringAsFixed(2) ?? 'Não informado'}');
  }
}

int exec(int a, int b, int Function(int, int) fn) {
  return fn(a, b);
}

main() {
  //Passando uma função como parametro
  final r = exec(2, 3, (a, b) {
    return a - b;
  });

  //Outra forma de passar uma função como parametro. Sem chaves e só com uma sentença de código.
  final r2 = exec(2, 3, (a, b) => a * b + 100);
  print("O resultado é $r");
  print("O resultado 2 é $r2");

  var p1 = Produto();
  p1.nome = "Caneta";
  p1.preco = 12.99;
  p1.exibirDetalhes();
}
