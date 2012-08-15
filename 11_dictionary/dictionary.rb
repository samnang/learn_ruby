class Dictionary
  def add(args)
    if args.is_a? Hash 
      entries.merge!(args)
    else
      entries[args] = nil
    end
  end

  def keywords
    entries.keys.sort
  end

  def include?(key)
    entries.key?(key)
  end

  def find(key)
    entries.select { |k, _| k.start_with?(key) }
  end

  def printable
    keywords.map { |k| "[%s] %s" % [k, entries[k].inspect] }.join("\n")
  end

  def entries
    @entries ||= Hash.new
  end
end
