# encoding: utf-8
$:.push File.expand_path("../../lib", __FILE__)

require 'gem_with_extension_example'
include GemWithExtensionExample

ruby_timer = Timer.new("Ruby")
c_timer = Timer.new("C")

width = 165
height = 49

puts "\nMandelbrot Set:"
x0, y0 = -2.6, 2.0
x1, y1 = 1.6, -y0

grid = Grid.new(width,height)
grid.fill_complex(x0, y0, x1, y1)

ruby_timer.start
PlotFractal.mandelbrot(grid)
ruby_timer.stop

c_timer.start
PlotFractal.mandelbrot_C(grid)
c_timer.stop

puts "\nJulia Set:"

x0, y0= -2.27, 1.87
x1, y1 = -x0, -y0

grid.fill_complex(x0, y0, x1, y1)

ruby_timer.start
PlotFractal.julia(grid)
ruby_timer.stop

c_timer.start
PlotFractal.julia_C(grid)
c_timer.stop

puts Timer



































