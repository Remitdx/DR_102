module Scenes
  module Maps
    class Tile
      ## CONST ##

      TILE_WIDTH = 80
      TILE_HEIGHT = 60

      ## UI ##
      def tile args
        args.outputs.solids << {  x: 0,
                                  y: 0,
                                  w: TILE_WIDTH,
                                  h: TILE_HEIGHT,
                                  r: 255,
                                  g: 195,
                                  b: 25
                                }
      end

      ## UX ##


    end
  end
end
