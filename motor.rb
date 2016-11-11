require 'ev3dev'

# This is a wrapper class for the robot wheels transformations
class Motor
  attr_reader :motor_right, :motor_left

  def initialize
    @motor_right = Ev3dev::Motor.new 'B'
    @motor_left = Ev3dev::Motor.new 'C'
  end

  def move_forward
    move_motor(motor_right, 30, 100)
    move_motor(motor_left, 30, 100)
    motor_left.command 'run-timed'
    motor_right.command 'run-timed'
    sleep 0.1
  end

  def move_backward
    move_motor(motor_right, -30, 100)
    move_motor(motor_left, -30, 100)
    motor_left.command 'run-timed'
    motor_right.command 'run-timed'
    sleep 0.1
  end

  def rotate_left
    motor_left.command 'reset'
    motor_right.command 'reset'
    move_motor(motor_right, 90, 60)
    move_motor(motor_left, -90, 60)
    motor_left.command 'run-to-rel-pos'
    motor_right.command 'run-to-rel-pos'
    sleep 0.1
  end

  def turn_left
    move_motor(motor_right, 30, 100)
    motor_right.command 'run-timed'

    sleep 0.1
  end

  private

  def move_motor(motor, duty_cycle_sp, time_sp)
    motor.stop_command 'brake'
    motor.duty_cycle_sp duty_cycle_sp
    motor.time_sp time_sp
  end
end
