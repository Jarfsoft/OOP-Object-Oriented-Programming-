#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockLength

require_relative '../lib/game'
require_relative '../lib/player'
loop do
  system('clear')
  puts "-------------------- Welcome --------------------\n------------------ Tic-Tac-Toe ------------------\n\n"
  print 'X Player\'s name: '
  name = gets.chomp
  playerx = Player.new(name, 'X')
  print 'O Player\'s name: '
  name = gets.chomp
  playero = Player.new(name, 'O')
  player = playerx
  game = Game.new
  game_over = false
  loop do
    system('clear')

    puts game.print_grid

    print "#{player.name}\'s turn. Enter <row_number,col_number> (1-3)\nPlay: "
    play = gets.chomp
    row = play[0].to_i
    col = play[2].to_i

    message = game.validate_move(row, col, player.symbol)
    if message != ''
      player = player == playerx ? playero : playerx
    end
    puts message
    sleep(1)

    if game.finish_draw
      system('clear')
      puts game.print_grid
      puts "\n\n==============================\n----------- Draw -------------\n=============================="
      sleep(1)
      game_over = true
    end
    if game.finish_win(player.symbol)
      system('clear')
      puts game.print_grid
      puts "\n\n==============================\n-------- #{player.name} won ----------\n=============================="
      sleep(1)
      game_over = true
    end
    player = player == playerx ? playero : playerx
    break if game_over
  end
  puts "\n\nWanna play again? <n> to decline"
  decision = gets.chomp.upcase
  break if decision == 'N'
end
# rubocop:enable Metrics/BlockLength
