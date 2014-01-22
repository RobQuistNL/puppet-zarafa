class zarafa (
  $zarafaAdminLocation = params_lookup('zarafaAdminLocation'),
  ) {

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

  Zarafa::Mailbox <<||>>

}
