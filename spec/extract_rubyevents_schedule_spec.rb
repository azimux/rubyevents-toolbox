RSpec.describe Azimux::RubyeventsToolbox::ExtractRubyeventsSchedule do
  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }
  let(:errors_hash) { outcome.errors_hash }

  let(:inputs) do
    {
      raw_input_text:,
      llm_model:,
      hints:
    }
  end
  # comes from https://web.archive.org/web/20251214035507/https://app.euruko.org/sessions?only_path=true&starts_at=2025-09-18
  let(:fixture) { "Euruko2025Agenda.html" }
  let(:raw_input_text) do
    raw_html = File.read("#{__dir__}/fixtures/#{fixture}")

    Azimux::RubyeventsToolbox::ExtractAndMassageUsefulText.run!(
      raw_input_text: raw_html,
      hints: "This is just one day of the event",
      llm_model:
    )
  end
  let(:llm_model) { Foobara::Ai::AnthropicApi::Types::ModelEnum::CLAUDE_FABLE_5_1 }
  let(:hints) { "Event id should be euruko-2025" }

  it "extracts valid schedule data", vcr: { record: :none } do
    expect(outcome).to be_success
    expect(result).to be_a(Azimux::RubyeventsToolbox::Types::Event)

    event = result

    # TODO: how does a multi-day event get reflected in videos.yml??
    # sometimes it reports this as the 17th (start day of the event) and sometimes the 18th
    # (the day all these talks happened)
    expect(event.date).to eq(Date.parse("2025-09-18"))
    expect(event.talks.size).to be(9)

    talks = event.talks

    talk = talks[0]

    expect(talk.speakers).to eq(['Yukihiro "Matz" Matsumoto'])
    expect(talk.language).to eq("English")
    expect(talk.date).to eq(Date.parse("2025-09-18"))

    talk = talks[1]

    expect(talk.speakers).to eq(["Marco Roth"])
    expect(talk.language).to eq("English")
    expect(talk.date).to eq(Date.parse("2025-09-18"))
    expect(talk.title).to eq("Introducing ReActionView: A new ActionView-Compatible ERB Engine")

    talk = talks[2]

    expect(talk.speakers).to eq(["Karen Jex"])
    expect(talk.language).to eq("English")
    expect(talk.date).to eq(Date.parse("2025-09-18"))
    expect(talk.title).to eq("Postgres Partitioning Best Practices")

    talk = talks[3]

    expect(talk.speakers).to eq(["Szymon Fiedler"])
    expect(talk.language).to eq("English")
    expect(talk.date).to eq(Date.parse("2025-09-18"))
    expect(talk.title).to eq("Rewrite with confidence: validating business rules through isolated testing")

    talk = talks[4]

    expect(talk.speakers).to eq(["Rémy Hannequin"])
    expect(talk.language).to eq("English")
    expect(talk.date).to eq(Date.parse("2025-09-18"))
    expect(talk.title).to eq("The hidden value of niche open-source projects")

    talk = talks[5]

    expect(talk.speakers).to eq(["Ivo Anjo"])
    expect(talk.language).to eq("English")
    expect(talk.date).to eq(Date.parse("2025-09-18"))
    expect(talk.title).to eq("How a Ruby profiler works: Stackprof under a microscope")

    talk = talks[6]

    expect(talk.speakers).to eq(['Sangyong Sim "Shia"'])
    expect(talk.language).to eq("English")
    expect(talk.date).to eq(Date.parse("2025-09-18"))
    expect(talk.title).to eq("Conquering Massive Traffic Spikes in Ruby Applications with Pitchfork")

    talk = talks[7]

    expect(talk.speakers).to eq(["Albert Pazderin"])
    expect(talk.language).to eq("English")
    expect(talk.date).to eq(Date.parse("2025-09-18"))
    expect(talk.title).to eq("Building interactive Ruby gem tutorials with Wasm – yes, right in the browser!")

    talk = talks[8]

    expect(talk.speakers).to eq(["Obie Fernandez"])
    expect(talk.language).to eq("English")
    expect(talk.date).to eq(Date.parse("2025-09-18"))
    expect(talk.title).to eq("Roasting Code for Fun & Profit with Structured AI Workflows")
  end
end
