load('/home/nicola/.vim/plugin/js/beautify.js');
var input = read('/tmp/jsbeautify');
var options = {
	indent_size: 1,
	indent_char: '\t'
};
print(js_beautify(input, options));
