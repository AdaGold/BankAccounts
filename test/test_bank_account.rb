require_relative 'assertions'

puts 'TEST: True should be true'
assert true, 'Should not appear'

puts 'TEST: 2 plus 2 should be 4'
assert_equal 2+2, 4, 'Should not appear'

puts 'TEST: nil should be nil'
assert_nil nil, 'Should not appear'

puts 'TEST: array includes'
assert_includes [1, 2, 3], 2, 'Should not appear'

puts 'TEST: false should be true'
assert false, 'Should be an exception!'
