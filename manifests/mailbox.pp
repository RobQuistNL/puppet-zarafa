# A generic mailbox for 1 user.
#

class zarafa::mailbox (
  $emailAddress,              #Fully written out
  $username         = undef,  #Will most likely be the same as the e-mail address. Defaults to $emailAddress
  $name             = undef,  #A general readable name. Defaults to $emailAddress
  $password,                  #Password for the account
) {
  $zadmin = $zarafa::params::zarafaAdminLocation

  exec{ "${zadmin} -c '${username}' -p '${password}' -e '${emailAddress}' -f '${name}'": } #@todo onlyif zarafa-admin --details {user} != Unable to resolve user

}
