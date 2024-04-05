server "makefishingfair.org", user: "deployer", roles: %w{app db web}
set :puma_systemctl_user, :system
