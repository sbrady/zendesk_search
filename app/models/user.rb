class User < Model
  has Organization, via: :organization_id
end
