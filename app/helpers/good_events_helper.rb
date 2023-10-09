module GoodEventsHelper
  def example_message
    t = Time.zone.now
    case t.hour
    when 5..9
      t('.ex_message_morning')
    when 18..23, 0..1
      t('.ex_message_night')
    else
      t('.ex_message')
    end
  end
end
