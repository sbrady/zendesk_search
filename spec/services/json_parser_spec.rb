require 'spec_helper'

describe JsonParser do

  let(:path_to_file) { File.dirname(__FILE__)+'/users.json' }
  let(:expected_result) do
    [
        {
            _id: 1,
            url: "http://initech.zendesk.com/api/v2/users/1.json",
            name: "Francisca Rasmussen",
            organization_id: 119,
            tags: ["Springville", "Sutton"]
        },
        {
            _id: 2,
            url: "http://initech.zendesk.com/api/v2/users/2.json",
            name: "Sean Brady",
            organization_id: 222,
            tags: ["Ringwood", "Melbourne"]
        }
    ]

  end

  subject { JsonParser.new(path_to_file) }

  it 'returns the file as hashes' do
    expect(subject.parse).to eql(expected_result)
  end

end
