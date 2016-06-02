let configs = '~/.vim/config**'

for config in split(globpath(configs, '*.vim'), "\n")
  execute 'source' config
endfor
