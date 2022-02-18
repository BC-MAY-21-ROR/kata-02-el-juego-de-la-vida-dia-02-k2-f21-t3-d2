# frozen_string_literal: true

require './grid'
require './cells'

puts 'Please type the numbers of rows'
row = gets.to_i
puts 'Please type the numbers of columns'
column = gets.to_i

@generation_num = 0

@grid = Grid.new(row, column)
@cell = Cell.new(@grid.matrix)
@cell.generate_cells

def loop
  puts "Generation: #{@generation_num += 1}"
  @grid.show
  @cell.lives_or_dies
  if gets.chomp.empty? && !@grid.matrix.sum.zero?
    loop
  else
    puts "Generation: #{@generation_num += 1}"
    @grid.show
  end
end

loop
