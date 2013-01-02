module PeepShow
    def self.included(base)
      base.extend(self)
    end

    def set_peep_show(*args)
      options = { }
      preview = args.pop if args.last.kind_of? Hash
      
      fb_basic = {
        :title => preview[:title], 
        :type => "website", 
        :image => preview[:image], 
        :url => preview[:url],
        :description => preview[:description], 
      }

      twitter_basic = {
        :site => preview[:twitter].try(:[], :site_handle),
        :author => preview[:twitter].try(:[], :author_handle),
        :card => 'summary',
        :title => preview[:title], 
        :description => preview[:description],
        :url => preview[:url],
        :image => preview[:image]
      }
      # case args.first
      # when :basic
      #   fb = fb_basic
      #   twitter = twitter_basic
      # when :article
          
      # when :image

      # when :video        
        
      # end
      
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