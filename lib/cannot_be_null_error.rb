class CannotBeNullError < StandardError
  attr_reader :reason

  def initialize(reason)
    @reason = reason
  end
end
