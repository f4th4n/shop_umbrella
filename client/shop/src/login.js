import { config } from './config.js'

$('.submit').click(function () {
	console.log('go', $('.email').val(), config.host)
})
