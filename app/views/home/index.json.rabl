object @user
attributes :id, :username

child :measures do
	attributes :user_id, :reading, :created_at
end
