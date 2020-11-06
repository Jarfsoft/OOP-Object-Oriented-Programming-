#!/usr/bin/env ruby
puts 'Hello, world!'
loop do
  puts '-------------------- Welcome --------------------'
  puts "------------------ Tic-Tac-Toe ------------------\n\n"
  print 'X Player\'s name: '
  name1 = gets.chomp
  print 'O Player\'s name: '
  name2 = gets.chomp
  # Create Player class
  grid = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  game_over = false
  loop do
    # Print board function here
    puts " #{grid[0][0]} | #{grid[0][1]} | #{grid[0][2]}"
    puts "---+---+---"
    puts " #{grid[1][0]} | #{grid[1][1]} | #{grid[1][2]}"
    puts "---+---+---"
    puts " #{grid[2][0]} | #{grid[2][1]} | #{grid[2][2]}"
    play = ''
    # Get play from player function here
    puts "#{name1}\'s turn. Enter <row_number,col_number>"
    print 'Play: '
    play = gets.chomp
    row = play[0].to_i
    col = play[2].to_i
    row -= 1
    col -= 1
    if row < -1 || row > 3 || col < -1 || col > 3
      puts '======================================='
      puts '----------- Invalid entry -------------'
      puts '======================================='
      next
    end
    # Validate move function here
    for i in 0..2 do
      for j in 0..2 do
        if i == row && j == col && "#{grid[i][j]}" == ' '
          grid[i][j] = 'X'
        end
      end
    end
    # Validate win lose or draw function here
    break if game_over
  end
  puts "\n\nWanna play again? <n> to decline"
  decision = gets.chomp.upcase
  break if decision == 'N'
end
