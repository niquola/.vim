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
def open
    buf= VIM::Buffer.current
    if buf.name =~ /test/ 
      code = buf.name.gsub!(/\/tests/,'').gsub!(/html$/,'js')

      if File.exists?(code)
        VIM::command "e #{code}" 
        return 
      end
    end

    dir=File.dirname(buf.name)
    cls=File.basename(buf.name,'.html')
    code_file=File.join(dir,'..',"#{cls}.js")

    if File.exists?(code_file)
      VIM::command "e #{code_file}" 
    else
      VIM::message "No code_file file #{code_file}"
    end
end
open
EOF
endfunction

function! OpenTestFile()
ruby << EOF
    buf= VIM::Buffer.current
    dir=File.dirname(buf.name)
    cls=File.basename(buf.name)

    dirs=dir.split('/')
    #empty element
    dirs.delete(-1)

    dirs.length.times do |i|
      level=dirs.length - i -1
      pdirs = dirs[0..level]
      package_level =dirs.length - 1
      package = dirs[(level+1)..package_level]
      testpath=(pdirs + ['tests'] + package + [cls]).join('/')
      if File.exists?(testpath)
        VIM::command "e #{testpath}" 
        break
      end
    end
EOF
endfunction

function! OpenTestHTMLFile()
ruby << EOF
    buf= VIM::Buffer.current
    dir=File.dirname(buf.name)
    cls=File.basename(buf.name)

    dirs=dir.split('/')
    #empty element
    dirs.delete(-1)

    dirs.length.times do |i|
      level=dirs.length - i -1
      pdirs = dirs[0..level]
      package_level =dirs.length - 1
      package = dirs[(level+1)..package_level]
      testpath=(pdirs + ['tests'] + package + [cls]).join('/').gsub!(/js$/,'html')
      if File.exists?(testpath)
        VIM::command "e #{testpath}" 
        break
      end
    end
EOF
endfunction

function! OpenCssFile()
ruby << EOF
    buf= VIM::Buffer.current
    dir=File.dirname(buf.name)
    cls=File.basename(buf.name,'.js')

    dirs=dir.split('/')
    #empty element
    dirs.delete(-1)

    dirs.length.times do |i|
      level=dirs.length - i -1
      pdirs = dirs[0..level]
      package_level =dirs.length - 1
      package = dirs[(level+1)..package_level]
      testpath=(pdirs + ['themes','tundra'] + package + ["#{cls}.css"]).join('/')
      if File.exists?(testpath)
        VIM::command "e #{testpath}" 
        break
      end
    end
EOF
endfunction

function! OpenCodeFileFromTest()
ruby << EOF
    buf= VIM::Buffer.current
    code = buf.name.gsub!(/\/tests/,'')

    if File.exists?(code)
      VIM::command "e #{code}" 
    else
      VIM::message "Code file #{code} not found"
    end
EOF
endfunction


function! OpenCodeFileFromCss()
ruby << EOF
    buf= VIM::Buffer.current
    code = buf.name.gsub!(/\/themes\/tundra/,'').gsub!(/\.css$/,'.js')
    if File.exists?(code)
      VIM::command "e #{code}" 
    else
      VIM::message "Code file #{code} not found"
    end
EOF
endfunction

function! OpenTemplateFileFromCss()
ruby << EOF
    buf= VIM::Buffer.current
    code = buf.name.gsub!(/\/themes\/tundra/,'').gsub!(/\.css$/,'.js')

    cls=File.basename(code,'.js')
    template=File.join(dir,'templates',"#{cls}.html")
    if File.exists?(template)
      VIM::command "e #{template}" 
    else
      VIM::message "No template file #{template}"
    end
EOF
endfunction

function! OpenStyleFromTemplate()
ruby << EOF
    dir=File.dirname(buf.name)
    cls=File.basename(buf.name,'.html')
    VIM::message buf.name
EOF
endfunction
