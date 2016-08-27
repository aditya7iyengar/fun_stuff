# log a (b) = x => a^x = b
# log 2 (18) = x
# a & b, where 2^a < 18 < 2^b a = 4, b = 5 ; c = 4.5
# 2^4.5 = 2^4 * 2^0.5 = 16 * 1.414 ~ 23,
# a = 4, b = 4.5; c = 4.25
# 2^4.25
# 20
# 2^4 = 2**4

base = ARGV[0].to_i
number = ARGV[1].to_i

exponent = 0
found = false
a = 0
b = 0
answer = nil

while !found do
  if base**exponent == number
    found = true
    answer = exponent
  elsif base**exponent < number && base**(exponent + 1) > number
    found = true
    a = exponent
    b = exponent + 1
  end

  exponent = exponent + 1
end

i = 0

while i < 200 && !answer do
  c = (a.to_f + b.to_f)/2
  if base**c > number
    b = c
  elsif base**c < number
    a = c
  else base**c == number
    answer = c
  end

  i = i + 1
end

if answer
  puts answer
else
  puts c
end

