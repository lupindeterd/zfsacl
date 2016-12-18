Puppet::Type.type(:zfsacl).provide(:acl)do
  desc "Puppet ZFS ACL functions."

  confine :kernel => :SunOS

  commands :chmod => '/usr/bin/chmod'
  commands :ls    => '/usr/bin/ls'
 
  def exists?
    permission
  end 

  def set_perm(perm, path)
    opt = 'A+' + perm
    if check_recursive
      Puppet.debug "Setting perm with: #{opt} -R."
      chmod('-R', opt, resource[:path])
    else
      Puppet.debug "Setting perm with: #{opt} no -R."
      chmod(opt, resource[:path])
    end
  end

  def check_recursive
    resource[:recursemode] == :lazy ? true : false 
  end  
 
  def permission
    return [] unless File.exists?(resource[:path])
    value = []
    ls('-Vd', resource[:path]).split("\n").each do |line|
      if (line =~ /(user)|(group):/)
        newline = line.gsub('-', '')
        newline = newline.gsub(/\s+/, '')
        value << newline 
      end
    end
    value.sort
  end

  def permission=(value)
    Puppet.debug "Running: #{resource[:action]} with #{value}"
    case resource[:action]
      when :unset
        unset
        Puppet.debug "Running: #{resource[:action]}"
      when :set
        Puppet.debug "Running: #{resource[:action]}"
        Puppet.debug "Running: #{resource[:action]} with #{value}"
        value.each do |perm|
          set_perm(perm, resource[:path])
        end
      end
    end
end 
