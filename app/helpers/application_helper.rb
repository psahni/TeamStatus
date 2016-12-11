module ApplicationHelper

  def flash_html
    if flash[:success]
      "<div class='alert alert-success'>#{ flash[:success ]}</div>".html_safe
    end
  end

  def layout_links
    links = {
      'Create Status'    => new_status_path,
      'Status Report' => '/sr'
    }
    links.merge!('Edit Your Status' => edit_status_path(session[:status_id])) if session[:status_id]
    links
  end
end
