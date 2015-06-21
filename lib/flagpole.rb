class Flagpole
  def initialize(value = 0, flags)
    @flags = flags.zip(bitmap(value, flags.size)).to_h
  end

  def [](key)
    @flags.fetch(key)
  end

  def []=(key, val)
    fail ArgumentError, "#{key} isn't a valid key" unless @flags.key?(key)
    @flags[key] = val
  end

  def to_i
    @flags.each_value.with_index.inject(0) do |flag, (bit, power)|
      flag | (bit ? 1 : 0) * 2**power
    end
  end

  def to_h
    @flags
  end

  def bitmap(num, size)
    ("%0#{size}d" % num.to_s(2)).chars.reverse.map { |i| i == "1" }
  end
  private :bitmap
end
