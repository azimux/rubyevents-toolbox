module Azimux
  module RubyeventsToolbox
    class ExtractRubyeventsSchedule < Foobara::LlmBackedCommand
      description "Does the best it can to extract talks for rubyevents.org " \
                  "from unstructured data such as raw HTML from an events webpage"

      inputs do
        raw_input_text :string, :required
        hints :string, :allow_nil
        llm_model :symbol,
                  one_of: Foobara::Ai::AnswerBot::Types::ModelEnum,
                  default: "claude-sonnet-5"
        # default: "claude-sonnet-5-5"
        # default: "claude-opus-5-5"
        # default: "claude-fable-5-1"
      end

      result Types::Event
    end
  end
end
