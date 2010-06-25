class Float
  def to_frac
    fraction = case self.abs%1.0
               when 0    then ''
               when 0.25 then '&frac14;'
               when 0.5  then '&frac12;'
               when 0.75 then '&frac34;'
               end
    if fraction
      body = case self.floor
             when -1 then '-'
             when  0 then ''
             else self.to_i.to_s
             end
      body + fraction
    else
      if self % 1.0 == 0
        self.to_i.to_s
      else
        self.to_s
      end
    end
  end
end
