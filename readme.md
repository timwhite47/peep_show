PeepShow
========
A gem for Rails that defines previews from ActiveRecord objects and render them out as meta tags to be scraped by Facebook's [Open Graph protocol](http://ogp.me/ "Open Graph") and [Twitter Cards](https://dev.twitter.com/docs/cards "Twitter Cards")

# Installing

`gem install peep_show`
or 
`gem 'peep_show'`

# Settting up
In your models define the methods
`set_peep_show :title => :title, :description => :summary, :image => :image_url, :url => 'http://www.tenacioustimi.com'`

In your controller define what is going to be previewed
`@preview = Product.find(params[:id])`

In your views do this:
`render_templage_tags @preview`

This will render out your Open Graph and Twitter Card tags.

