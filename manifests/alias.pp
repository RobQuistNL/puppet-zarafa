# A simple e-mail alias
#

define zarafa::alias (  #Name = alias email
  $mapto,               #This is what the alias will be mapped to
) {
  concat::fragment{ "zarafa-alias-${name}-to-${mapto}":
      target  => "/etc/postfix/aliases",
      content => "${name}      ${mapto}",
  }
  notify{"zarafa-alias-${name}-to-${mapto}": }
}
