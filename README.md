# Buy List

Aplicativo Flutter para gerenciar listas de compras. O usuário cria uma lista (grupo), adiciona itens com preço, marca itens como concluídos e acompanha o total de valores marcados e não marcados.

## Funcionalidades

- Criar listas de compra (grupos)
- Adicionar itens com nome e preço
- Marcar/desmarcar itens
- Editar item marcado
- Resumo de totais (marcados x não marcados)

## Estrutura do projeto

- lib/main.dart: bootstrap do app e rotas principais
- lib/models: modelos de domínio (lista e item)
- lib/pages: telas principais
- lib/widgets: componentes reutilizáveis

## Telas principais

- ShoppingListPage: lista de grupos
- CreateShoppingListPage: criação de um novo grupo
- ProductListPage: itens da lista selecionada

## Como executar

1. Instale o Flutter SDK (recomendado 3.10+)
1. Baixe as dependências:

flutter pub get

1. Rode o app:

flutter run

## Testes

flutter test

## Assets

As imagens ficam em assets/images e já estão registradas no pubspec.yaml.
