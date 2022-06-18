import { config } from './config.js'

var gameCode = ''
var channel = null

const startGame = (gameCode) => {
	const params = { game_code: gameCode }
	const socket = new Socket(`${config.wsHost}/mini-game`, { params })
	socket.connect()

	channel = socket.channel(`game:${gameCode}`, {})
	channel
		.join()
		.receive('ok', (resp) => {
			console.log('Joined successfully', resp)
		})
		.receive('error', (resp) => {
			console.log('Unable to join', resp)
		})

	channel
		.push('game:start')
		.receive('ok', (payload) => {
			$('.game-state').text(payload.game_state)
		})
		.receive('error', (err) => console.log('phoenix errored', err))
		.receive('timeout', () => console.log('timed out pushing'))

	channel.on('game:new_state', (payload) => {
		$('.game-state').text(payload.game_state)
	})
}

$('.start-game').click(function () {
	const inputRoom = $('.input-room').val()
	if (!inputRoom) return alert('input room cannot be blank')

	$('.game-wrapper').removeClass('hide')
	$('.create-room').addClass('hide')

	gameCode = inputRoom
	startGame(gameCode)
})

$('.hit').click(function () {
	channel.push('game:hit', { damage: 2 })
})
