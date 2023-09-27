### PARTE 01 ###

def sum(arr)
  suma = 0
  arr.each { |x| suma += x }
  suma
end

def max_2_sum(arr)
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  arr.sort! { |a,b| b <=> a }
  arr[0] + arr[1]
end

def sum_to_n?(arr, n) # O(n log n)
  return false if arr.empty?
  v = arr.sort! # arreglo sobre el cual se hara el BS
  arr.each do |x|
    v.shift
    target = n - x # valor a buscar
    result = v.bsearch { |y| y >= target }
    return true if target == result
  end
  false
end

### PARTE 02 ###

def hello(name)
  "Hello, " + name
end

def starts_with_consonant?(s)
  return false if s.empty?
  regexp = /[bcdfghjklmnñpqrstvwxyz]/i
  s[0].match?(regexp)
end

def binary_multiple_of_4?(s)
  return false unless s =~ /^[01]+/
  s =~ /00\z/ || s == '0'
end


### PARTE 03 ###

class BookInStock
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    return raise ArgumentError if isbn.empty? || price <= 0
    @isbn = isbn
    @price = price
  end

  def price_as_string
    format("$%.2f", @price)
  end

end