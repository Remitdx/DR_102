require_relative "scenes/index"

# Main game Loop
def tick args 
  initialize_game args
  handle_scenes(args.state.scene, args)
end

private

def handle_scenes(state, args)
  case state
  when  "welcome"
    Scenes::Welcome.new.send("#{state}_tick", args)
  when  "menu"
    Scenes::Menu.new.send("#{state}_tick", args)
  # when  "gameplay"
  #   Scenes::Gameplay.new.send("#{state}_tick", args)
  # when  "achievements"
  #   Scenes::Achievements.new.send("#{state}_tick", args)
  # when  "levelfailed"
  #   Scenes::Levelfailed.new.send("#{state}_tick", args)
  # when  "levelsucceed"
  #   Scenes::Levelsucceed.new.send("#{state}_tick", args)
  end
end

def initialize_game args
  args.state.scene ||= "welcome"
end

$gtk.reset