// ignore_for_file: avoid_print

import 'dart:io';

import 'dart:math';

enum Move {
  rock,
  paper,
  scissor,
}
void main() {
  final rng = Random();
  while (true) {
    stdout.write('Rock, paper or scissors? (r/p/s)');
    final input = stdin.readLineSync();
    if (input == 'r' || input == 'p' || input == 's') {
      Move playerMove;
      if (input == 'r') {
        playerMove = Move.rock;
      } else if (input == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissor;
      }
      final random = rng.nextInt(3);
      // *values contained inside the enum. enum values are positional(0,1,2,...)
      final aiMove = Move.values[random];
      print(""""You played: $playerMove
      AI played: $aiMove""");
      if (playerMove == aiMove) {
        print("It's a draw");
      } else if (playerMove == Move.rock && aiMove == Move.scissor ||
          playerMove == Move.paper && aiMove == Move.rock ||
          playerMove == Move.scissor && aiMove == Move.paper) {
        print('you win');
      } else {
        print('You lose');
      }
      print('Selected: $input');
    } else if (input == 'q') {
      break;
    } else {
      print('Invalid input!');
    }
  }
}
