let socket = new Socket("ws://localhost:4000/shop", {params: {}})
socket.connect()

let channel = socket.channel("flash_sale", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

setTimeout(() => {
	
	channel.push("send_flash_sale")
	  .receive("ok", payload => console.log("phoenix replied:", payload))
	  .receive("error", err => console.log("phoenix errored", err))
	  .receive("timeout", () => console.log("timed out pushing"))
}, 2000)
