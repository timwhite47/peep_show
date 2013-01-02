module PeepShow

  module ClassMethods
    
    def self.set_peep_show(*args)
      options = {}
      options.merge!(args.pop) if args.last.kind_of? Hash

      define_method :og_obj do
        {
          :foo => "bar"
        }
      end
    end
    
  end
end

class ActiveRecord::Base
  include PeepShow
end