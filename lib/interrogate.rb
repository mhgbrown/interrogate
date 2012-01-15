require "interrogate/version"

# String?(\"Hello\")
# Interrogate attempts to bring Scheme-like class predication to Ruby.
# It provides an alternate syntax using Module#===
module Interrogate

  # Given an interrogatory method name and arguments,
  # determine which class we are asking about and
  # ask each arg if it is an instance of this class.
  def self.interrogate(meth, *args)
    raise ArgumentError, "#{method}: wrong number of arguments (#{args.length} for 1)" if args.length < 1
    klass_name = meth.to_s.tr("?", "")
    klass = Object.const_get(klass_name)
    args.inject(true){|bool, obj| bool && klass === obj}
  end

end

class Object

  # If the method name is interrogatory, then
  # try to interrogate the arguments in question.
  # Otherwise, perform the default method missing
  # behavior.
  def self.method_missing(method, *args, &block)
    if /^[A-Z].*\?$/ === method.to_s
      Interrogate.interrogate(method, *args)
    else
      super
    end
  end

  # If the method name is interrogatory, then
  # try to interrogate the arguments in question.
  # Otherwise, perform the default method missing
  # behavior.
  def method_missing(method, *args, &block)
    if /^[A-Z].*\?$/  === method.to_s
      Interrogate.interrogate(method, *args)
    else
      super
    end
  end

end
