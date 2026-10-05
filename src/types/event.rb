require_relative "talk"

module Azimux
  module RubyeventsToolbox
    module Types
      class Event < Foobara::Model
        attributes do
          id :string, :allow_nil, "Will be null if not obvious the date " \
                                  "or event needed to build a slug like 'rubysur-meetup-august-2023'"
          title :string, :allow_nil, "Something like 'RubySur Meetup August 2023'"
          raw_title :string, :allow_nil, "Usually the same as the title"
          event_name :string, :allow_nil, "Usually the same as the title"
          date :date, :allow_nil
          video_provider :string, :allow_nil, "Will just be 'children'"
          video_id :string, :allow_nil, "Usually the same as id"
          thumbnail_xs :string, :allow_nil, "Likely nil but if there's an obvious thumbnail URL then it will be here"
          thumbnail_sm :string, :allow_nil, "Likely nil but if there's an obvious thumbnail URL then it will be here"
          thumbnail_md :string, :allow_nil, "Likely nil but if there's an obvious thumbnail URL then it will be here"
          thumbnail_lg :string, :allow_nil, "Likely nil but if there's an obvious thumbnail URL then it will be here"
          thumbnail_xl :string, :allow_nil, "Likely nil but if there's an obvious thumbnail URL then it will be here"
          event_description :string, :allow_nil, "If possible to construct, would be something like:\n" \
                                                 "This is a collection of talks from the RubySur Meetup held on August 14th, 2023. \n\n" \
                                                 "https://ruby.com.ar/meetup/2023_08.html"
          talks [Talk], default: []
        end
      end
    end
  end
end
