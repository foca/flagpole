test "defaults to all false" do
  flags = Flagpole.new([:a, :b, :c])
  assert_equal({ a: false, b: false, c: false }, flags.to_h)
end

test "sets the flags to the corresponding bits of the given value" do
  flags = Flagpole.new(0, [:a, :b])
  assert_equal [false, false], flags.to_h.values

  flags = Flagpole.new(1, [:a, :b])
  assert_equal [true, false], flags.to_h.values

  flags = Flagpole.new(2, [:a, :b])
  assert_equal [false, true], flags.to_h.values

  flags = Flagpole.new(3, [:a, :b])
  assert_equal [true, true], flags.to_h.values
end

test "gets the value of the flags when calling #to_i" do
  flags = Flagpole.new(0, [:a, :b])
  assert_equal 0, flags.to_i

  flags = Flagpole.new(1, [:a, :b])
  assert_equal 1, flags.to_i

  flags = Flagpole.new(2, [:a, :b])
  assert_equal 2, flags.to_i

  flags = Flagpole.new(3, [:a, :b])
  assert_equal 3, flags.to_i
end

test "allows getting the value of a single flag" do
  flags = Flagpole.new(2, [:a, :b])
  assert_equal true, flags[:b]
  assert_equal false, flags[:a]
end

test "allows mutating a flag" do
  flags = Flagpole.new(3, [:a, :b, :c])
  flags[:b] = false

  assert_equal false, flags[:b]
  assert_equal 1, flags.to_i
end

test "adding a flag at the end keeps the values consistent" do
  hash = Flagpole.new(5, [:a, :b, :c]).to_h
  hash[:d] = false

  assert_equal hash, Flagpole.new(5, [:a, :b, :c, :d]).to_h
end
