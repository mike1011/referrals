const plugin = [
	[
		'babel-plugin-transform-imports',
		{
			'@material-ui/core': {
				'transform': '@material-ui/core/${member}',
				'preventFullImport': true
			}
		}
	]
];

module.exports = { plugin };
