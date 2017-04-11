module Yai
  module Utils
    module UI
      def info(text)
        puts text
      end

      def warn(text)
        puts text.colorize(:yellow)
      end

      def fatal(text)
        puts text.colorize(:red)
      end
    end
  end
end
