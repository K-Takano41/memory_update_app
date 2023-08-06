class GenerateGoodImageJob < ApplicationJob
  queue_as :default

  def perform(memory, prompt)
    prompt_text = prompt.good_prompt
    ImageApiMethod.create_image(memory, prompt_text, "good_image")
  end
end
