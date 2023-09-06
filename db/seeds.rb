# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
  name: "admin",
  email: "admin@example.com",
  password: "P@ssw0rd",
  password_confirmation: "P@ssw0rd",
  role: "admin"
)
Prompt.create!(
  [
    {
      question: "自分だけが真っ暗な水の底にいるような、冷たくて息苦しい寂しさよりも深い孤独感",
      bad_prompt: "(underwater:1), masterpiece, realistic, view in the water, underwater, in the water, bottom of water, deep underwater, dark underwater, darkness, total darkness, deep in the water, clear water, limpid water, in the darkest of water, nothing at the bottom, nothing around, nothing is visible, no light, faintly bright",
      bad_negative_prompt: "(character, person, human, people, hands, girl, man, plants, seaweed, animals, aquatic organism , fish, living thing, sharks, dolphins, whales, mammals, creatures, machinery, ships, buildings, structures, artifacts), flat color, flat shading, low res, signature, watermark",
      good_prompt: "masterpiece, realistic, photo, landscapes, (sky:1), beautiful sky, (from below), blue sky, clear sky, midday, only sky, clear view, sunny, few cloud",
      good_negative_prompt: "(ground, plants, tree, building, character, person, human, people, hands, girl, man, organisms, creatures, animals), flat color, flat shading, low res, signature, watermark",
    },
    {
      question: "胸の内に流れ落ちていく重く黒ずんだ不安",
      bad_prompt: "masterpiece, black liquid pouring down, pouring down like a waterfall, black liquid, drenching, large amount of black liquid pouring down, black mucus, sloppy liquid, heavy mucus, pooling, puddle, accumulating, large amount of liquid, puddle of mucus, mucus gathering, liquid gathering, accumulating, realistic",
      bad_negative_prompt: "(plants, trees, ground, seaweed, rock, stone, forest, human, people, parson, man, woman, girl, boy, text), blurry, underexposed, grainy, blurred, deformed and disfigured, ugly",
      good_prompt: "(water surface:0.7), masterpiece, beautiful water surface, clear water, the sky is reflected in the water, lake, clean water, clear blue water, quiet, stillness, a drop of water falls on the surface of the water, realistic, photo",
      good_negative_prompt: "(plant, tree, ground, seaweed, rock, stone, forest, human, people, parson, man, woman, girl, boy, text), underexposed, blurry, grainy"
    },
    {
      question: "自分の胸を掻きむしりたくなるような、自傷衝動",
      bad_prompt: "masterpiece, one heart in the center, many knives stuck in the heart, dark background",
      bad_negative_prompt: "hand, human, man, boy, girl, woman, parson, organisms, animals, creatures, underexposed, blurry, grainy, blurred, deformed and disfigured, ugly",
      good_prompt: "masterpiece, one heart in the center, lots of flowers around the heart, heart surrounded by many flowers, beautiful flowers, bright flowers, many types of flowers, many colors of flowers",
      good_negative_prompt: "hand, human, man, boy, girl, woman, parson, organisms, animals, creatures, underexposed, blurry, grainy, blurred, deformed and disfigured, ugly"
    },
    {
      question: "瞼の裏の暗闇に現れる、カタチのない恐怖",
      bad_prompt: "(a ghost), ghostly, levitation, black, dark shadow, red-eyes, evil spirit, terror, spine-chilling, fear, horror, fright, outline blurred, assault, foggy background",
      bad_negative_prompt: "skulls, skeletons, mouth, nose, nsfw, cloth, human, person, man, woman, girl, boy, forest, plant",
      good_prompt: "masterpiece, beautiful, (forest:0.4), (lake:0.4), (fog:0.2), clear view, blue sky, sunlight, sun, morning, realistic",
      good_negative_prompt: "human, man, woman, girl, boy, child, person, underexposed, blurry, grainy, blurred, deformed and disfigured, ugly, deformed and disfigured, night, dawn, sunset"
    }
  ]
)

