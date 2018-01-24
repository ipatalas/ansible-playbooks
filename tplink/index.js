const { Client } = require('tplink-smarthome-api')

if (process.argv.length !== 3) {
	console.error('Missing plug address')
	return
}

const plugAddr = process.argv[2]

const client = new Client()
const plug = client.getPlug({host: plugAddr})

plug.emeter.getRealtime().then(r => {
	console.log(JSON.stringify(r));
}).catch(err => {
	console.error(err);
})
