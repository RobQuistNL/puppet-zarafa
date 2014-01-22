class zarafa::domain
(
  $domainName,
) {

  #@@concat::fragment{ "zarafa_domain_${domainName}":
    #target  => '/etc/postfix/mydomains',
    #content => "${domainName}\tOK",
    #order  => '10',
    #tag => 'zarafa-domain',
  #}

  #exec {'postmap /etc/postfix/mydomains': }

}