# frozen_string_literal: true

require 'link_thumbnailer/scrapers/default/base'
require 'link_thumbnailer/models/image'

module LinkThumbnailer
  module Scrapers
    module Amazon
      class Images < ::LinkThumbnailer::Scrapers::Default::Base

        def value
          urls.map do |uri|
            modelize(uri, [331 ,498], 'image/jpeg')
          end
        end

        private

        def urls
          document.search('//img[contains(@class,"frontImage")]').map { |i| i['src'] }.compact
        end

        def model_class
          ::LinkThumbnailer::Models::Image
        end

        def modelize(uri, size = nil, type = nil)
          model_class.new(uri, size, type)
        end

      end
    end
  end
end
