module TipsHelper
  def compare(val1, val2)
    return val1.detect {|user| user.id == val2 }
  end
end
