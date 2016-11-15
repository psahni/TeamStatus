module StatusHelper

  def link_to_add_more(form_ref, association_name, partial_to_render)
    html_options = {}
    logger.info "------------"
    logger.info form_ref.object.class.reflect_on_association(association_name)
    logger.info "------------"
    association_instance = form_ref.object.class.reflect_on_association(association_name).klass.new
    view_to_render = form_ref.fields_for(association_name, association_instance, child_index: '_new_') do |task_builder|
      render(:partial => partial_to_render, :locals => {:form => task_builder})
    end
    html_options['data-form-prepend'] = raw CGI::escapeHTML( view_to_render )
    html_options['href'] = '#'
    content_tag(:a, '+Add More', html_options)
  end

end
