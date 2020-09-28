# dataStructures_DIY_ADTs.rb

class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack.push(el)
        el
    end

    def pop
        @stack.pop
    end

    def peek
        @stack.last
    end

    private

    attr_reader :stack

end


class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
        el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end

    private

    attr_reader :queue
end


class Map
    def initialize
        @array = []
    end

    def set(key,value)
        idx = @array.index { |pair| pair[0] == key }
        if idx
            @array[idx][1] = value
        else
            @array.push([key,value])
        end
        value
    end

    def get(key)
        @array.each { |pair| return pair[1] if pair[0] == key }
        nil
    end

    def delete(key)
        value = get(key)
        @array.reject! { |pair| pair[0] == key }
        value
    end

    def show
        deep_dup(@array)
    end

    private

    attr_reader :array

    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end
end