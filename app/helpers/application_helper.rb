module ApplicationHelper

  def default_meta_tags
    {
      site: 'Memory-Update',
      title: 'MemoryUpdate',
      reverse: true,
      charset: 'utf-8',
      description: 'このWEBアプリはユーザーのネガティブな思い出をポジティブな思い出で更新するアプリです',
      keywords: 'memory update, memory-update, 嫌な思い出 上書き, 嫌な記憶 上書き, 思い出更新, 記憶 上書き, 思い出 更新',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('apple.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpeg' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@KZ_TK12'
      }
    }
  end

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
