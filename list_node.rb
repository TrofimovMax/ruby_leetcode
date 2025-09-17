# frozen_string_literal: true

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end

  def self.build(values, pos)
    return nil if values.empty?

    head = ListNode.new(values[0])
    current = head
    nodes = [head]

    values[1..].each do |val|
      node = ListNode.new(val)
      current.next = node
      current = node
      nodes << node
    end

    if pos >= 0
      tail = current
      cycle_node = nodes[pos]
      tail.next = cycle_node
    end

    head
  end
end
