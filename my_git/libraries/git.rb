class Git < Inspec.resource(1)
    name 'git'
   
    def initialize(path)
      @path=path
    end

    def branches
      inspec.command("git --git-dir #{@path} branch --format='%(refname:short)'").stdout.lines.map(&:strip)
    end

    def current_branch
      inspec.command("git --git-dir #{@path} branch --show-current").stdout.strip
    end
    
    def last_commit
      inspec.command("git --git-dir #{git_dir} log -1 --pretty=format:'%h'").stdout
      
    end
end