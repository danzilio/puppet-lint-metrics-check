require 'puppet-lint/metrics/abc'

PuppetLint.new_check(:abc_size) do
  def check
    @warn = PuppetLint.configuration.metrics_abc_warn || 30
    @fail = PuppetLint.configuration.metrics_abc_fail || 100

    parser = Puppet::Pops::Parser::EvaluatingParser.new
    program = parser.parse_string(manifest_lines.join)
    abc_metric = PuppetLint::Metrics::Abc.new

    abc_size = abc_metric.compute(program.model).last

    notification = {
      :message => "assignment branch condition size is #{abc_size}",
      :line    => 0,
      :column  => 0,
    }

    if @fail > abc_size
      if abc_size >= @warn
        notify :warning, notification
      end
    else
      notify :error, notification
    end
  end
end
