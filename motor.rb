require 'ev3dev'

class Motor
  attr_reader :motor_right, :motor_left
  
  def initialize 
    @motor_right = Ev3dev::Motor.new 'B'
    @motor_left = Ev3dev::Motor.new 'C'
  end

  def move_forward
    motor_right.stop_command 'brake'
    motor_right.duty_cycle_sp 30
    motor_right.time_sp 100

    motor_left.stop_command 'brake'
    motor_left.duty_cycle_sp 30
    motor_left.time_sp 100

    motor_right.command 'run-timed'
    motor_left.command 'run-timed'

    sleep 0.1
  end

    def move_backward
    motor_right.stop_command 'brake'
    motor_right.duty_cycle_sp -30
    motor_right.time_sp 100

    motor_left.stop_command 'brake'
    motor_left.duty_cycle_sp -30
    motor_left.time_sp 100

    motor_right.command 'run-timed'
    motor_left.command 'run-timed'

    sleep 0.1
  end

  def rotate_left
    motor_right.command 'reset'
    motor_left.command 'reset'

    motor_right.stop_command 'brake'
    motor_right.position_sp 90
    motor_right.duty_cycle_sp 60

    motor_left.stop_command 'brake'
    motor_left.position_sp -90
    motor_left.duty_cycle_sp 60

    motor_right.command 'run-to-rel-pos'
    motor_left.command 'run-to-rel-pos'
    
    sleep 0.1
  end

  def turn_left
    motor_right.stop_command 'brake'
    motor_right.duty_cycle_sp 30
    motor_right.time_sp 100

    motor_right.command 'run-timed'

    sleep 0.1
  end
end