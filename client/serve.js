const sirv = require('sirv');
const polka = require('polka');
const compress = require('compression')();
const { createProxyMiddleware } = require('http-proxy-middleware');

const PORT = process.env.PORT || 3000;

const APIPORT = process.env.APIPORT || 6900;
const APIHOST = process.env.APIHOST || "http://localhost";
const apihostport = `${APIHOST}:${APIPORT}`

polka()
	// todo: determine whether we need to set changeOrigin to true
	.use('/api', createProxyMiddleware({ target: apihostport, changeOrigin: false }))
	.use( compress, sirv('public'))
  .listen(PORT, err => {
    if (err) throw err;
    console.log(`> Running on localhost:${PORT}`);
    console.log(`> proxying /api to ${apihostport}`);
  });
