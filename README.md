# Control
[![Build Status](https://img.shields.io/travis/slogsdon/elixir-control.svg?style=flat)](https://travis-ci.org/slogsdon/elixir-control)
[![Coverage Status](https://img.shields.io/coveralls/slogsdon/elixir-control.svg?style=flat)](https://coveralls.io/r/slogsdon/elixir-control)
[![Hex.pm Version](http://img.shields.io/hexpm/v/control.svg?style=flat)](https://hex.pm/packages/control)

An exploratory look into functors, applicatives, and monads for Elixir. See [the accompanying blog post](http://www.slogsdon.com/functors-applicatives-and-monads-in-elixir/) for more details.

> More code, documentation, and tests are in progress.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add control to your list of dependencies in `mix.exs`:

        def deps do
          [{:control, "~> 0.0.1"}]
        end

  2. Ensure control is started before your application:

        def application do
          [applications: [:control]]
        end

## License

Control is released under the MIT License.

See [LICENSE](https://github.com/slogsdon/elixir-control/blob/master/LICENSE) for details.
