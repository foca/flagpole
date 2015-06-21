class Flagpole
  # Public: Initialize the set of flags.
  #
  # value - An Integer with the initial value of the set.
  # flags - The name of the flags you're using.
  def initialize(value = 0, flags)
    @flags = flags.zip(bitmap(value, flags.size)).to_h
  end

  # Public: Get a specific flag by name.
  #
  # key - One of the flag names passed to the initializer.
  #
  # Returns Boolean.
  def [](key)
    @flags.fetch(key)
  end

  # Public: Set a specific flag by name.
  #
  # key   - One of the flag names passed to the initializer.
  # value - A Boolean.
  #
  # Returns nothing.
  def []=(key, val)
    fail ArgumentError, "#{key} isn't a valid key" unless @flags.key?(key)
    @flags[key] = val
  end

  # Public: Returns the current value of the flag set as an Integer.
  def to_i
    @flags.each_value.with_index.inject(0) do |flag, (bit, power)|
      flag | (bit ? 1 : 0) * 2**power
    end
  end

  # Public: Returns a Hash with all the flags and their current values.
  def to_h
    @flags
  end

  # Internal: Generate the list of bits that make a given number. Each index of
  # the array corresponds to the bit for 2**index.
  #
  # Returns an Array of Booleans.
  def bitmap(num, size)
    Array.new(size).map.with_index { |_, i| num[i] == 1 }
  end
  private :bitmap
end
