RSpec.describe Azimux::RubyeventsToolbox::ExtractAndMassageUsefulText do
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
  let(:raw_input_text) { File.read("#{__dir__}/fixtures/#{fixture}") }
  let(:llm_model) { Foobara::Ai::AnthropicApi::Types::ModelEnum::CLAUDE_SONNET_5_5 }
  let(:hints) { "This is just one day of the event" }

  it "extracts useful schedule data", vcr: { record: :none } do
    expect(outcome).to be_success
    expect(result).to be_a(String)

    expect(result).to match(/euruko/i)
    expect(result).to match(/\b2025\b/i)
  end
end
