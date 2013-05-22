require 'facter'

key = "vmwaretemplate"

if File.exist?("/var/lib/puppet/template_details")
    val = File.readlines("/var/lib/puppet/template_details").first
else
    val = 'UNSET'
    end

val = val.split.join("\n")

Facter.add(key) do
  setcode do
    val
  end
end
