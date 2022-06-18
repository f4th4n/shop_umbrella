import { config } from './config.js'

var gameCode = ''

const startGame = () => {
	let socket = new Socket(`${config.wsHost}/mini-game`, { params: {} })
	socket.connect()

	let channel = socket.channel('game', {})
	channel
		.join()
		.receive('ok', (resp) => {
			console.log('Joined successfully', resp)
		})
		.receive('error', (resp) => {
			console.log('Unable to join', resp)
		})

	channel
		.push('send_start_game')
		.receive('ok', (payload) => console.log('phoenix replied:', payload))
		.receive('error', (err) => console.log('phoenix errored', err))
		.receive('timeout', () => console.log('timed out pushing'))
}

$('.start-game').click(function () {
	const inputRoom = $('.input-room').val()
	if (!inputRoom) return alert('input room cannot be blank')

	$('.game-wrapper').removeClass('hide')
	$('.create-room').addClass('hide')

	gameCode = inputRoom
	startGame()
})

// f:test
startGame()
