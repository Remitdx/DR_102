module Scenes
  class Gameplay
    def gameplay_tick(args)

      ## UI ##

      args.outputs.labels  << { x: 640,
                                y: 600,
                                text: 'Gameplay',
                                size_px: 60,
                                anchor_x: 0.5,
                                anchor_y: 0.5 }

      ## UX ##

    end

    private
    
  end
end