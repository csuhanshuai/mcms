(function($){
	var _guid = 0;
	$.template = (function() {
		var EMPTY = '', RE_TRIM = /^[\s\xa0]+|[\s\xa0]+$/g, trim = String.prototype.trim;
		trim = trim ? function(str) {
			return str == null ? EMPTY : str.trim();
		} : function(str) {
			return str == null ? EMPTY : str.toString().replace(RE_TRIM, EMPTY);
		};
		var templateCache = {}, tagStartEnd = {
			'#' : 'start',
			'/' : 'end'
		}, KS_TEMPL_STAT_PARAM = 'KS_TEMPL_STAT_PARAM', KS_TEMPL_STAT_PARAM_REG = new RegExp(
				KS_TEMPL_STAT_PARAM, "g"), KS_TEMPL = 'KS_TEMPL', KS_DATA = 'KS_DATA_', KS_AS = 'as', PREFIX = '");', SUFFIX = KS_TEMPL
				+ '.push("', PARSER_SYNTAX_ERROR = 'Template: Syntax Error. ', PARSER_RENDER_ERROR = 'Template: Render Error. ', PARSER_PREFIX = 'var '
				+ KS_TEMPL + '=[],' + KS_TEMPL_STAT_PARAM + '=false;with(', PARSER_MIDDLE = '||{}){try{'
				+ KS_TEMPL + '.push("', PARSER_SUFFIX = '");}catch(e){' + KS_TEMPL
				+ '=["' + PARSER_RENDER_ERROR + '" + e.message]}};return '
				+ KS_TEMPL + '.join("");', restoreQuote = function(str) {
			return str.replace(/\\"/g, '"');
		}, escapeQuote = function(str) {
			return str.replace(/"/g, '\\"');
		}, guid = function(pre) {
			return (pre || EMPTY) + (_guid++);
		}, buildParser = function(tpl) {
			var _parser, _empty_index;
			return escapeQuote(
					trim(tpl).replace(/[\r\t\n]/g, ' ').replace(/\\/g, '\\\\'))
					.replace(
							/\{\{([#\/]?)(?!\}\})([^}]*)\}\}/g,
							function(all, expr, body) {
								_parser = "";
								body = restoreQuote(trim(body));
								if (expr) {
									_empty_index = body.indexOf(' ');
									body = _empty_index === -1 ? [ body, '' ] : [
											body.substring(0, _empty_index),
											body.substring(_empty_index) ];
									var operator = body[0], fn, args = trim(body[1]), opStatement = Statements[operator];
									if (opStatement && tagStartEnd[expr]) {
										fn = opStatement[tagStartEnd[expr]];
										_parser = String($.isFunction(fn) ? fn
												.apply(this, args.split(/\s+/))
												: fn.replace(
														KS_TEMPL_STAT_PARAM_REG,
														args));
									}
								} else {
									_parser = KS_TEMPL + '.push(' + 'typeof ('
											+ body + ') ==="undefined"?"":' + body
											+ ');';
								}
								return PREFIX + _parser + SUFFIX;
							});
		}, Statements = {
			'if' : {
				start : 'if(typeof (' + KS_TEMPL_STAT_PARAM
						+ ') !=="undefined" && ' + KS_TEMPL_STAT_PARAM + '){',
				end : '}'
			},
			'else' : {
				start : '}else{'
			},
			'elseif' : {
				start : '}else if(' + KS_TEMPL_STAT_PARAM + '){'
			},
			'each' : {
				start : function(obj, as, v, k) {
					var _ks_value = '_ks_value', _ks_index = '_ks_index';
					if (as === KS_AS && v) {
						_ks_value = v || _ks_value;
						_ks_index = k || _ks_index;
					}
					return '$.each(' + obj + ', function(' + _ks_index + ', '
							+ _ks_value + '){';
				},
				end : '});'
			},
			'!' : {
				start : '/*' + KS_TEMPL_STAT_PARAM + '*/'
			}
		};
		function Template(tpl) {
			if (!(templateCache[tpl])) {
				var _ks_data = guid(KS_DATA), func, o, _parser = [ PARSER_PREFIX,
						_ks_data, PARSER_MIDDLE, o = buildParser(tpl),
						PARSER_SUFFIX ];
				try {
					func = new Function(_ks_data, _parser.join(""));
				} catch (e) {
					_parser[3] = PREFIX + SUFFIX + PARSER_SYNTAX_ERROR + ','
							+ e.message + PREFIX + SUFFIX;
					func = new Function(_ks_data, _parser.join(""));
				}
				templateCache[tpl] = {
					name : _ks_data,
					o : o,
					parser : _parser.join(""),
					render : func
				};
			}
			return templateCache[tpl];
		}
		return Template;
	})();
})(window.Zepto || window.jQuery);