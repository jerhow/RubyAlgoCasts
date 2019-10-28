# // --- Directions
# // 1) Complete the task in weave/queue.js
# // 2) Implement the 'weave' function.  Weave
# // receives two queues as arguments and combines the
# // contents of each into a new, third queue.
# // The third queue should contain the *alterating* content
# // of the two queues.  The function should handle
# // queues of different lengths without inserting
# // 'undefined' into the new one.
# // *Do not* access the array inside of any queue, only
# // use the 'add', 'remove', and 'peek' functions.
# // --- Example
# //    const queueOne = new Queue();
# //    queueOne.add(1);
# //    queueOne.add(2);
# //    const queueTwo = new Queue();
# //    queueTwo.add('Hi');
# //    queueTwo.add('There');
# //    const q = weave(queueOne, queueTwo);
# //    q.remove() // 1
# //    q.remove() // 'Hi'
# //    q.remove() // 2
# //    q.remove() // 'There'

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
    @arr[-1]
  end
end

def weave(source_one, source_two)
  result = MyQueue.new

  while source_one.peek || source_two.peek
    result.add(source_one.remove) if source_one.peek
    result.add(source_two.remove) if source_two.peek
  end

  result
end

# Per the instructions given:
queue_one = MyQueue.new
queue_one.add(1)
queue_one.add(2)
queue_two = MyQueue.new
queue_two.add('Hi')
queue_two.add('There')
q = weave(queue_one, queue_two)
p q.remove # 1
p q.remove # 'Hi'
p q.remove # 2
p q.remove # 'There'

# SELF TEST 1:
# queue_one = MyQueue.new
# queue_one.add('You')
# queue_one.add('To')
# queue_one.add('Hi')
# ['Hi, 'To', 'You']
#
# queue_two = MyQueue.new
# queue_two.add(3)
# queue_two.add(2)
# queue_two.add(1)
# [1, 2, 3]
#
# Result should be:
# [1, 'Hi', 2, 'To', 3, 'You']

# SELF TEST 2:
# queue_one = MyQueue.new
# queue_one.add(3)
# queue_one.add(2)
# queue_one.add(1)
#
# queue_two = MyQueue.new
# queue_two.add('Hi')
#
# Result should be:
# [1, 2, 'Hi', 3]
