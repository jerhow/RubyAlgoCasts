# // --- Directions
# // Implement a Queue data structure using two stacks.
# // *Do not* create an array inside of the 'Queue' class.
# // Queue should implement the methods 'add', 'remove', and 'peek'.
# // For a reminder on what each method does, look back
# // at the Queue exercise.
# // --- Examples
# //     const q = new Queue();
# //     q.add(1);
# //     q.add(2);
# //     q.peek();  // returns 1
# //     q.remove(); // returns 1
# //     q.remove(); // returns 2

class Stack
  # A normal stack

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

class MyQueue
  # This is a queue implemented with two stacks

  def initialize
    @stack1 = Stack.new
    @stack2 = Stack.new
  end

  def add(item)
    @stack1.push(item)
  end

  def remove
    # Since stacks are FILO, if you empty stack1 into stack2,
    # stack2 will have the items in the reverse order:
    while @stack1.peek
      @stack2.push(@stack1.pop)
    end

    # ...which means you can pop stack2 and get the first item
    # added to this queue, which is the value we want:
    result = @stack2.pop

    # You must then rebuild stack1 by emptying stack 2 into it,
    # and thus restoring the correct order:
    while @stack2.peek
      @stack1.push(@stack2.pop)
    end

    result
  end

  def peek
    # This is just like remove(), except instead of popping
    # the value off of stack2, we just peek() it so that it
    # remains intact:
    while @stack1.peek
      @stack2.push(@stack1.pop)
    end

    result = @stack2.peek

    # ...and then we reassemble stack1 so that our data
    # remains the same and we're ready for the next operation:
    while @stack2.peek
      @stack1.push(@stack2.pop)
    end

    result
  end
end

# Per the instructions given:
q = MyQueue.new
q.add(1)
q.add(2)
p q.peek # returns 1
p q.remove # returns 1
p q.remove # returns 2
