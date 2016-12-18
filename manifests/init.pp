class zfsacl {

  zfsacl { '/transfers/npt/out':
    action     => 'set',
    permission => [ 'user:wasuser:rw:f:allow',
                    'group:wasgroup:rx:d:allow',
                    'user:wasuser:rwx:f:allow',
                    'user:wasuser:rwx:fi:allow',
                  ]
  }

}
