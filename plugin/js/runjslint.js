var path = '/home/nicola/.vim/plugin/js/';
load(path + 'fulljslint.js');
load(path + 'jslint.settings.js');
var input = read('/tmp/jslint'); 
var fileName = read('/tmp/jslintfile');
if (!JSLINT(input, jslintOpts)) {
	for (var i = 0; i < JSLINT.errors.length; i += 1) {
		var e = JSLINT.errors[i];
		if (e) {
			print(fileName.replace("\n",'') + ':' + (e.line + 1) + ':' + (e.character + 1) + ': ' + e.reason + ' ... ' + e.evidence + ' ... ');
		}
	}
} else {
	print("jslint: No problems.");
	quit();
}
