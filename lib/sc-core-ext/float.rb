class Float
  def to_frac
    fraction = case self.abs%1.0
               when 0    : ''
               when 0.25 : '&frac14;'
               when 0.5  : '&frac12;'
               when 0.75 : '&frac34;'
               end
    if fraction
      body = case self.floor
             when -1 : '-'
             when  0 : ''
             else self.to_i.to_s
             end
      body + fraction
    else
      self.to_s
    end
  end
end
