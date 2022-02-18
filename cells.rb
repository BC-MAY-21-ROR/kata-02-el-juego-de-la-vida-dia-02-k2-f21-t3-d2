# frozen_string_literal: true

require 'matrix'
class Cell
  def initialize(grid)
    @grid = grid
  end

  def generate_cells
    @grid.to_a.each.with_index do |row, ri|
      row.each.with_index do |_colum, ci|
        @grid[ri, ci] = (rand(0...100) > 80 ? 1 : 0)
      end
    end
  end
  
  def lives_or_dies
    neighbours = count_neighbors
    @grid.to_a.size.times do |i|
      @grid.to_a[0].size.times do |j|
        if neighbours[i, j] < 2 || neighbours[i, j] > 3
          @grid[i, j] = 0
        elsif neighbours[i, j] == 3
          @grid[i, j] = 1
        end
      end
    end
  end

  private
  def count_neighbors
    neighbours = Matrix.build(@grid.to_a.size, @grid.to_a[0].size) { 0 }
    @grid.to_a.size.times do |i|
      @grid.to_a[0].size.times do |j|
        neighbours[i, j] += @grid[i - 1, j - 1] unless i.zero? || j.zero?
        neighbours[i, j] += @grid[i - 1, j] unless i.zero?
        neighbours[i, j] += @grid[i - 1, j + 1] unless j == @grid.to_a[0].size - 1 || i.zero?
        neighbours[i, j] += @grid[i, j - 1] unless j.zero?
        neighbours[i, j] += @grid[i, j + 1] unless j == @grid.to_a[0].size - 1
        neighbours[i, j] += @grid[i + 1, j - 1] unless i == @grid.to_a.size - 1 || j.zero?
        neighbours[i, j] += @grid[i + 1, j] unless i == @grid.to_a.size - 1
        neighbours[i, j] += @grid[i + 1, j + 1] unless i == @grid.to_a.size - 1 || j == @grid.to_a[0].size - 1
      end
    end
    neighbours
  end
end
