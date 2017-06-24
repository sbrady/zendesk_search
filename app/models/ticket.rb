class Ticket < Model
  has Organization, via: :organization_id
  has User, via: :submitter_id
  has User, via: :assignee_id
end
