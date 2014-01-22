class zarafa (
  $zarafaAdminLocation = params_lookup('zarafaAdminLocation'),
  ) {

  #basic domains we need
  zarafa::domain{'localhost': }
  zarafa::domain{$::fqdn: }

  #the alias files
  concat { "/etc/postfix/aliases":
      mode => 644,
      owner => root,
      group => root,
  }
  ->
  Zarafa::Alias<<||>>
  ->
  exec {'postmap /etc/postfix/aliases': }

  #the domains
  concat { "/etc/postfix/mydomains":
      mode => 644,
      owner => root,
      group => root,
  }
  ->
  Zarafa::Domain<<||>>
  ->
  exec {'postmap /etc/postfix/mydomains': }

  Zarafa::Mailbox <<||>>

}
