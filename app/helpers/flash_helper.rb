module FlashHelper

  def flash_messages
    output = ''
    flash.each do |type, message|
      next if message.blank?
      type = type.to_sym
      type = :success if type == :notice
      type = :warning  if type == :alert
      type = :danger  if type == :danger

      output += flash_container(type, message)
    end

    raw(output)
  end

  def flash_container(type, message)
    content_tag(:div, class: "alert alert-#{type} notice alert-dismissible fade show") do
      content_tag(:button, '', class: 'btn-close', 'data-dismiss': 'alert') + message
    end
  end

end
