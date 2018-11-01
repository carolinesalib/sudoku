require 'matrix'

class Sudoku
  def self.valid?(sudoku)
    sudoku_transpose = Matrix[*sudoku].transpose.to_a
    check_matrix(sudoku) && check_matrix(sudoku_transpose) && check_block(sudoku)
  end

  def self.check_matrix(matrix)
    matrix.each do |line_numbers|
      missing_numbers = sudoku_numbers - line_numbers
      return false unless missing_numbers.empty?
    end

    true
  end

  def self.sudoku_numbers
    (1..9).to_a
  end

  def self.check_block(matrix)
    block_matrix = []

    [0, 3, 6].each do |i|
      [0, 3, 6].each do |y|
        temp_matrix = []
        temp_matrix.concat matrix[i].slice(y, 3)
        temp_matrix.concat matrix[i + 1].slice(y, 3)
        temp_matrix.concat matrix[i + 2].slice(y, 3)

        block_matrix << temp_matrix
      end
    end

    check_matrix(block_matrix)
  end
end
