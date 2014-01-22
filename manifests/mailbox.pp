# A generic mailbox for 1 user.
#

define zarafa::mailbox (       #Name = email address
  $username         = undef,  #Will most likely be the same as the e-mail address. Defaults to $emailAddress
  $fullName         = undef,  #A general readable name. Defaults to $emailAddress
  $password,                  #Password for the account
) {
  $zadmin = 'zarafa-admin'
  $emailAddress = $name
  
  if (undef == $username) {
    $realUsername = $emailAddress
  } else {
    $realUsername = $username
  }
  
  if (undef == $fullName) {
    $realFullName = $emailAddress
  } else {
    $realFullName = $fullName
  }

  exec{ "${zadmin} -c '${realUsername}' -p '${password}' -e '${emailAddress}' -f '${realFullName}'": } #@todo onlyif zarafa-admin --details {user} != Unable to resolve user

}
