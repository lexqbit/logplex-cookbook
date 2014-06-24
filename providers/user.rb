# Support whyrun
def whyrun_supported?
  true
end

action :create do
  converge_by("Create logplex user #{ @new_resource }") do
    create_user
  end
end

action :delete do
  converge_by("Delete logplex user #{ @new_resource }") do
    delete_user
  end
end

def create_user
  logplex_call "Create user: #{new_resource.user}" do
    code %Q(logplex_cred:store(logplex_cred:grant('#{new_resource.api}', logplex_cred:grant('#{new_resource.channel}', logplex_cred:rename(<<"Local-Test">>, logplex_cred:new(<<"#{new_resource.user}">>, <<"#{new_resource.password}">>))))).)
  end
end

def delete_user
  logplex_call "Delete user: #{new_resource.user}" do
    code %Q(logplex_cred:delete(<<"#{new_resource.user}">>).)
  end
end
