# A simple e-mail alias
#

define zarafa::domain { #Name = the domain
  concat::fragment{ "zarafa-domain-${name}":
      target  => "/etc/postfix/mydomains",
      content => "${name}      OK",
  }
  notify{"zarafa-domain-${name}": }
}
