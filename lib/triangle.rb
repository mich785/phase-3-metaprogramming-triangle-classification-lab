class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle

    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c 
      :isosceles
    else 
      :scalene
    end
  end
  
  private

  def validate_triangle
    sides = [a, b, c]
    valid_triangle = sides.all? { |side| side > 0 }
    valid_triangle &&= (a + b > c) && (b + c > a) && (a + c > b)

    raise TriangleError  unless valid_triangle
  end

  class TriangleError < StandardError
  end
end
