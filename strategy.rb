require './lego_array'

lego_array = LegoArray.new([6,7,4,47], -1)

lego_array.next_position
lego_array.previous_position

lego_array.go_to(-1)
lego_array.go_to(1)
lego_array.go_to(2)
lego_array.go_to(0)
lego_array.go_to(3)
lego_array.go_to(4)
