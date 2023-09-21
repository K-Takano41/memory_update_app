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
end
