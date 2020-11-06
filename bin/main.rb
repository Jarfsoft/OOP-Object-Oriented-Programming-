#!/usr/bin/env ruby
puts 'Hello, world!'
loop do
  puts "-------------------- Welcome --------------------\n------------------ Tic-Tac-Toe ------------------\n\n"
  print 'X Player\'s name: '
  name1 = gets.chomp
  # Create Player class
  grid = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  game_over = false
  loop do
    # Print board function here
    puts " #{grid[0][0]} | #{grid[0][1]} | #{grid[0][2]}\n---+---+---\n#{grid[1][0]} | #{grid[1][1]} | #{grid[1][2]}"
    puts "---+---+---\n#{grid[2][0]} | #{grid[2][1]} | #{grid[2][2]}"
    # Get play from player function here
    print "#{name1}\'s turn. Enter <row_number,col_number>\nPlay: "
    play = gets.chomp
    row = play[0].to_i
    col = play[2].to_i
    row -= 1
    col -= 1
    if row < -1 || row > 3 || col < -1 || col > 3
      puts "================================\n----------- Invalid entry -------------\n================================"
      next
    end
    # Validate move function here
    (0..2).each do |i|
      (0..2).each do |j|
        grid[i][j] = 'X' if i == row && j == col && (grid[i][j]).to_s == ' '
      end
    end
    # Validate win lose or draw function here
    break if game_over
  end
  puts "\n\nWanna play again? <n> to decline"
  decision = gets.chomp.upcase
  break if decision == 'N'
end
