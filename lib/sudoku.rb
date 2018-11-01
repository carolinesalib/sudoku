require 'matrix'

class Sudoku
  def self.valid?(sudoku)
    sudoku_transpose = Matrix[*sudoku].transpose.to_a
    check_matrix(sudoku) && check_matrix(sudoku_transpose)
  end

  def self.check_matrix(sudoku)
    sudoku.each do |line_numbers|
      missing_numbers = sudoku_numbers - line_numbers
      return false unless missing_numbers.empty?
    end

    true
  end

  def self.sudoku_numbers
    (1..9).to_a
  end
end
