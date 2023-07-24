class GenerateGoodImageJob < ApplicationJob
  queue_as :default

  def perform(memory_id, prompt_id)
    memory = Memory.find(memory_id)
    prompt = Prompt.find(prompt_id)
    memory.good_image = "good_image/#{prompt.good_prompt}"
    memory.save
  end
end
