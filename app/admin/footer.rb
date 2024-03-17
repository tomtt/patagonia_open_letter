module ActiveAdmin
  module Views
    class Footer < Component

      def build(_)
        super :id => "footer"
        super :style => "text-align: right;"

        div do
          small
          text_node "By"
          a "Tom ten Thij", href: "https://tomtenthij.nl", target: "_"
        end
      end

    end
  end
end
