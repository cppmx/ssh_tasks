# Set root path
APP_ROOT = File.dirname(__FILE__)

# Unshift root dir
$:.unshift( APP_ROOT )

require "ssh_tasks/version"
require "core"

module SshTasks
    core = Core.new
    core.launch!
end
