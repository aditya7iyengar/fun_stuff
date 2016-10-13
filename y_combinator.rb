# Factorial

# Regular recursive: factorial_recursive(5) = 120
def factorial_recursive(n)
  n <= 2 ?  n :n * factorial_recursive(n - 1)
end

# Lambda: factorial_lambda.call(5) = 120
factorial_lambda = lambda { |n|
  n <= 2 ?  n :n * factorial_lambda.call(n - 1)
}

# Double Lambda: factorial_double_lambda.call(factorial_double_lambda).call(5) = 120
factorial_double_lambda = lambda { |fac|
  lambda { |n|
    n <= 2 ?  n :n * fac.call(fac).call(n - 1)
  }

}

