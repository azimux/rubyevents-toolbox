module Azimux
  module RubyeventsToolbox
    module Types
      class Talk < Foobara::Model
        attributes do
          id :string, :allow_nil, "Usually the event slug prefixed by the speaker slug, like:" \
                                  "'ariel-juodziukynas-rubysur-meetup-august-2023' but will be excluded if not obvious how to construct it"
          title :string, :allow_nil
          raw_title :string, :allow_nil, "Always the same as title"
          event_name :string, :allow_nil, "Always the same as title"
          date :date, :allow_nil
          published_at :datetime, :allow_nil, "If we know when the video was published the timestamp will be here"
          language :string, :allow_nil, "Usually 'English' but could be 'Spanish' etc"
          slides_url :string, :allow_nil
          video_provider :string, :allow_nil, "Usually 'youtube'"
          video_id :string, :allow_nil, "For youtube, it's usually the id in the URL but missing if not obvious."
          talk_description :string, :allow_nil
          speakers [:string],
                   :allow_nil,
                   default: [],
                   description: "Full speaker names including nicknames. Usually just one speaker."
        end
      end
    end
  end
end
