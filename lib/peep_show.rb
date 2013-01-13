module PeepShow
  include ActionView::Helpers::TagHelper
    def self.included(base)
      base.extend(self)
    end

    def self.setup
      yield self
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
          fb: process_hash(self, fb_basic),
          twitter: process_hash(self, twitter_basic)
        }
      end
    end   
    def render_templage_tags(object)
      if object
        tags = String.new
        preview = object.preview

        if preview[:fb][:url].nil? or preview[:twitter][:url].nil?
          Rails.application.routes.default_url_options[:host]= self.config.default_url_options[:host]
          url = Rails.application.routes.url_helpers.send(object.class.to_s.downcase+"_url", object)
          preview[:fb][:url] ||= url
          preview[:twitter][:url] ||= url
        end

        preview[:fb].each do |k, v|
          tags += (tag('meta', :property => "og:#{k}", :content => v.to_s)+ "\n") if v.present?
        end

        preview[:twitter].each do |k, v|
          tags += tag('meta', :name => "twitter:#{k}", :content => v.to_s)
          tags += "\n"
        end

        return tags.html_safe
      else
        return nil
      end

    end 
end

class ActiveRecord::Base
  include PeepShow
end

class ActionView::Base
  include PeepShow
end

def string_or_proc(input)
  ((input.class==Symbol) ? Proc.new {|obj| obj.send(input.to_s) } : input)
end

def process_hash(obj, hash)
  new_hash = Hash.new

  hash.each do |key, value|
    if value.class == Proc
      new_hash.merge!({key => (value.call(obj) rescue nil)})
    else
      new_hash.merge!({key => value})
    end
  end

  return new_hash
end
