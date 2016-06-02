let g:turbux_command_prefix = 'bx'

" Force to use `m` on hanami with Minitest
if isdirectory(getcwd() . '/spec/web') && executable('m')
  let g:turbux_command_rspec = 'm'
end

if !filereadable(getcwd() . '/spec/spec_helper.rb') && executable('m')
  let g:turbux_command_test_unit = 'm'
  let g:turbux_test_type         = 'minitest'
end
