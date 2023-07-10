class ChoicesController < ApplicationController
  def choices
    current_choice = params[:choice]
    @next_choices = next_choices(current_choice)
  end

  private

  def next_choices(current_choice)
    case current_choice
    when "bad"
      ["選択肢1-1", "選択肢1-2", "選択肢1-3", "選択肢1-4"]
    when "fear"
      ["選択肢2-1", "選択肢2-2", "選択肢2-3" ,"選択肢2-4"]
    when "sad"
      ["選択肢3-1", "選択肢3-2", "選択肢3-3" ,"選択肢3-4"]
    when "painful"
      ["選択肢4-1", "選択肢4-2", "選択肢4-3" ,"選択肢4-4"]
    end
  end
end
