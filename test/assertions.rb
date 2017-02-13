def assert(expression, message='Assertion failed!')
  if expression
    return true
  else
    raise message
  end
end

def assert_equal(l, r, message='Not equal!')
  if l == r
    return true
  else
    raise message
  end
end

def assert_nil(expression, message='Not nil!')
  if expression.nil?
    return true
  else
    raise message
  end
end

def assert_includes(haystack, needle, message='Doesn\'t include!')
  if haystack.include? needle
    return true
  else
    raise message
  end
end
