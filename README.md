# zfsacl

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with zfsacl](#setup)
    * [What zfsacl affects](#what-zfsacl-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with zfsacl](#beginning-with-zfsacl)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

A one-maybe-two sentence summary of what the module does/what problem it solves.
This is your 30 second elevator pitch for your module. Consider including
OS/Puppet version it works with.

## Module Description

## Setup

Provides a way to set non-trivial(nfs4) ACL on ZFS file-system via Puppet.

### What zfsacl affects

This module modify the settings of files and directories on a ZFS file-system.
This version only support setting(adding) ACL permission. Un-setting is not supported yet.

### Setup Requirements **OPTIONAL**

Aclmode and aclinherit settings should be enabled on ZFS file-system.



## Usage
```puppet
zfsacl { '/transfers/npt/out':
  action     => 'set',
  permission => [ 'user:wasuser:rw:f:allow',
                  'group:wasgroup:rx:d:allow',
                  'user:wasuser:rwx:f:allow',
                  'user:wasuser:rwx:fi:allow',
                ]
 }
```

## Reference

###zfsacl(Types) 
  This type will set the nfs4 style ACL on ZFS file-system. See Usage section.

## Limitations

Tested and developed on Solaris 11(x386). Puppet version 3.6.2

## Release Notes/Contributors/Etc **Optional**
- Initial Release
