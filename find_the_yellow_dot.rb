#!/usr/bin/ruby

require 'ev3dev'

module Ev3Common
  def stop
    lm_b.command 'stop'
    lm_c.command 'stop'
  end

  def red?
    col.value0.to_i == 5
  end

  def yellow?
    col.value0.to_i == 4
  end

  def white?
    col.value0.to_i == 6
  end
end

class FindTheYellowDot
  include Ev3Common
  attr_reader :col, :lm_b, :lm_c

  def initialize
    @col   = Ev3dev::Sensor.new 3
    @col.mode 'COL-COLOR'

    @lm_b = Ev3dev::Motor.new 'B'
    @lm_c = Ev3dev::Motor.new 'C'

    lm_b.duty_cycle_sp 70
    lm_c.duty_cycle_sp 70
  end

  def start
    run_until_not_yellow
    p 'celebrate'
    stop
    celebrate
  end

  def run_until_not_yellow
    while !yellow?
      if white?
        lm_b.command 'run-forever'
        lm_c.command 'run-forever'
      else
        if rand(3) == 1
          turn_left(rand(800)+200)
        else
          turn_right(rand(800)+200)
        end
      end
      sleep 0.1
    end
  end

  def turn_left(degree)
    magic_value = degree * 1

    lm_b.duty_cycle_sp 70
    lm_b.time_sp magic_value

    lm_c.duty_cycle_sp -70
    lm_c.time_sp magic_value

    lm_b.command 'run-timed'
    lm_c.command 'run-timed'

    sleep magic_value / 1000
    lm_c.duty_cycle_sp 70 # reset
  end

  def turn_right(degree)
    magic_value = degree * 1

    lm_b.duty_cycle_sp -70
    lm_b.time_sp magic_value

    lm_c.duty_cycle_sp 70
    lm_c.time_sp magic_value

    lm_b.command 'run-timed'
    lm_c.command 'run-timed'

    sleep magic_value / 1000
    lm_b.duty_cycle_sp 70 # reset
  end

  def celebrate
    sound = Ev3dev::Sound.new
    sound.volume 10
    sound.mpg123 'eye_of_the_tiger.mp3'
    sleep 10
  end
end

# app = FindTheYellowDot.new
# app.start
