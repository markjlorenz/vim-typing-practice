hash = {one: 1, two: 2, three: 3}
hash = {one: 1, two: 2, three: 3}

array = [1, 2, 3, 4]
array = [1, 2, 3, 4]

array.map {|ele| ele.to_s }
array.map {|ele| ele.to_s }
array.map {|ele| ele.to_s }
array.map {|ele| ele.to_s }

block = ->(*args) { puts hash[:one] }
block = ->(*args) { puts hash[:one] }
block = ->(*args) { puts hash[:one] }

array.map(&block)
array.map(&block)
array.map(&block)

# on <cr>, diff the typed buffer with the control buffer
# if they are not == pulse red background and delete the last last of the type buffer
