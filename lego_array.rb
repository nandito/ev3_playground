require './motor'
require './color_sensor'

class LegoArray
  attr_reader :motor, :color_sensor, :array

  def initialize(array)
    @motor = Motor.new
    @color_sensor = ColorSensor.new
    @array = array
  end

  def next
    while @color_sensor.current_color != 'White'
      @motor.move_forward
    end

    while @color_sensor.current_color != 'Black'
      @motor.move_forward
    end
  end

  def previous
    while @color_sensor.current_color != 'White'
      @motor.move_backward
    end

    while @color_sensor.current_color != 'Black'
      @motor.move_backward
    end
  end
end
