require 'complex'

class Grid
  attr_reader :width, :height

  def initialize(width, height, default_value = nil)
    @width = width
    @height = height
    @default_value = default_value
    @grid = create(width, height, default_value)
  end

  def [](x,y)
    if (x < 0 or x >= @width) or (y < 0 or y >= @height)
      throw Error("Grid index out of bounds. [%d][%d] not in range ([0 through %d][0 through %d])" % [x, y, width - 1, height - 1])
    end
    @grid[x][y]
  end

  def []=(x,y,a)
    if (x < 0 or x >= @width) or (y < 0 or y >= @height)
      throw Error("Grid index out of bounds. [%d][%d] not in range ([0 through %d][0 through %d])" % [x, y, width - 1, height - 1])
    end
    @grid[x][y] = a
  end

  def clear(value=nil)
    (0...@width).each do |xi|
      (0...@height).each do |yi|
        @grid[xi][yi] = value
      end
    end
  end

  def to_s
    s = ""
    @grid.each{|c| s << c.to_s << "\n"}
    return s
  end

  def each_col
    @grid.each{|c| yield c.dup}
  end

  def each
    @grid.each do |c|
      c.each{|i| yield i}
    end
  end

  # Generate a two dimensional grid of float pairs, evenly
  # distributed across width x height samples
  # ranging from x0 to x1 and y0 to y1
  def fill_complex(x0, y0, x1, y1)
    x_range = x1 - x0
    y_range = y1 - y0

    width_limit = Float(@width - 1)
    height_limit = Float(@height - 1)

    (0...@width).each do |xi|
      x_unit = Float(xi) / width_limit
      x = x0 + (x_unit * x_range)

      (0...@height).each do |yi|
        y_unit = Float(yi) / height_limit
        y = y0 + (y_unit * y_range)
        @grid[xi][yi] = Complex(x,y)
        #@grid[xi][yi] = [x,y]
      end
    end
  end

  def fill_test()
    t = 0
    @grid.each_with_index do |c, x|
      c.each_with_index{|i, y| @grid[x][y] = t; t += 1}
    end
  end

  #------------------------------------------
  private

  def create(width, height, default_value)
    grid = Array.new(width){[]}
    (0...width).each do |xi|
      grid[xi] = Array.new(height, default_value)
    end
    return grid
  end

end

RUN_TEST = false

if RUN_TEST
  grid = Grid.new(4, 5, [0.0,0.0])

  puts "-" * 9
  p grid

  puts "-" * 9
  p grid[0,0]
  p grid[1,1]

  puts "-" * 9
  grid[0,0] = [5.0,2.0]
  grid[1,1] = [7.0,9.0]

  p grid[0,0]
  p grid[1,1]

  puts "-" * 9
  p grid

  puts "-" * 9
  grid.fill_complex(-2.0, -1.0, 1.0, 1.0)
  puts "-" * 9
  p grid

  grid.clear(0)
  puts "-" * 9
  p grid

  grid.fill_test
  puts "-" * 9
  p grid

  puts "-" * 9
  grid.each{|c| p c}

  puts "-" * 9
  grid.each_col{|c| p c}

  puts "-" * 9
  p grid

end








































