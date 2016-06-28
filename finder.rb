require 'tmpdir'

class Finder

  def initialize(repo)
    Dir.mktmpdir  do |dir|
      `git clone https://github.com/#{repo}.git #{dir}`
      Dir.chdir(dir) { @emails = `git log --pretty=format:'%an %ae%n%cn %ce'`}
    end
  end

  def all_contributors
    @emails.split("\n").uniq
  end
end
