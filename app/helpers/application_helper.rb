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
      'Previous Day Status' => previous_status_path(:diff => 1),
      'Create Risk Sheet' => edit_risk_sheet_utility_index_path,
      'Update Risk Sheet' => ''
    }
    links.merge!('Edit Your Status' => edit_status_path(session[:status_id])) if session[:status_id].present?
    links
  end
end
