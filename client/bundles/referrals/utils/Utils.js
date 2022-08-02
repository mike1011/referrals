import { get, isUndefined } from "lodash";

export default {
	getCurrentUser: () => {
		return !isUndefined(get(APP_CONFIG, 'user.email'))
			? APP_CONFIG.user
			: null;
	},
	csrfToken: () => {
		return document.querySelector('[name="csrf-token"]').content;
	},

};
