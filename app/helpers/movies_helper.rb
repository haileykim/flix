module MoviesHelper

  def format_total_gross(movie)
    if movie.flop?
      content_tag(:strong, "Flop!")
    else
  	  number_to_currency(movie.total_gross)
    end
  end

  def image_for(movie)
  	if movie.image.exists?
  		image_tag(movie.image.url)
  	else
  		image_tag('placeholder.jpg')
  	end
  end

  def format_average_stars(movie)
    if movie.average_stars.nil?
      "No reviews"
    else
      pluralize(number_with_precision(movie.average_stars, precision: 1), 'star')
    end
  end
  
  def format_review(movie)
    if movie.reviews.any?
      '| ' + pluralize(movie.reviews.count, 'review')
    else
      nil     
    end
  end

end
