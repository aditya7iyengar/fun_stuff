number = 916748676920039158098660927585380162483106680144308622407126516427934657040867096593279205767480806790022783016354924852380335745316935111903596577547340075681688305620821016129132845564805780158806771
root = 23

length = 2**root.to_s.length

a = 1
text = ''

count = 0

while count < length do
  text << 9
end

b = text.to_i

i = 0

while i < 20 && !answer do
  c = (a + b)/2

  if c**root > number
    b = c
  elsif c**root < number
    a = c
  else c**root == number
    answer = c
  end

  i = i + 1
end

if answer
  puts answer
else
  puts c
end

