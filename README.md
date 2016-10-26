# puppet-lint-metrics-check

[![Build Status](https://img.shields.io/travis/danzilio/puppet-lint-metrics-check.svg)](https://travis-ci.org/danzilio/puppet-lint-metrics-check)
[![Gem Version](https://img.shields.io/gem/v/puppet-lint-metrics-check.svg)](https://rubygems.org/gems/puppet-lint-metrics-check)
[![Gem Downloads](https://img.shields.io/gem/dt/puppet-lint-metrics-check.svg)](https://rubygems.org/gems/puppet-lint-metrics-check)

A puppet-lint plugin to analyze your code and report code quality metrics. Right now this code only supports the Assignment Branch Condition metric. For more information on how we compute this metric, please see [docs/abc_metric.md](docs/abc_metric.md).

## Installing
### From the command line
```shell
$ gem install puppet-lint-metrics-check
```

### In a Gemfile
```ruby
gem 'puppet-lint-metrics-check'
```

## Checks
### Assignment Branch Condition Size

This check calculates the Assignment Branch Condition (ABC) size for your manifest. By default, if the ABC size calculated for your manifest is above 30 a warning will be reported, if it's above 100 puppet-lint will report an error.

You can customize the warning and error thresholds using the `PuppetLint.configuration.metrics_abc_error` and `PuppetLint.configuration.metrics_abc_warning` methods. You can configure these values in your `Rakefile`.

#### To set the error threshold to 50

```ruby
PuppetLint.configuration.metrics_abc_error = 50
```

#### To set the warning threshold to 10

```ruby
PuppetLint.configuration.metrics_abc_error = 10
```

#### Disabling the check
To disable this check, you can add `--no-metrics-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-metrics-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_metrics')
```
