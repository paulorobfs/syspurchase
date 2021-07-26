module ApplicationHelper


  def css_container
    if user_signed_in?
      'container mt-3 p-3'
    else
      'container-login'
    end
  end

  def social_link_icon(provider)
    if provider.to_s.eql?"facebook"
      'fab fa-facebook-square'
    elsif provider.to_s.eql?"google_oauth2"
      'fab fa-google'
    elsif provider.to_s.eql?"twitter"
      'fab fa-twitter-square'
    end
  end

  def container_flash_messages
    unless user_signed_in?
      'd-flex justify-content-center'
    end
  end

end
