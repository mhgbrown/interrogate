require "interrogate/version"
require "interrogate/object"

# String?("Hello")
# Interrogate attempts to bring Scheme-like class predication to Ruby.
# It provides an alternate syntax using Module#===
module Interrogate

  # Given an interrogatory method name and arguments,
  # determine which class we are asking about and
  # ask each arg if it is an instance of this class.
  def self.interrogate(meth, *args, &block)
    raise ArgumentError, "#{meth}: requires at least one argument and/or a block" if args.length < 1 && !block

    klass_name = meth.to_s[0..-2]
    klass = Object.const_get(klass_name)
    args << yield if block_given?
    args.inject(true) { |bool, obj| bool && klass === obj }
  end

  # Determine if the given method matches an interrogatory
  # method name.
  def self.is_interrogatory?(meth)
    /^[A-Z].*\?$/ === meth.to_s
  end

end

