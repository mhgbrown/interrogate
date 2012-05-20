class Object

  # If the method name is interrogatory, then
  # try to interrogate the arguments in question.
  # Otherwise, perform the default method missing
  # behavior.
  def self.method_missing(meth, *args, &block)
    Interrogate.is_interrogatory?(meth) ? Interrogate.interrogate(meth, *args, &block) : super
  end

  # If the method name is interrogatory, then
  # try to interrogate the arguments in question.
  # Otherwise, perform the default method missing
  # behavior.
  def method_missing(meth, *args, &block)
    Interrogate.is_interrogatory?(meth) ? Interrogate.interrogate(meth, *args, &block) : super
  end

end