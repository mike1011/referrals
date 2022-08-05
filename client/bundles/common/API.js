import axios from 'axios';
let baseAPIUrl;
if (process.env.NODE_ENV === 'production') {
	baseAPIUrl = 'https://referrals.com/api/v1/';
} else {
	baseAPIUrl = 'http://localhost:5000/api/v1/';
}
const instance = axios.create({
	baseURL: baseAPIUrl,
	responseType: 'json',
	timeout: 50000,
	credentials: 'same-origin',
	headers: {
		Accept: 'application/json, text/plain, */*',
		'X-Requested-With': 'XMLHttpRequest',
		'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
	}
});

export default instance;
