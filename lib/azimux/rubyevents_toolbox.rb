require "foobara/all"

require "foobara/llm_backed_command"

module Azimux
  foobara_organization!

  module RubyeventsToolbox
    foobara_domain!

    foobara_depends_on Foobara::Ai::AnswerBot
  end
end

Foobara::Util.require_directory "#{__dir__}/../../src"
