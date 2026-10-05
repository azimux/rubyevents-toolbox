# Azimux::RubyeventsToolbox

## Installation

This isn't actually released so could vendor it or use it as a gem with `github:` in `Gemfile`

## Usage

Only two potentially useful commands in here at the moment:

```ruby
Azimux::RubyeventsToolbox::ExtractAndMassageUsefulText.run(
  raw_input_text:,
  llm_model:,
  hints:
)
```

Which will result in a `Event` object that has multiple `Talk` objects in it.

and

```ruby
Azimux::RubyeventsToolbox::ExtractAndMassageUsefulText.run(
  raw_input_text:,
  llm_model:,
  hints:
)
```

Which just returns a string that is extracted and prepared for passing to `ExtractAndMassageUsefulText`
to try to get better results when dealing with lots of markup and whatnot.

See the specs and fixtures for some examples!

## Contributing

Bug reports and pull requests are welcome on GitHub
at https://github.com/azimux/rubyevents-toolbox

## License

This project is licensed under the MPL-2.0 license. Please see LICENSE.txt for more info.
