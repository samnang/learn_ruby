class XmlDocument
  private
    def method_missing(name, *args, &block)
      define_method(name, *args)
      send(name, *args, &block)
    end

    def define_method(name, *args)
      define_singleton_method(name) do |attributes={}, &block|
        inner_content = block.call if block
        XmlElement.new(name, attributes, inner_content).to_s
      end
    end
end

class XmlElement
  attr_accessor :name, :attributes, :inner_content

  def initialize(name, attributes, inner_content)    
    @name          = name
    @attributes    = attributes
    @inner_content = inner_content
  end

  def to_s
    open_tag + close_tag
  end

  private
    def open_tag
      "<#{name}#{xml_attributes}"
    end

    def close_tag
      empty_tag? ?  "/>" : ">#{inner_content}</#{name}>"
    end

    def empty_tag?
      inner_content.nil? || inner_content.empty?
    end

    def xml_attributes
      attributes.map{|n, v| " #{n}='#{v}'"}.join
    end
end
