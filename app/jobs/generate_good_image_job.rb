class GenerateGoodImageJob < ApplicationJob
  queue_as :default

  def perform(memory_id, prompt_id)
    memory = Memory.find(memory_id)
    prompt = Prompt.find(prompt_id)
    memory.good_image = "image.jpeg"
    memory.save
  end
end
