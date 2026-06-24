module Components
  class Clickable
    def initialize(args, options={}, &block)
      args = args
      options = options
      
      DEFAULT_OPTIONS = {
        x: args.grid.w / 2,
        y: args.grid.h / 2,
        w: 200,
        h: 50,
        r: 255,
        g: 255,
        b: 255,
        a: 122,
        anchor_x: 0.5,
        anchor_y: 0.5
      }

      render_background(args, options)
      on_click(args, options, &block) if block_given?
      
      args.state.cursor = "pointer" if mouse_over_clickable(args, options)
    end
    
    ## CONST ##


    ## UI ##


    ## UX ##

    #rendre clickable
    def on_click(args, options={}, &block)
      if args.inputs.mouse.click && mouse_over_clickable(args, options)
        yield
      end
    end    

    private

    def render_background(args, options={})
      args.outputs.solids << {  x: options.x || DEFAULT_OPTIONS.x,
                                y: options.y || DEFAULT_OPTIONS.y,
                                w: options.w || DEFAULT_OPTIONS.w,
                                h: options.h || DEFAULT_OPTIONS.h,
                                r: options.r || DEFAULT_OPTIONS.r,
                                g: options.g || DEFAULT_OPTIONS.g,
                                b: options.b || DEFAULT_OPTIONS.b,
                                a: options.a || DEFAULT_OPTIONS.a,
                                anchor_x: options.anchor_x || DEFAULT_OPTIONS.anchor_x,
                                anchor_y: options.anchor_y || DEFAULT_OPTIONS.anchor_y
                              }
    end

    def mouse_over_clickable(args, options={})
      horizontal_offset = options.w || DEFAULT_OPTIONS.w
      vertical_offset = options.h || DEFAULT_OPTIONS.h
      pos_x = options.x || DEFAULT_OPTIONS.x
      pos_y = options.y || DEFAULT_OPTIONS.y
      
      args.inputs.mouse.x > pos_x - (horizontal_offset / 2) &&
      args.inputs.mouse.x < pos_x + (horizontal_offset / 2) &&
      args.inputs.mouse.y > pos_y - (vertical_offset / 2) &&
      args.inputs.mouse.y < pos_y + (vertical_offset / 2)
    end
  end

  class Button < Clickable
    def initialize(args, options={})
      super
      render_text(args, options) unless options.text.empty?
    end

    private

    def render_text(args, options={})
      args.outputs.labels  << { x: options.x || DEFAULT_OPTIONS.x,
                                y: options.y || DEFAULT_OPTIONS.y,
                                text: options.text,
                                size_px: options.size_px,
                                anchor_x: options.anchor_x || DEFAULT_OPTIONS.anchor_x,
                                anchor_y: options.anchor_y || DEFAULT_OPTIONS.anchor_y,
                                r: 0,
                                g: 0,
                                b: 0
                              }
    end
  end
end