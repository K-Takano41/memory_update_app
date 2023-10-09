module ApplicationHelper

  def message_value(message_type)
    case message_type
    when 'success'
      t('defaults.success')
    when 'danger'
      t('defaults.failure')
    when 'warning'
      t('defaults.warning')
    end
  end

  def turbo_stream_flash
    turbo_stream.append "flashes", partial: "shared/flash_message"
  end
end
