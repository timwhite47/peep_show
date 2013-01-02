module PeepShow
    def self.included(base)
      base.extend(self)
    end

    def set_peep_show(*args)
      preview = args.pop if args.last.kind_of? Hash
      
      fb_basic = {
        :title => string_or_proc(preview[:title]), 
        :type => "website", 
        :image => string_or_proc(preview[:image]),  
        :url => string_or_proc(preview[:url]),  
        :description => string_or_proc(preview[:description])
      }

      twitter_basic = {
        :site => preview[:twitter].try(:[], :site_handle),
        :author => preview[:twitter].try(:[], :author_handle),
        :card => 'summary',
        :title => string_or_proc(preview[:title]), 
        :description => string_or_proc(preview[:description]),
        :url => string_or_proc(preview[:url]),
        :image => string_or_proc(preview[:image])
      }
      # TODO: ADD SPECIAL :basic, :article, :image, :video 

      define_method :preview do
      	{
          fb: fb_basic,
          twitter: twitter_basic
        }
      end
    end    
end

class ActiveRecord::Base
  include PeepShow
end

def string_or_proc(input)
  ((input.class==Symbol) ? Proc.new {|obj| obj.send(input.to_s) } : input)
end