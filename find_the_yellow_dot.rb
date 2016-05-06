#!/usr/bin/ruby

require 'ev3dev'

col   = Ev3dev::Sensor.new 3
col.mode 'COL-COLOR'

lm_b = Ev3dev::Motor.new 'B'
lm_c = Ev3dev::Motor.new 'C'

lm_b.duty_cycle_sp 30
lm_c.duty_cycle_sp 30

state = :finding_red

while state != :found_red
  if red?
    state = :found_red
  else
    lm_b.command 'run-forever'
    lm_c.command 'run-forever'
  end
end

# turn_left()


lm_b.command 'stop'
lm_c.command 'stop'

def turn_left(degree)
  magic_value = degree * 1

  lm_b.duty_cycle_sp -50
  lm_b.time_sp 2000

  lm_c.duty_cycle_sp -50
  lm_c.time_sp 2000

  lm_b.command 'run-timed'
  lm_c.command 'run-timed'
  sleep 4
end

def red?
  col.value0.to_i == 5
end

def yellow?
  col.value0.to_i == 4
end
