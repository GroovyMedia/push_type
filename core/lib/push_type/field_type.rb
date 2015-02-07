module PushType
  class FieldType

    attr_reader :name

    class << self
      attr_reader :initialized_blk
      def initialized_on_node(&block)
        @initialized_blk = block
      end
    end

    def initialize(name, opts = {})
      @name = name.to_s
      @opts = opts
    end

    def param
      name.to_sym
    end

    def kind
      self.class.name.demodulize.underscore.gsub(/_(field|type)$/, '')
    end

    def template
      @opts[:template] || 'default'
    end

    def label
      @opts[:label] || name.humanize
    end

    def html_options
      @opts[:html_options] || {}
    end

    def form_helper
      @opts[:form_helper] || :text_field
    end

    def column_class
      case @opts[:colspan]
        when 2 then 'medium-6'
        when 3 then 'medium-4'
        when 3 then 'medium-3'
        else nil
      end
    end

    def to_json(val)
      val
    end

    def from_json(val)
      val
    end

  end
end
