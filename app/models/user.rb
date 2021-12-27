class User
  include ActiveModel::Serialization
  include Her::JsonApi::Model
  # include Her::Model
  # use_api TESTE_API
  collection_path '/users'

  # type :user

end
