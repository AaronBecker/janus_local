skip_vim_plugin "command_t"
vim_plugin_task "extradite",        "git://github.com/int3/vim-extradite.git"
vim_plugin_task "gundo",            "git://github.com/sjl/gundo.vim.git"
vim_plugin_task "pathogen",         "git://github.com/tpope/vim-pathogen.git"
vim_plugin_task "pyflakes",         "git://github.com/kevinw/pyflakes-vim.git"


#vim_plugin_task "project",          "http://www.vim.org/scripts/download_script.php?src_id=6273" do
#  # Project.vim wants some unique maps that aren't actually unique and error out.
#  sh "sed 's/<unique>//' < plugin/project.vim > project.tmp && mv project.tmp plugin/project.vim"
#end

vim_plugin_task "local",            "git://github.com/AaronBecker/janus_local.git" do
  sh "cp tmp/local/*.local ."
  %w[ vimrc.local gvimrc.local ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path("../#{file}", __FILE__), dest)
    end
  end
end

vim_plugin_task "my_command_t",     "git://github.com/AaronBecker/Command-T.git" do
  sh "find ruby -name '.gitignore' | xargs rm"
end
