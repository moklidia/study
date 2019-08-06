module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < count
          yield(self[i])
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new([])
        my_each { |el| result << yield(el) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new([])
        my_each { |el| result << el if !el.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        acc = initial.nil? ? self[0] : initial
        tail = initial.nil? ? self[1..(length - 1)] : self
        tail.my_each { |el| acc = yield(acc, el) }
        acc
      end
    end
  end
end
