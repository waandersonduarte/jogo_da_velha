import 'dart:math';
import '../testemunho/constantes.dart';
import '../testemunho/regras_vencedor.dart';
import '../enumeracoes/tipo_jogador.dart';
import '../enumeracoes/tipo_vencedor.dart';
import '../modelos/placa_azulejos.dart';

class GameController {
  List<PlacaAzulejos> tiles = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  late TipoJogador currentPlayer;
  late bool isSinglePlayer;

  bool get hasMoves =>
      (movesPlayer1.length + movesPlayer2.length) != BOARD_SIZE;

  GameController() {
    _initialize();
  }

  void _initialize() {
    movesPlayer1.clear();
    movesPlayer2.clear();
    currentPlayer = TipoJogador.player1;
    isSinglePlayer = false;
    tiles = List<PlacaAzulejos>.generate(
      BOARD_SIZE,
      (index) => PlacaAzulejos(index + 1),
    );
  }

  void reset() {
    _initialize();
  }

  void markBoardTileByIndex(index) {
    final tile = tiles[index];
    if (currentPlayer == TipoJogador.player1) {
      _markBoardTileWithPlayer1(tile);
    } else {
      _markBoardTileWithPlayer2(tile);
    }

    tile.enable = false;
  }

  void _markBoardTileWithPlayer1(PlacaAzulejos tile) {
    tile.symbol = PLAYER1_SYMBOL;
    tile.color = PLAYER1_COLOR;
    movesPlayer1.add(tile.id);
    currentPlayer = TipoJogador.player2;
  }

  void _markBoardTileWithPlayer2(PlacaAzulejos tile) {
    tile.symbol = PLAYER2_SYMBOL;
    tile.color = PLAYER2_COLOR;
    movesPlayer2.add(tile.id);
    currentPlayer = TipoJogador.player1;
  }

  bool _checkPlayerWinner(List<int> moves) {
    return winnerRules.any((rule) =>
        moves.contains(rule[0]) &&
        moves.contains(rule[1]) &&
        moves.contains(rule[2]));
  }

  TipoVencedor checkWinner() {
    if (_checkPlayerWinner(movesPlayer1)) return TipoVencedor.player1;
    if (_checkPlayerWinner(movesPlayer2)) return TipoVencedor.player2;
    return TipoVencedor.none;
  }

  int automaticMove() {
    var list = new List.generate(9, (i) => i + 1);
    list.removeWhere((element) => movesPlayer1.contains(element));
    list.removeWhere((element) => movesPlayer2.contains(element));

    var random = new Random();
    var index = random.nextInt(list.length - 1);
    return tiles.indexWhere((tile) => tile.id == list[index]);
  }
}
