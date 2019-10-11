class PlayerFactory

  def build(clazz, **attributes)
    clazz.new(attributes)
   end

end
