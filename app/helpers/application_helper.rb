module ApplicationHelper

  def message_value(message_type)
    if message_type == 'success'
      t('defaults.success')
    elsif message_type == 'danger'
      t('defaults.failure')
    end
  end

  def turbo_stream_flash
    turbo_stream.append "flashes", partial: "shared/flash_message"
  end
end
