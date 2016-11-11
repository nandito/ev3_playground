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
  end

  def previous
  end
end
