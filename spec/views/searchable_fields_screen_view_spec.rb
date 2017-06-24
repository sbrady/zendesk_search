require 'spec_helper'

describe SearchableFieldsScreenView do

  let(:searchable_fields) {
    {
        'Users' => ['_id', 'name', 'alias'],
        'tickets' => ['_id', 'subject', 'assignee_id'],
    }
  }
  subject { SearchableFieldsScreenView.new(searchable_fields) }

  it 'displays the user searchableFields options' do
    user_fields = "Search Users With:\n_id\nname\nalias"
    expect(subject.render).to include(user_fields)
  end
  it 'displays the tickets searchableFields options' do
    ticket_fields = "Search tickets With:\n_id\nsubject\nassignee_id"
    expect(subject.render).to include(ticket_fields)
  end

end
