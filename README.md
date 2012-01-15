# Interrogate
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

## Feedback
Use that Github [issue tracker](https://github.com/mhgbrown/interrogate/issues)!