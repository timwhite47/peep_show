module PeepShow
    def self.included(base)
      base.extend(self)
    end

    def set_peep_show(*args)
      options = { }
      preview = args.pop if args.last.kind_of? Hash
      
      define_method :preview do
      	preview
      end
    end    
end

class ActiveRecord::Base
  include PeepShow
end