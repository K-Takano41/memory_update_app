class GenerateGoodImageJob < ApplicationJob
  queue_as :default

  def perform(memory, prompt)
    prompt_text = prompt.good_prompt
    negative_text = prompt.good_negative_prompt
    memory.good_image = ImageApiMethod.create_image(prompt_text, negative_text)
    memory.save
  end
end
