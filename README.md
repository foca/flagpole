# Flagpole: Simple bitmap for storing flags

![](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Expo_2010_Shanghai_flags_and_China_Pavilion.jpg/1024px-Expo_2010_Shanghai_flags_and_China_Pavilion.jpg)

Flagpole allows bundling a bunch of flags into a single integer field, by
storing each flag as a bit.

``` ruby
notifications_via = Flagpole.new([:email, :sms, :phone_push])
notifications_via.to_h #=> { email: false, sms: false, phone_push: false }

notifications_via[:email] = true
notifications_via[:sms] = true

notifications_via.to_h #=> { email: true, sms: true, phone_push: false }
notifications_via.to_i #=> 3
```

Now you can just store that `3` in your database. In order to get that back,
just pass it to the constructor:

``` ruby
notifications_via = Flagpole.new(3, [:email, :sms, :phone_push])
notifications_via.to_h #=> { email: true, sms: true, phone_push: false }
```

## Install

    gem install flagpole

## What kind of sorcery is this?!

If you consider each flag as a "bit" (1 when true, 0 when false), then the above
example could be represented as `[1, 1, 0]`. If you reverse this, you get the
binary representation of the number `3` (`11`).

All Flagpole does is give you a nice API to treat sets of named binary settings
("flags") as an integer, by doing the marshaling for you.

[Read more about bitmaps on Wikipedia](https://en.wikipedia.org/wiki/Bit_field).

## I want to add a new flag

Easy! Just add a new name **at the end** of the array of flag names. So, In the
example above, if you later add support for twitter notifications, just do this:

``` ruby
notifications_via = Flagpole.new(3, [:email, :sms, :phone_push, :twitter])
notifications_via.to_h #=> { email: true, sms: true, phone_push: false, twitter: false }
```

As you see, the values are maintained.

## I want to remove an existing flag

Don't.

Just ignore it in your code. Change the flag name to `:_` if it helps you.

## License

This project is shared under the MIT license. See the attached [LICENSE][] file
for details.

Photo credit: [_Cesarexpo via Wikimedia Commons_](https://commons.wikimedia.org/wiki/File%3AExpo_2010_Shanghai_flags_and_China_Pavilion.jpg).

[LICENSE]: ./LICENSE
