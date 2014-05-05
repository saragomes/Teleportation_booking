module ApplicationHelper

	include WillPaginate::ViewHelpers
		
	def will_paginate_with_i18n(collection = nil, options = {})
		will_paginate collection, options.merge(:previous_label => I18n.t(:previous), :next_label => I18n.t(:next))
	end

	def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column.to_sym == sort_column.to_sym) ? "current #{sort_direction}" : nil
    direction = (column.to_sym == sort_column.to_sym && sort_direction == "asc") ? "desc" : "asc"
    result = flatten_keys(params).delete_if {|key| %w(sort direction).include?(key)}
    link_to title, result.merge({sort: column, direction: direction, search: params[:search], gare: params[:gare]}), {:class => css_class}
  end
  
  def direction_css(column)
    direction = (column.to_sym == sort_column.to_sym && sort_direction == "asc") ? "desc" : "asc"
    case direction
    when "asc"
     "icon-white icon-asc"
    when "desc"
      "icon-white icon-desc"
    end
  end #end of direction_css

  private
  def flatten_keys(options, pr = {}, prefix = nil)
    return "" unless options.kind_of? Hash
    options.collect do |key, value|
      full_key = prefix ? "#{prefix}[#{key}]" : key
      if value.is_a?(Hash)
        pr = flatten_keys(options[key], pr, full_key)
      else
        pr = pr.merge( full_key => options[key])
      end
    end
    pr
  end #end of encode_url(options)

end