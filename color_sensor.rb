require 'ev3dev'

class ColorSensor

  attr_reader :color_sensor
  def initialize
    @color_sensor =  Ev3dev::Sensor.new 3
    color_sensor.mode 'COL-COLOR'
  end

  def get_color
    color_num = color_sensor.value0.to_i
      case color_num
      when 1
        'Black'
      when 2
        'Blue'
      when 3
        'Green'
      when 4
        'Yellow'
      when 5
        'Red'
      when 6
        'White'
      when 7
        'Brown'
      end
  end
end