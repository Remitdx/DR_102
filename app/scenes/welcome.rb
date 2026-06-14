module Scenes
  class Welcome
    def welcome_tick(args)
      args.state.logo_rect ||= { x: 576,
                                y: 200,
                                w: 128,
                                h: 101 }

      args.outputs.labels  << { x: 640,
                                y: 600,
                                text: 'Dice war',
                                size_px: 60,
                                anchor_x: 0.5,
                                anchor_y: 0.5 }
    end
  end
end