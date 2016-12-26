module StatusHelper

  def link_to_add_more(form_ref, association_name, partial_to_render, locals)
    html_options = {}
    association_instance = form_ref.object.class.reflect_on_association(association_name).klass.new
    view_to_render = form_ref.fields_for(association_name, association_instance, :child_index => '_new_') do |task_builder|
      render(:partial => partial_to_render, :locals => {:form => task_builder, :enable_destroy => true }.merge(locals))
    end
    html_options['data-form-prepend'] = raw CGI::escapeHTML( view_to_render )
    html_options['append-container'] = association_name
    html_options[:class] = 'add-more'
    content_tag(:a, '+Add More', html_options)
  end

  def formatted_description(description)
    return if description.blank?
    description = remove_invalid_chars(description)
    description = "-- " + description.split("\r\n").join("\n-- ")
    simple_format(description, {}, :wrapper_tag => "div")
  end

  def remove_invalid_chars(content)
    content.gsub(/-/, '')
  end

end
