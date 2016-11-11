require 'ev3dev'

class ColorSensor
  attr_reader :color_sensor

  COLORS = {
    '1' => 'Black',
    '2' => 'Blue',
    '3' => 'Green',
    '4' => 'Yellow',
    '5' => 'Red',
    '6' => 'White',
    '7' => 'Brown'
  }.freeze

  def initialize
    @color_sensor = Ev3dev::Sensor.new 3
    color_sensor.mode 'COL-COLOR'
  end

  def current_color
    COLORS[color_sensor.value0]
  end
end
