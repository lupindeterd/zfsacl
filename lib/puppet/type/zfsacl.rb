require 'set'
require 'pathname'
Puppet::Type.newtype(:zfsacl) do
  @doc = "Manage nfs4v ACL entries on ZFS dataset using chmod"
  newparam(:path) do
    desc "Full path of dirs/files."
    isnamevar
    validate do |value|
      path = Pathname.new(value)
      unless path.absolute?
        raise ArgumentError, "Path must be absolute: #{path}"
      end
    end
  end

  newparam(:action) do
    desc "Operation that will be perform to path for ACLs."
    defaultto :set
    newvalues(:set, :unset)
  end

  newparam(:recursemode) do
    newvalues(:true, :false)
    defaultto :false
  end

  newproperty(:permission, :array_matching => :all) do
    desc "Array of ZFS ACL permissions"

    def insync?(is)
      Puppet.debug("#@resource[:name]}: Property is: permission -> is: #{is}")
      Puppet.debug("#@resource[:name]}: Property should: permission -> is: #{should}")
      if is.is_a?(Array) and @should.is_a?(Array)
        is.sort == @should.sort
      else 
        is.sort == @should
      end
    end

  end
  #End of permission property

end
