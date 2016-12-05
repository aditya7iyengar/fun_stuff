# ------------------------------------------------------------------------
# Factorial
# ------------------------------------------------------------------------

# Regular recursive: factorial_recursive(5) = 120
def factorial_recursive(n)
  n <= 2 ?  n : n * factorial_recursive(n - 1)
end

# Lambda: factorial_lambda.call(5) = 120
factorial_lambda = lambda { |n|
  n <= 2 ?  n : n * factorial_lambda.call(n - 1)
}

# Double Lambda: factorial_double_lambda.call(factorial_double_lambda).call(5) = 120
factorial_double_lambda = lambda { |fac|
  lambda { |n|
    n <= 2 ?  n : n * fac.call(fac).call(n - 1)
  }
}

# Extract inner lambda into H: H.call(factorial_with_H).call(5) = 120
H = lambda { |fac|
  lambda { |n|
    n <= 2 ?  n : n * fac.call(fac).call(n - 1)
  }
}

factorial_with_H = lambda { |f|
  H.call(f)
}

# In mathematics, this is called a fixpoint. We pass an argument to a function and the result is that argument.
# Here the argument is the factorial function. It could just be a number; for example, zero and
# one are fixpoints of x = x ^2 (x squared). In lambda calculus speak, when H is applied to factorial
# the result is factorial. Or, calling H with argument factorial returns factorial. factorial is a fixpoint of H.
# H.call(factorial_with_H).call(5)

# ------------------------------------------------------------------------
# FizzBuzz
# ------------------------------------------------------------------------

# FizzBuzz
def fizzbuzzfoo(n)
  if n % 6 == 0
    puts 'buzz'
  elsif n % 3 == 0
    puts 'fizz'
  elsif n % 5 == 0
    puts 'foo'
  else
    puts n
  end
end

# Regular recursive: fizzbuzzfoo_recursive(12)
def fizzbuzzfoo_recursive(x)
  return if x == 0
  fizzbuzzfoo_recursive(x - 1)
  fizzbuzzfoo(x)
end
puts 'fizzbuzzfoo_recursive(12)'
fizzbuzzfoo_recursive(12)

# Using Lambda: fizzbuzzfoo_lambda.call(12)
fizzbuzzfoo_lambda = lambda { |n|
  n <= 0 ?  nil : (fizzbuzzfoo_lambda.call(n - 1); fizzbuzzfoo(n))
}

puts 'fizzbuzzfoo_lambda.call(12)'
fizzbuzzfoo_lambda.call(12)

# Double lambda to eliminate recursive call:
fizzbuzzfoo_double_lambda = lambda { |fbf|
  lambda { |n|
    n <= 0 ?  nil : (fbf.call(fbf).call(n - 1); fizzbuzzfoo(n))
  }
}

puts 'fizzbuzzfoo_double_lambda.call(fizzbuzzfoo_double_lambda).call(12)'
fizzbuzzfoo_double_lambda.call(fizzbuzzfoo_double_lambda).call(12)

# Extract inner lambda into I: I.call(fizzbuzzfoo_with_I).call(12)
I = lambda { |fbf|
  lambda { |n|
    n <= 0 ?  nil : (fbf.call(fbf).call(n - 1); fizzbuzzfoo(n))
  }
}

fizzbuzzfoo_with_I = lambda { |f|
  I.call(f)
}

puts 'I.call(fizzbuzzfoo_with_I).call(12)'
I.call(fizzbuzzfoo_with_I).call(12)
