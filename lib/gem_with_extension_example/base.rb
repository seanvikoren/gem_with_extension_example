# encoding: utf-8
$:.push File.expand_path("..", __FILE__)

require "version"
require 'complex'

# C extensions
#require "infinity_check_c"
include InfinityCheckC

module GemWithExtensionExample
  class PlotFractal
    PRETTY_PLOT = false

    if PRETTY_PLOT
      MAX_ITERATION_COUNT = 10
    else
      MAX_ITERATION_COUNT = 10000
    end

    DIVERGE_LIMIT = 4.0
    DIVERGE_LIMIT_SQUARED = DIVERGE_LIMIT * DIVERGE_LIMIT

    CLASSIC_JULIA_SET = Complex(-1.0,-0.25)

    if PRETTY_PLOT
      MAP_SET = " ·::++++xxxxxx "
    else
      MAP_SET = " · "
    end

    def self.mandelbrot(grid)
      (0...grid.height).each do |y|
        (0...grid.width).each do |x|
          z = grid[x,y]
          count = infinity_check_ruby(MAX_ITERATION_COUNT, z, z)
          print get_render_character(count)
        end
        puts ""
      end
    end
    def self.mandelbrot_C(grid)
      (0...grid.height).each do |y|
        (0...grid.width).each do |x|
          z = grid[x,y]
          i = z.imaginary
          r = z.real
          count = infinity_check_c(MAX_ITERATION_COUNT, r, i, r, i)
          print get_render_character(count)
        end
        puts ""
      end
    end
    def self.julia(grid)
      (0...grid.height).each do |y|
        (0...grid.width).each do |x|
          z = grid[x,y]
          i = infinity_check_ruby(MAX_ITERATION_COUNT, CLASSIC_JULIA_SET, z)
          print get_render_character(i)
        end
        puts ""
      end
    end
    def self.julia_C(grid)
      (0...grid.height).each do |y|
        (0...grid.width).each do |x|
          z = grid[x,y]
          count = infinity_check_c(MAX_ITERATION_COUNT, CLASSIC_JULIA_SET.real, CLASSIC_JULIA_SET.imaginary, z.real, z.imaginary)
          print get_render_character(count)
        end
        puts ""
      end
    end

    private
    @@lookup = []

    def self.build_lookup
      limit = MAX_ITERATION_COUNT
      step = Float(MAX_ITERATION_COUNT) / MAP_SET.length
      MAP_SET.length.times do
        @@lookup << Integer(limit)
        limit -= step
      end
    end

    self.build_lookup # populate limit table

    def self.get_render_character(a)
      c = nil
      i = 0
      a = MAX_ITERATION_COUNT - a
      @@lookup.each do |limit|
        c = MAP_SET[i]
        i += 1
        break if a > limit
      end
      return c
    end

    def self.infinity_check_ruby(limit, c, z)
      i = -1
      limit.times do
        z = z * z + c
        break if z.abs > DIVERGE_LIMIT
        i += 1
      end
      return i
    end
  end
end