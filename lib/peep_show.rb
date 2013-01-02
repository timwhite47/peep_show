module PeepShow    
    def set_peep_show(*args)
      options = { }
      options.merge!(args.pop) if args.last.kind_of? Hash
      define_method :foobar do
      	{
      		:foo => "bar"
      	}
      end
    end    
end

class ActiveRecord::Base
  include PeepShow
end