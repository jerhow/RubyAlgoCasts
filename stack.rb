# // --- Directions
# // Create a stack data structure.  The stack
# // should be a class with methods 'push', 'pop', and
# // 'peek'.  Adding an element to the stack should
# // store it until it is removed.
# // --- Examples
# //   const s = new Stack();
# //   s.push(1);
# //   s.push(2);
# //   s.pop(); // returns 2
# //   s.pop(); // returns 1

class Stack
  def initialize
    @arr = []
  end

  def push(item)
    @arr.append(item)
  end

  def pop
    @arr.pop
  end

  def peek
    @arr[-1]
  end
end

s = Stack.new
s.push(1)
s.push(2)
p s.pop() # returns 2
p s.pop() # returns 1
