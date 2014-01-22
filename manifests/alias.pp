# A simple e-mail alias
#

define zarafa::alias (  #Name = alias email
  $mapTo,               #This is what the alias will be mapped to
) {
  concat::fragment{ "zarafa-alias-${name}-to-${mapTo}":
      target  => "/etc/postfix/aliases",
      content => "${name}      ${mapTo}",
  }
  notify{"zarafa-alias-${name}-to-${mapTo}": }
}
