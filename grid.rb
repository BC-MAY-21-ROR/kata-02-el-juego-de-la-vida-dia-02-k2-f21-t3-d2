# frozen_string_literal: true

require 'matrix'
# makes a grid
class Grid
  attr_accessor :row, :col, :matrix

  def initialize(row, col)
    @row = row
    @col = col
    @matrix = Matrix.build(row, col) { 0 }
  end

  def show
    @row.times do |i|
      @col.times do |j|
        if @matrix[i, j] == 1
          print '*'
        else
          print '.'
        end
      end
      puts 
    end
    puts 
  end
end
