# // --- Description
# // Create a queue data structure.  The queue
# // should be a class with methods 'add' and 'remove'.
# // Adding to the queue should store an element until
# // it is removed
# // --- Examples
# //     const q = new Queue();
# //     q.add(1);
# //     q.remove(); // returns 1;

class MyQueue
  def initialize
    @arr = []
  end

  def add(item)
    @arr.unshift(item)
  end

  def remove
    @arr.pop
  end

  def peek
    @arr.last # or @arr[-1]
  end

  def all
    @arr
  end
end

q = MyQueue.new
q.add("cat")
q.add("dog")
q.add("pig")
p q.remove
q.add("cow")
p q.all
p q.remove
q.add("goat")
p q.remove
p q.peek
p q.all
