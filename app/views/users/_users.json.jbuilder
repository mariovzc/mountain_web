json.users @users  do |user|
  json.first_name user.try(:first_name) 
  json.last_name user.try(:last_name)
  json.document user.try(:document)
  json.email user.try(:email)
  json.phone user.try(:phone)
end