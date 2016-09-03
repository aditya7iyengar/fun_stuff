max = 1000

i = 100

array = []
numbers_array = []

while i <= max do

  j = 0
  while j <= max do

    k = 0
    while k <= max do

      l = 0
      while l <= max do

        cube = (i**3 + j**3)

        if (cube == (k**3 + l**3)) && !((i == k && j == l) || (i == l && j == k))
          if !(numbers_array.include?(cube))
            numbers_array << cube

            array << {
              numbers: {
                i: i,
                j: j,
                k: k,
                l: l,
              },
              unique_number: cube,
            }
          end
        end

        l += 1
      end

      k += 1
    end

    j += 1
  end

  i += 1
end

array.each do |array_element|
  cube = array_element[:unique_number]
  i = array_element[:numbers][:i]
  j = array_element[:numbers][:j]
  k = array_element[:numbers][:k]
  l = array_element[:numbers][:l]

  puts "number: #{cube}"
  puts "pairs: (#{i}, + #{j}), (#{k}, + #{l})"
  puts "-----------------------------------------"
end
