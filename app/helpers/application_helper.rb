module ApplicationHelper

  def flash_html
    if flash[:success]
      "<div class='alert alert-success'>#{ flash[:success ]}</div>".html_safe
    end
  end

end
