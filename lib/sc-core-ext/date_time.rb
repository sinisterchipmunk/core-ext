unless DateTime.methods.include?("seconds_since_unix_epoch")
  # https://rails.lighthouseapp.com/projects/8994/tickets/3511-to_yaml-fails-for-datetime-objects
  class DateTime
    # Converts self to a float number of seconds since the Unix epoch
    def to_f
      seconds_since_unix_epoch.to_f
    end

    # Converts self to an integer number of seconds since the Unix epoch
    def to_i
      seconds_since_unix_epoch.to_i
    end

    private
    def seconds_since_unix_epoch
      seconds_per_day = 86_400
      (self - ::DateTime.civil(1970)) * seconds_per_day
    end
  end
end
