require './motor'
require './color_sensor'

class LegoArray
  attr_reader :motor, :color_sensor, :array, :current_position

  def initialize(array, starting_position)
    @motor = Motor.new
    @color_sensor = ColorSensor.new
    @array = array
    @current_position = starting_position
  end

  def next_position
    while color_sensor.current_color != 'White'
      motor.move_forward
    end

    while color_sensor.current_color != 'Black'
      motor.move_forward
    end
  end

  def previous_position
    while color_sensor.current_color != 'White'
      motor.move_backward
    end

    while color_sensor.current_color != 'Black'
      motor.move_backward
    end
  end

  def go_to_tmp
  end

  def go_to(target_position)
    return go_to_tmp if target_position == -1

    unless array[target_position].nil?
      # move forward
      if current_position < target_position
        steps = if current_position == -1
                  target_position + 1
                else
                  target_position - current_position
                end

        steps.times do
          next_position
        end
        current_position = target_position
      # stay there
      elsif current_position == target_position
        return false
      # move backward
      else
        steps = current_position - target_position
        steps.times do
          previous_position
        end
        current_position = target_position
      end

    else
      return false
    end
  end

end
