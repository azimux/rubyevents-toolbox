module Azimux
  module RubyeventsToolbox
    class ExtractAndMassageUsefulText < Foobara::LlmBackedCommand
      description "Analyzes the raw_input_text and strips out HTML tags and javascript and " \
                  "even irrelevant text so that what remains is ideally the minimum required to" \
                  "determine all of the info about the event or day of the event and the talks that occurred. " \
                  "If helpful, some additional text gleaned from the markup/javascript/metadata/whatever will be added."

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

      result :string
    end
  end
end
