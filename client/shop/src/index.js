import { test } from './helper.js'

const app = () => {
	const authTask = () => {
		$('.auth .auth-not-logged-in').removeClass('hide')
		test()
		console.log('www')
	}

	const socketTask = () => {
		let socket = new Socket('ws://localhost:4000/shop', { params: {} })
		socket.connect()

		let channel = socket.channel('flash_sale', {})
		channel
			.join()
			.receive('ok', (resp) => {
				console.log('Joined successfully', resp)
			})
			.receive('error', (resp) => {
				console.log('Unable to join', resp)
			})

		channel
			.push('send_flash_sale')
			.receive('ok', (payload) => console.log('phoenix replied:', payload))
			.receive('error', (err) => console.log('phoenix errored', err))
			.receive('timeout', () => console.log('timed out pushing'))
	}

	authTask()
	socketTask()
}

app()
