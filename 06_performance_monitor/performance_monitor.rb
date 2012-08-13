def measure(n=1)
  elapsed_time = n.times.inject(0) do |sum, _|
    start_time = Time.now

    yield

    sum += Time.now - start_time
  end

  elapsed_time / n
end
