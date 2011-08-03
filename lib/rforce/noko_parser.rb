require 'nokogiri'
require 'rforce/soap_pullable'

class NokoParser < Nokogiri::XML::SAX::Document
  include RForce::SoapPullable

  def initialize
    @current_value = nil
    @stack = []
    @parsed = OpenHash.new({})
    @done = false
    @namespaces = []
  end

  def start_element name, attrs = []
    hattr = nil
    hattr = Hash[*(attrs.flatten)] unless attrs.blank?
    tag_start name,  hattr unless @done
  end

  def end_element name
    tag_end name unless @done
  end

  def characters data
    text data unless @done
  end
end