class Setting < ActiveRecord::Base

  serialize :value

  def self.method_missing(method, *args)

    method = method.to_s

    # set mode
    if method[-1,1] == "="

      if args.size > 0
        # key/value setup
        method = method.chop
        method = method.chop if method[-1,1] == "!"
        value = {:value => args[0]}
        setting = self.find_by(key: method)
        if value[:value].nil?
          setting.destroy if setting
        else
          setting = self.new if !setting
          setting.key = method.to_s if setting.key.blank?
          setting.value = value
          if setting.save
            return value[:value]
          end
        end
      end

    # get mode
    else
      result = self.find_by(key: method)
      if result
        return result.value[:value]
      end

    end
    return nil

  end

end
