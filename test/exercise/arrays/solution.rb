module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |el| el > 0 ? 100 : el }
      end

      def search(array, query)
        first = 0
        last = array.length - 1

        while first <= last
          mid = (first + last) / 2
          guess = array[mid]

          if guess == query
            return mid
          elsif guess > query
            last = mid - 1
          else
            first = mid + 1
          end
        end
        -1
      end
    end
  end
end
