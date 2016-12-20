module ApplicationHelper

  def flash_html
    if flash[:success]
      "<div class='alert alert-success'>#{ flash[:success ]}</div>".html_safe
    end
  end

  def layout_links
    links = {
      'Create Status'    => new_status_path,
      'Status Report' => '/sr',
      'Previous Day Status' => prev_status_status_index_path(:diff => 1)
    }
    links.merge!('Edit Your Status' => edit_status_path(session[:status_id])) if session[:status_id]
    links
  end
end
