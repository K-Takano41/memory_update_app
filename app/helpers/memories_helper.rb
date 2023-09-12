module MemoriesHelper
  def good_icon(events, i)
    good_event = events[i]
    if good_event
      link_to good_event_path(good_event) do
        content_tag(:i, "", class: "fa-solid fa-face-laugh-beam fa-size mx-1")
      end
    else
      content_tag(:i, "", class: "fa-regular fa-face-meh fa-size mx-1")
    end
  end


  # def optimize_url(image_path)
  #   no_cache_params = Time.parse(File.mtime("#{Rails.public_path}#{image_path}").to_s).to_i
  #   resource_absolute_path = "#{image_path}?#{no_cache_params}"
  # end
end
