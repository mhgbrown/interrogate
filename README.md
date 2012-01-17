# Interrogate [![Build Status](https://secure.travis-ci.org/mhgbrown/interrogate.png)](http://travis-ci.org/mhgbrown/interrogate)
Interrogate attempts to bring Scheme-like class predication to Ruby.  It provides an alternate syntax using `Module#===`.

	>> String?("Hello")
	>> trues
	>> Symbol?(:World)
	>> true
	>> Float?(1.0)
	>> true

You can "interrogate" multiple objects as well:

	>> String?("Hello", :World, 1.0)
	>> false
	>> String?("Hello", "World", "1.0")
	>> true

And you can "interrogate" the return value of a block:

	>> num = 1
	>> String?("Hello") { num }
	>> false
	>> String?("Hello") { num.to_s }
	>> true

## Feedback
Use that Github [issue tracker](https://github.com/mhgbrown/interrogate/issues)!