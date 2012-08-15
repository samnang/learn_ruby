class RPNCalculator
  OPERATORS = {
    :plus   => :+,
    :minus  => :-,
    :divide => :/,
    :times  => :*
  }

  OPERATORS.each do |name, operator|
    class_eval <<-EOF
      def #{name}
        left, right = items.slice!(-2, 2)
        raise "calculator is empty" if left.nil? or right.nil?

        items << right #{operator} left
      end
    EOF
  end

  def push(item)
    items.push(item)
  end

  def value
    items.last
  end

  def tokens(str)
    str.split.map { |token| operator?(token) ? token.to_sym : convert_to_number(token) }
  end

  def evaluate(str)
    tokens(str).each do |token|
      method_name, _ = OPERATORS.rassoc(token)
      if method_name
        send(method_name)
      else
        push(token)
      end
    end

    value
  end

  private
    def items
      @item ||= Array.new
    end

    def operator?(str)
      OPERATORS.has_value?(str.to_sym)
    end

    def convert_to_number(str)
      str.index('.') ? str.to_f : str.to_i
    end
end
