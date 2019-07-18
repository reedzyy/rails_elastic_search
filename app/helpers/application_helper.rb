module ApplicationHelper
  def nested_categories(categories)
    categories.map do |category, sub_categories|
      content_tag(:div, render(category), :class => "media")
    end.join.html_safe
 end
end
