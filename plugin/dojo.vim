function! OpenDijitTemplate()
ruby << EOF
    buf= VIM::Buffer.current
    dir=File.dirname(buf.name)
    cls=File.basename(buf.name,'.js')
    template=File.join(dir,'templates',"#{cls}.html")

    if File.exists?(template)
      VIM::command "e #{template}" 
    else
      VIM::message "No template file #{template}"
    end
EOF
endfunction

function! OpenDijitCode()
ruby << EOF
    buf= VIM::Buffer.current
    dir=File.dirname(buf.name)
    cls=File.basename(buf.name,'.html')
    code_file=File.join(dir,'..',"#{cls}.js")

    if File.exists?(code_file)
      VIM::command "e #{code_file}" 
    else
      VIM::message "No code_file file #{code_file}"
    end
EOF
endfunction

function! OpenTestFile()
ruby << EOF
    buf= VIM::Buffer.current
    dir=File.dirname(buf.name)
    cls=File.basename(buf.name,'.js')

    dirs=dir.split('/')

    dirs.length.times do |i|
      level=dirs.length - i -1
      pdir = dirs[0..level].join('/')
      package_level =dirs.length - 1
      package = dirs[(level+1)..package_level].join('/')
      testpath="#{pdir}/tests/#{package}/#{cls}.js}"
      VIM::message testpath 
      if File.exists?(testpath)
        VIM::message testpath  
        exit
      end
    end
    VIM::message "Tests not found"
EOF
endfunction
