$:.push File.expand_path("..", __FILE__)
#require 'util'
#require File.expand_path('../util', __FILE__)
#require '/Users/sean/dev/gems/gem_with_extension_example/lib/gem_with_extension_example/util.rb'

class Timer
  # ToDo
  # Mode Flags:
  #   :side_by_side (on by default)
  #   :consecutive_runs (using redis)(off by default)

  DIGITS_OF_PRESCISION = 6
  @@max_name_length = 0
  @@max_whole_digits = 1
  @@timer_list = []
  @@mode = :side_by_side
  attr_reader :elapsed

  #private :digits, :update_digit_count

  def initialize(name)
    @name = name
    clear
    @@max_name_length = name.length if name.length > @@max_name_length
    @@timer_list << self
  end
  class << self
    def set_mode(mode)
      @@mode = mode #:side_by_side, :simple
    end
    def to_s
      # Process pair comparison
      pair_comparison = @@timer_list.count == 2
      speed_multiple = nil
      greater_index = nil
      if pair_comparison
        if @@timer_list[0].elapsed > @@timer_list[1].elapsed
          greater_index = 1
          speed_multiple = @@timer_list[0].elapsed / @@timer_list[1].elapsed
        else
          greater_index = 0
          speed_multiple = @@timer_list[1].elapsed / @@timer_list[0].elapsed
        end
      end
      total_time = @@timer_list.inject(0.0) { |result, t| result + t.elapsed }

      # construct output string
      s = ""
      @@timer_list.each_with_index do |t, i|
        s << t.to_s
        s << "%8.3f%s" % [((t.elapsed) / total_time * 100.0), '%'] if @@timer_list.count > 1
        if pair_comparison and (@@mode == :side_by_side) and (i == greater_index)
          s << ", %.1f times faster." % speed_multiple
        end
        s << "\n"
      end
      if !(@@mode == :side_by_side and pair_comparison) and @@timer_list.count > 1
        total_whole_digits = digits(total_time.to_i)
        digit_overflow = total_whole_digits - @@max_whole_digits
        leading_spaces = (@@max_name_length + 2) - digit_overflow

        s << (" " * (@@max_name_length + 2))
        s << ("-" * (DIGITS_OF_PRESCISION + @@max_whole_digits + 2))
        s << "\n"
        s << (" " * leading_spaces) if leading_spaces > 0
        s << "%#{DIGITS_OF_PRESCISION + total_whole_digits + 1}.#{DIGITS_OF_PRESCISION}fs" % total_time
        s << "\n"
      end
      s
    end
    def digits(n)
      if n > 9
        d = Math.log10(n).to_i + 1
      elsif n < -9
        d = Math.log10(n * -1).to_i + 1
      else
        d = 1
      end
      d
    end
  end
  def clear
    @state = :stopped
    @time = []
    @elapsed = 0.0
  end
  def self.clear
    @@max_name_length = 0
    @@max_whole_digits = 1
    @@timer_list = []
  end
  def digits(n)
    self.class.digits(n)
  end
  def update_digit_count
    whole_digits = digits(@elapsed.to_i)
    @@max_whole_digits = whole_digits if whole_digits > @@max_whole_digits
  end
  def to_s
     "% #{@@max_name_length}s: %#{DIGITS_OF_PRESCISION + @@max_whole_digits + 1}.#{DIGITS_OF_PRESCISION}fs" % [@name, @elapsed]
  end
  def +(o)
    o = o.elapsed if o.is_a?(self.class)
    @elapsed += o
    update_digit_count
  end
  def /(o)
    o = o.elapsed if o.is_a?(self.class)
    @elapsed /= o
    update_digit_count
  end
  def start
    if @state == :stopped
      @state = :running
      @start = Time.now
    end
  end
  def stop
    if @state == :running
      stop = Time.now
      @elapsed += (stop - @start)
      update_digit_count
      @state = :stopped
    end
  end
end

if __FILE__ == $0
  #Timer.set_mode(:simple)
  19.times do
    test_count = Random.rand(4) + 1
    timer_list = []

    # Allocate Timers
    test_count.times do |n|
      timer_name = ("A".ord + n).chr
      timer_list[n] = Timer.new(timer_name)
    end

    # Use Timers
    test_count.times do |n|
      timer_list[n].start
      timer_list[n].stop
      timer_list[n] += Random.rand * 133 # fake out the timer
    end

    # Show Timers
    puts ""
    puts Timer
    Timer.clear
  end
end

















