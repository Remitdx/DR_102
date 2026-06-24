module Scenes
  class Menu
    def menu_tick(args)

      ## UI ##
      
      args.outputs.labels  << { x: 640,
                                y: 600,
                                text: 'MENU',
                                size_px: 60,
                                anchor_x: 0.5,
                                anchor_y: 0.5 }

      Components::Clickable.new(args, w:300, h:80, x:args.grid.w, y:args.grid.h, r:255, g:222, b:0, a:255)
      Components::Button.new(args, w:200, h:70, text: 'Jouer', size_px: 50, r:145, g:145, b:145, a:255) do
        to_gameplay(args)
      end
      ## UX ##
      
    end

    private

    def to_gameplay(args)
      args.state.scene = "gameplay"
    end
  end
end