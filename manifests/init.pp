class zarafa (
  $zarafaAdminLocation = params_lookup('zarafaAdminLocation'),
  ) {
  
  service{'postfix': 
    ensure => running
  }

  concat { "/etc/postfix/aliases":
      mode => 644,
      owner => root,
      group => root,
      ensure_newline => true
  }
  
  concat { "/etc/postfix/mydomains":
      mode => 644,
      owner => root,
      group => root,
      ensure_newline => true
  }

  #basic domains we need
  zarafa::domain{'localhost': }
  zarafa::domain{$::fqdn: }

  Zarafa::Alias<<||>>
  ->
  exec {'postmap /etc/postfix/aliases': 
    notify => Service['postfix']
  }

  Zarafa::Domain<<||>>
  ->
  exec {'postmap /etc/postfix/mydomains': 
    notify => Service['postfix']
  }

  Zarafa::Mailbox <<||>>

}
