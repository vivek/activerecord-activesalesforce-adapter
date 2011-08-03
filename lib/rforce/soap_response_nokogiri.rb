require 'nokogiri'
require 'rforce/noko_parser'

module RForce
  class SoapResponseNokogiri
    def initialize(content)
      @content = content
    end

    def parse
      noko_parser = NokoParser.new
      parser = Nokogiri::XML::SAX::Parser.new(noko_parser)
      parser.parse(@content)
      @parsed
    end
  end

end